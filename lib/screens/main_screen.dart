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
import '../services/places_api_service.dart';
import '../widgets/admob_banner.dart';

// 플랫폼별 JavaScript interop은 services에서 처리

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  GoogleMapController? _mapController;
  final Set<Marker> _markers = {};

  // 웹에서 Google Maps API 로드 상태 관리
  bool _isGoogleMapsLoaded = false;

  // 모달 열림 상태 (지도 제스처 제어용)
  bool _isModalOpen = false;

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

  /// 지도 초기화 (플랫폼 공통)
  void _initializeWebGoogleMaps() async {
    // 모든 플랫폼에서 지도가 바로 사용 가능하도록 설정
    // 웹에서는 index.html에서 이미 Google Maps API가 로드됨
    setState(() {
      _isGoogleMapsLoaded = true;
    });
    debugPrint('✅ 지도 초기화 완료');
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
      body: Stack(
        children: [
          // 메인 컨텐츠
          // 지도와 광고영역을 분리한 Column 구조
          Column(
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
                                style:
                                    TextStyle(fontSize: 14, color: Colors.grey),
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
                      onTap: _isModalOpen ? null : _onMapTapped,
                      compassEnabled: !_isModalOpen,
                      rotateGesturesEnabled: !_isModalOpen,
                      scrollGesturesEnabled: !_isModalOpen,
                      tiltGesturesEnabled: !_isModalOpen,
                      zoomGesturesEnabled: !_isModalOpen,
                      mapToolbarEnabled: !_isModalOpen,
                      zoomControlsEnabled: false,
                    );
                  },
                ),
              ),

              // 임시로 AdMob 비활성화 (테스트용)
              Container(
                height: 50,
                width: double.infinity,
                color: Colors.amber[100],
                child: const Center(
                  child: Text(
                    '임시 배너 영역 (AdMob 비활성화)',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
            ],
          ),

          // 좌측 상단 위치 권한 버튼
          Positioned(
            top: 20,
            left: 20,
            child: Consumer<LocationProvider>(
              builder: (context, locationProvider, child) {
                return GestureDetector(
                  onTap: () {}, // 터치 이벤트 격리 (지도로 전파 방지)
                  child: FloatingActionButton(
                    onPressed: () {
                      debugPrint('🔥 위치 아이콘 클릭됨!');
                      _showLocationDialog(context);
                    },
                    backgroundColor: locationProvider.hasLocationPermission
                        ? (locationProvider.currentLocation != null
                            ? Colors.green[100]
                            : Colors.orange[100])
                        : Colors.red[100],
                    elevation: 4,
                    mini: true,
                    child: Icon(
                      locationProvider.hasLocationPermission
                          ? (locationProvider.currentLocation != null
                              ? Icons.location_on
                              : Icons.location_searching)
                          : Icons.location_off,
                      color: locationProvider.hasLocationPermission
                          ? (locationProvider.currentLocation != null
                              ? Colors.green[700]
                              : Colors.orange[700])
                          : Colors.red[700],
                    ),
                  ),
                );
              },
            ),
          ),

          // 우측 상단 햄버거 메뉴 버튼
          Positioned(
            top: 20,
            right: 20,
            child: GestureDetector(
              onTap: () {}, // 터치 이벤트 격리 (지도로 전파 방지)
              child: FloatingActionButton(
                onPressed: () => AppNavigation.toSettings(),
                backgroundColor: Colors.white,
                elevation: 4,
                mini: true,
                child: const Icon(
                  Icons.menu,
                  color: Colors.black87,
                ),
              ),
            ),
          ),

          // 하단 플로팅 컨트롤 영역 (광고 영역 위, 지도 내 하단)
          Positioned(
            bottom: 70, // 광고 배너(50px) + 여백(20px)
            left: 20,
            right: 20,
            child: GestureDetector(
              onTap: () {}, // 터치 이벤트 격리 (지도로 전파 방지)
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.6),
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.1),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    // 종류 선택 버튼
                    Expanded(
                      flex: 2,
                      child: ElevatedButton.icon(
                        onPressed: _showFilterDialog,
                        icon: const Icon(Icons.filter_list),
                        label: const Text('종류 선택'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white.withValues(alpha: 0.6),
                          foregroundColor: Colors.black87,
                          elevation: 2,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),

                    // 검색 반경 드롭다운
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.6),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                            color: Colors.grey.withValues(alpha: 0.3)),
                      ),
                      child: Consumer<RestaurantProvider>(
                        builder: (context, provider, child) {
                          return DropdownButton<double>(
                            value: provider.searchRadius,
                            underline: const SizedBox(),
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
                    ),
                    const SizedBox(width: 8),

                    // 검색 버튼
                    Expanded(
                      flex: 2,
                      child: ElevatedButton(
                        onPressed: _searchRestaurants,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Theme.of(context)
                              .primaryColor
                              .withValues(alpha: 0.6),
                          foregroundColor: Colors.white,
                          elevation: 2,
                        ),
                        child: const Text('검색'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // 우측 하단 수저포크 버튼 (랜덤 선택) - 플로팅 컨트롤 영역 바로 위쪽
          Positioned(
            bottom: 170, // 플로팅 컨트롤 영역(bottom: 70 + height + 여백) 바로 위
            right: 20,
            child: GestureDetector(
              onTap: () {}, // 터치 이벤트 격리 (지도로 전파 방지)
              child: Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.6),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.1),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: IconButton(
                  onPressed: _selectRandomRestaurant,
                  icon: const Icon(
                    Icons.restaurant,
                    color: Color(0xFFE57373),
                    size: 28,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showFilterDialog() {
    debugPrint('🔥 종류 선택 버튼 클릭됨! 모달 열기');
    setState(() {
      _isModalOpen = true; // 모달 열림 - 지도 제스처 비활성화
    });
    debugPrint('📋 지도 제스처 비활성화됨 (_isModalOpen: true)');

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      isDismissible: true, // 배경 클릭으로 닫기 (기본값)
      enableDrag: true, // 드래그로 닫기 허용 (기본값)
      backgroundColor: Colors.transparent,
      barrierColor: Colors.black.withValues(alpha: 0.7),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) => Stack(
        children: [
          // 전체 화면 투명 배경 (터치 시 모달 닫기)
          Positioned.fill(
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                color: Colors.transparent,
              ),
            ),
          ),

          // 하단 모달 영역
          DraggableScrollableSheet(
            initialChildSize: 0.5, // 화면 절반만 차지
            minChildSize: 0.3,
            maxChildSize: 0.8, // 최대 크기도 줄여서 상단 여백 확보
            builder: (context, scrollController) {
              return GestureDetector(
                onTap: () {}, // 모든 제스처를 여기서 차단
                child: NotificationListener<ScrollNotification>(
                  onNotification: (notification) {
                    // 모든 스크롤 이벤트 전파 차단
                    return true;
                  },
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white, // 하단 절반만 흰색 배경
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(16)),
                    ),
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // 헤더
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '종류 선택',
                              style: Theme.of(context).textTheme.headlineMedium,
                            ),
                            IconButton(
                              onPressed: () => Navigator.pop(context),
                              icon: const Icon(Icons.close),
                            ),
                          ],
                        ),

                        const SizedBox(height: 16),

                        // 종류 선택 내용
                        Expanded(
                          child: NotificationListener<ScrollNotification>(
                            onNotification: (notification) =>
                                false, // 내부 스크롤은 허용
                            child: SingleChildScrollView(
                              controller: scrollController,
                              physics:
                                  const BouncingScrollPhysics(), // 부드러운 스크롤
                              child: Consumer<RestaurantProvider>(
                                builder: (context, provider, child) {
                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                        children:
                                            FoodType.values.map((foodType) {
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
                                        children:
                                            MenuType.values.map((menuType) {
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
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            border: Border.all(
                                              color: Theme.of(context)
                                                  .primaryColor
                                                  .withValues(alpha: 0.3),
                                            ),
                                          ),
                                          child: Text(
                                            '선택된 필터가 적용되었습니다.',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium
                                                ?.copyWith(
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                        ),
                                        const SizedBox(height: 16),
                                      ],

                                      // 스크롤을 위한 추가 여백 (하단 버튼과 겹치지 않도록)
                                      const SizedBox(height: 100),
                                    ],
                                  );
                                },
                              ),
                            ),
                          ),
                        ),

                        // 하단 버튼들
                        Row(
                          children: [
                            Expanded(
                              child: OutlinedButton(
                                onPressed: () {
                                  context
                                      .read<RestaurantProvider>()
                                      .resetFilter();
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
                  ),
                ),
              );
            },
          ),
        ],
      ),
    ).then((_) {
      // 모달 닫힘 - 지도 제스처 다시 활성화
      debugPrint('📋 모달 닫힘! 지도 제스처 활성화');
      setState(() {
        _isModalOpen = false;
      });
      debugPrint('📋 지도 제스처 활성화됨 (_isModalOpen: false)');
    });
  }

  void _searchRestaurants() async {
    debugPrint('🔍 검색 버튼 클릭됨 - 현재 지도 영역의 음식점 검색 시작');

    // 지도 컨트롤러가 준비되지 않은 경우
    if (_mapController == null) {
      debugPrint('❌ 지도가 아직 로드되지 않았습니다.');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('지도가 로드되지 않았습니다. 잠시 후 다시 시도해주세요.')),
      );
      return;
    }

    try {
      // async 작업 전에 context에서 값 읽기
      final searchRadiusKm = context.read<RestaurantProvider>().searchRadius;

      // 현재 지도의 보이는 영역 가져오기
      final bounds = await _mapController!.getVisibleRegion();
      debugPrint('🗺️ 현재 지도 영역 정보:');
      debugPrint(
          '   북동쪽: ${bounds.northeast.latitude}, ${bounds.northeast.longitude}');
      debugPrint(
          '   남서쪽: ${bounds.southwest.latitude}, ${bounds.southwest.longitude}');

      // Places API로 음식점 검색
      final restaurants = await PlacesApiService.searchRestaurantsInBounds(
        bounds: bounds,
        radius: searchRadiusKm * 1000, // km를 m로 변환
      );

      // 검색 결과 콘솔 출력
      PlacesApiService.printRestaurantList(restaurants);

      // 사용자에게 결과 알림
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('🍽️ ${restaurants.length}개의 실제 음식점을 찾았습니다! (콘솔 확인)'),
            backgroundColor: Colors.green,
            action: SnackBarAction(
              label: '콘솔 보기',
              textColor: Colors.white,
              onPressed: () {
                debugPrint(
                    '💡 개발자 도구의 콘솔 탭에서 실제 Google Places API 검색 결과를 확인하세요.');
              },
            ),
          ),
        );
      }
    } catch (e) {
      debugPrint('❌ 음식점 검색 중 오류 발생: $e');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('검색 중 오류가 발생했습니다: $e')),
        );
      }
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

  // 위치 권한 상태 다이얼로그 표시 (간단 버전)
  void _showLocationDialog(BuildContext context) {
    final locationProvider = context.read<LocationProvider>();

    debugPrint('🔥 _showLocationDialog 실행됨!');

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('📍 위치 테스트'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
                '위치 권한: ${locationProvider.hasLocationPermission ? "허용됨" : "거부됨"}'),
            Text(
                '현재 위치: ${locationProvider.currentLocation?.latitude?.toStringAsFixed(4) ?? "없음"}, ${locationProvider.currentLocation?.longitude?.toStringAsFixed(4) ?? "없음"}'),
            if (locationProvider.currentLocation != null)
              Text('주소: ${locationProvider.currentLocation!.address}'),
            if (locationProvider.errorMessage != null) ...[
              const SizedBox(height: 8),
              Text('오류: ${locationProvider.errorMessage}',
                  style: const TextStyle(color: Colors.red)),
            ],
            const SizedBox(height: 16),
            const Text('🤖 애뮬레이터 테스트용:',
                style: TextStyle(fontWeight: FontWeight.bold)),
            const Text('• Extended Controls > Location\n• 아래 테스트 위치 버튼 사용',
                style: TextStyle(fontSize: 12)),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('닫기'),
          ),
          if (!locationProvider.hasLocationPermission)
            ElevatedButton(
              onPressed: () async {
                Navigator.pop(context);
                debugPrint('🔄 위치 권한 요청 시작');
                await locationProvider.requestLocationPermission();
                debugPrint('🔄 위치 권한 요청 완료');
              },
              child: const Text('위치 권한 요청'),
            ),
          ElevatedButton(
            onPressed: () async {
              Navigator.pop(context);
              // 서울역 위치로 테스트 설정
              debugPrint('🏢 테스트 위치 설정: 서울역');
              await locationProvider.setSelectedLocation(37.5565, 126.9720);
              debugPrint('✅ 테스트 위치 설정 완료');
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
            child: const Text('서울역 설정'),
          ),
        ],
      ),
    );
  }

  // 기존 복잡한 다이얼로그 (백업용)
  void _showLocationDialogOld(BuildContext context) {
    final locationProvider = context.read<LocationProvider>();

    // 디버그 정보 출력
    debugPrint('🔍 위치 다이얼로그 열기:');
    debugPrint('  - 위치 권한: ${locationProvider.hasLocationPermission}');
    debugPrint(
        '  - 현재 위치: ${locationProvider.currentLocation?.latitude}, ${locationProvider.currentLocation?.longitude}');
    debugPrint('  - 로딩 중: ${locationProvider.isLoading}');
    debugPrint('  - 에러 메시지: ${locationProvider.errorMessage}');

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('📍 위치 서비스'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (!locationProvider.hasLocationPermission) ...[
                const Text('위치 권한이 필요합니다.'),
                const SizedBox(height: 8),
                const Text('현재 위치를 찾아 주변 맛집을 검색하려면 위치 권한을 허용해주세요.'),
              ] else if (locationProvider.currentLocation == null) ...[
                const Text('현재 위치를 가져오는 중입니다...'),
                const SizedBox(height: 8),
                if (locationProvider.isLoading)
                  const CircularProgressIndicator()
                else
                  const Text('위치를 가져올 수 없습니다. 다시 시도해주세요.'),
              ] else ...[
                const Text('현재 위치:'),
                const SizedBox(height: 8),
                Text(locationProvider.currentLocation!.address),
                const SizedBox(height: 8),
                Text(
                    '위도: ${locationProvider.currentLocation!.latitude.toStringAsFixed(4)}'),
                Text(
                    '경도: ${locationProvider.currentLocation!.longitude.toStringAsFixed(4)}'),
              ],
              if (locationProvider.errorMessage != null) ...[
                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.red[50],
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    '⚠️ ${locationProvider.errorMessage}',
                    style: TextStyle(color: Colors.red[700]),
                  ),
                ),
              ],
            ],
          ),
          actions: [
            if (!locationProvider.hasLocationPermission) ...[
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('취소'),
              ),
              ElevatedButton(
                onPressed: () async {
                  Navigator.of(context).pop();
                  final granted =
                      await locationProvider.requestLocationPermission();
                  if (granted) {
                    _moveMapToCurrentLocation();
                  }
                },
                child: const Text('권한 허용'),
              ),
            ] else if (locationProvider.currentLocation == null) ...[
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('닫기'),
              ),
              ElevatedButton(
                onPressed: () async {
                  Navigator.of(context).pop();
                  await locationProvider.getCurrentLocation();
                  _moveMapToCurrentLocation();
                },
                child: const Text('다시 시도'),
              ),
            ] else ...[
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('닫기'),
              ),
              ElevatedButton(
                onPressed: () async {
                  Navigator.of(context).pop();
                  await locationProvider.getCurrentLocation();
                  _moveMapToCurrentLocation();
                },
                child: const Text('위치 새로고침'),
              ),
            ],
          ],
        );
      },
    );
  }
}
