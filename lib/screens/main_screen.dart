import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../models/filter_model.dart';
import '../providers/location_provider.dart';
import '../providers/auth_provider.dart';
import '../providers/restaurant_provider.dart';
import '../utils/router.dart';
import '../utils/env_config.dart';

// 웹 플랫폼에서만 JavaScript 함수 호출을 위한 conditional import
import 'dart:js' as js show context;

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  GoogleMapController? _mapController;
  final Set<Marker> _markers = {};

  // 웹에서 Google Maps API 로드 상태 관리
  bool _isGoogleMapsLoaded = false;

  // 기본 지도 중심 (서울역)
  static const CameraPosition _defaultLocation = CameraPosition(
    target: LatLng(37.5565, 126.9720),
    zoom: 14.0,
  );

  @override
  void initState() {
    super.initState();
    _initializeWebGoogleMaps();
    _initializeLocation();
  }

  /// 웹 플랫폼에서 Google Maps API 로드 (간단한 방법)
  void _initializeWebGoogleMaps() async {
    if (kIsWeb) {
      final apiKey = EnvConfig.googleMapsApiKey;
      if (apiKey.isNotEmpty) {
        try {
          debugPrint('🔄 Google Maps API 로드를 시작합니다...');

          // JavaScript의 window.loadGoogleMapsAPI 함수 호출 (단순)
          js.context.callMethod('loadGoogleMapsAPI', [apiKey]);

          // 간단하게 2초 기다린 후 지도 표시 (대부분의 경우 충분함)
          await Future.delayed(const Duration(seconds: 2));

          setState(() {
            _isGoogleMapsLoaded = true;
          });

          debugPrint('✅ 웹에서 지도 표시를 시작합니다.');
        } catch (e) {
          debugPrint('❌ 웹에서 Google Maps API 로드 실패: $e');
          // 에러가 있어도 일단 지도를 표시해봄
          setState(() {
            _isGoogleMapsLoaded = true;
          });
        }
      } else {
        debugPrint('❌ 웹용 Google Maps API 키가 설정되지 않았습니다.');
        debugPrint('💡 해결 방법: ./scripts/run_web.bat으로 실행하세요.');
        // API 키가 없어도 일단 지도 영역은 표시
        setState(() {
          _isGoogleMapsLoaded = true;
        });
      }
    } else {
      // 웹이 아닌 플랫폼에서는 바로 로드됨으로 처리
      setState(() {
        _isGoogleMapsLoaded = true;
      });
    }
  }

  Future<void> _initializeLocation() async {
    final locationProvider = context.read<LocationProvider>();
    if (locationProvider.hasLocationPermission) {
      await locationProvider.getCurrentLocation();
      // 위치 획득 후 지도 중심 이동
      _moveMapToCurrentLocation();
    }
  }

  // Google Maps 관련 메서드들
  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
    _moveMapToCurrentLocation();
  }

  void _onMapTapped(LatLng position) {
    // 지도 탭 시 처리 (필요 시 구현)
    debugPrint('Map tapped at: ${position.latitude}, ${position.longitude}');
  }

  void _moveMapToCurrentLocation() {
    final locationProvider = context.read<LocationProvider>();
    if (_mapController != null && locationProvider.currentLocation != null) {
      final location = locationProvider.currentLocation!;
      _mapController!.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: LatLng(location.latitude, location.longitude),
            zoom: 16.0,
          ),
        ),
      );
    }
  }

  void _addRestaurantMarkers() {
    final restaurantProvider = context.read<RestaurantProvider>();
    setState(() {
      _markers.clear();
      for (var restaurant in restaurantProvider.restaurants) {
        _markers.add(
          Marker(
            markerId: MarkerId(restaurant.id),
            position: LatLng(restaurant.latitude, restaurant.longitude),
            infoWindow: InfoWindow(
              title: restaurant.name,
              snippet: restaurant.address,
              onTap: () {
                AppNavigation.toRestaurantDetail(restaurant.id);
              },
            ),
            icon: BitmapDescriptor.defaultMarkerWithHue(
              BitmapDescriptor.hueRed,
            ),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('🍽️ 선장님 오늘의 메뉴는요?'),
        actions: [
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () => AppNavigation.toSettings(),
          ),
        ],
      ),
      body: Column(
        children: [
          // Google Maps 영역
          Expanded(
            child: Consumer<LocationProvider>(
              builder: (context, locationProvider, child) {
                // 웹에서 Google Maps API 로드 대기
                if (kIsWeb && !_isGoogleMapsLoaded) {
                  return Container(
                    color: Colors.grey[100],
                    child: const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircularProgressIndicator(),
                          SizedBox(height: 16),
                          Text(
                            '🗺️ Google Maps를 로드하는 중...',
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(height: 8),
                          Text(
                            '잠시만 기다려주세요',
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  );
                }

                return GoogleMap(
                  onMapCreated: _onMapCreated,
                  initialCameraPosition: _defaultLocation,
                  markers: _markers,
                  myLocationEnabled: true,
                  myLocationButtonEnabled: true,
                  mapType: MapType.normal,
                  onTap: _onMapTapped,
                  compassEnabled: true,
                  rotateGesturesEnabled: true,
                  scrollGesturesEnabled: true,
                  tiltGesturesEnabled: true,
                  zoomGesturesEnabled: true,
                  zoomControlsEnabled: false,
                );
              },
            ),
          ),

          // 필터 및 검색 영역
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.1),
                  blurRadius: 8,
                  offset: const Offset(0, -2),
                ),
              ],
            ),
            child: Column(
              children: [
                // 필터 선택 버튼
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: _showFilterDialog,
                        icon: const Icon(Icons.filter_list),
                        label: const Text('필터 선택'),
                      ),
                    ),
                    const SizedBox(width: 12),
                    // 검색 반경 드롭다운
                    Consumer<RestaurantProvider>(
                      builder: (context, provider, child) {
                        return DropdownButton<double>(
                          value: provider.searchRadius,
                          items: const [
                            DropdownMenuItem(value: 0.5, child: Text('500m')),
                            DropdownMenuItem(value: 1.0, child: Text('1km')),
                            DropdownMenuItem(value: 2.0, child: Text('2km')),
                            DropdownMenuItem(value: 3.0, child: Text('3km')),
                            DropdownMenuItem(value: 4.0, child: Text('4km')),
                            DropdownMenuItem(value: 5.0, child: Text('5km')),
                          ],
                          onChanged: (value) {
                            if (value != null) {
                              provider.setSearchRadius(value);
                            }
                          },
                        );
                      },
                    ),
                  ],
                ),

                const SizedBox(height: 12),

                // 검색 버튼
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _searchRestaurants,
                    child: const Text('근처 맛집 찾기'),
                  ),
                ),
              ],
            ),
          ),

          // 광고 배너 영역 (임시)
          Container(
            height: 50,
            width: double.infinity,
            color: Colors.amber[100],
            child: const Center(
              child: Text(
                '광고 배너 영역',
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ),
        ],
      ),

      // 플로팅 액션 버튼 (랜덤 선택)
      floatingActionButton: FloatingActionButton(
        onPressed: _selectRandomRestaurant,
        backgroundColor: Colors.transparent,
        elevation: 0,
        child: const Icon(
          Icons.casino,
          size: 64,
          color: Color(0xFFE57373),
        ),
      ),

      // 하단 탭바
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        iconSize: 32,
        showSelectedLabels: false, // 선택된 라벨 숨기기
        showUnselectedLabels: false, // 선택되지 않은 라벨 숨기기
        onTap: (index) {
          if (index == 0) {
            // 홈 탭 - 현재 화면이므로 인덱스만 변경
            setState(() => _currentIndex = index);
          } else if (index == 1) {
            // 설정 탭 - 설정 화면으로 이동 (홈 탭 상태 유지)
            AppNavigation.toSettings();
            // 설정 화면으로 이동 후에도 홈 탭이 선택된 상태로 유지
            setState(() => _currentIndex = 0);
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: '',
          ),
        ],
      ),
    );
  }

  void _showFilterDialog() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.6,
        minChildSize: 0.3,
        maxChildSize: 0.9,
        builder: (context, scrollController) {
          return Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 헤더
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '필터 선택',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.close),
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                // 필터 선택 내용
                Expanded(
                  child: SingleChildScrollView(
                    controller: scrollController,
                    child: Consumer<RestaurantProvider>(
                      builder: (context, provider, child) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // 1번 필터: 음식 종류
                            Text(
                              '음식 종류',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            const SizedBox(height: 12),
                            Wrap(
                              spacing: 8,
                              runSpacing: 8,
                              children: FoodType.values.map((foodType) {
                                final isSelected = provider.filter
                                    .isFoodTypeSelected(foodType);
                                return FilterChip(
                                  label: Text(foodType.displayName),
                                  selected: isSelected,
                                  onSelected: (selected) {
                                    provider.toggleFoodType(foodType);
                                  },
                                  selectedColor: Theme.of(context)
                                      .primaryColor
                                      .withValues(alpha: 0.3),
                                  checkmarkColor:
                                      Theme.of(context).primaryColor,
                                );
                              }).toList(),
                            ),

                            const SizedBox(height: 24),

                            // 2번 필터: 메뉴 타입
                            Text(
                              '메뉴 타입',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            const SizedBox(height: 12),
                            Wrap(
                              spacing: 8,
                              runSpacing: 8,
                              children: MenuType.values.map((menuType) {
                                final isSelected = provider.filter
                                    .isMenuTypeSelected(menuType);
                                return FilterChip(
                                  label: Text(menuType.displayName),
                                  selected: isSelected,
                                  onSelected: (selected) {
                                    provider.toggleMenuType(menuType);
                                  },
                                  selectedColor: Theme.of(context)
                                      .primaryColor
                                      .withValues(alpha: 0.3),
                                  checkmarkColor:
                                      Theme.of(context).primaryColor,
                                );
                              }).toList(),
                            ),

                            const SizedBox(height: 24),

                            // 현재 선택된 필터 표시
                            if (provider.filter.hasActiveFilters) ...[
                              Text(
                                '선택된 필터',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              const SizedBox(height: 8),
                              Container(
                                width: double.infinity,
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: Theme.of(context)
                                      .primaryColor
                                      .withValues(alpha: 0.1),
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    color: Theme.of(context)
                                        .primaryColor
                                        .withValues(alpha: 0.3),
                                  ),
                                ),
                                child: Text(
                                  provider.filter.filterText,
                                  style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 16),
                            ],
                          ],
                        );
                      },
                    ),
                  ),
                ),

                // 하단 버튼들
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {
                          context.read<RestaurantProvider>().resetFilter();
                          Navigator.pop(context);
                        },
                        child: const Text('초기화'),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('적용'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  void _searchRestaurants() async {
    final locationProvider = context.read<LocationProvider>();
    final restaurantProvider = context.read<RestaurantProvider>();
    final authProvider = context.read<AuthProvider>();

    // 위치 권한 확인
    if (!locationProvider.hasLocationPermission) {
      AppNavigation.toLocationError();
      return;
    }

    // 검색 위치 결정
    final searchLocation = locationProvider.searchLocation;

    // 비회원이 위치 변경을 시도하는 경우
    if (!authProvider.isAuthenticated &&
        locationProvider.selectedLocation != null) {
      AppNavigation.toLogin();
      return;
    }

    // 레스토랑 검색
    await restaurantProvider.searchRestaurants(searchLocation);

    // 결과가 없는 경우
    if (restaurantProvider.restaurants.isEmpty) {
      AppNavigation.toNoResultsError();
      return;
    }

    // 검색 결과를 지도에 마커로 표시
    _addRestaurantMarkers();

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content:
              Text('${restaurantProvider.restaurants.length}개의 맛집을 찾았습니다!'),
          action: SnackBarAction(
            label: '목록 보기',
            onPressed: () {
              // TODO: 검색 결과 리스트 화면으로 이동
            },
          ),
        ),
      );
    }
  }

  void _selectRandomRestaurant() {
    final restaurantProvider = context.read<RestaurantProvider>();
    final randomRestaurant = restaurantProvider.getRandomRestaurant();

    if (randomRestaurant != null) {
      AppNavigation.toRestaurantDetail(randomRestaurant.id);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('먼저 맛집을 검색해주세요!'),
        ),
      );
    }
  }
}
