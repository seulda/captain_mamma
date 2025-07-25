import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../../core/di/injection_container.dart' as di;
import '../../../../core/widgets/loading_widget.dart';
import '../bloc/map_bloc.dart';
import '../bloc/map_event.dart';
import '../bloc/map_state.dart';

/// 지도 메인 페이지 (Clean Architecture 버전)
class MapPage extends StatelessWidget {
  const MapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          di.sl<MapBloc>()..add(const MapEvent.setMapLoaded(isLoaded: true)),
      child: const MapView(),
    );
  }
}

/// 지도 메인 뷰
class MapView extends StatefulWidget {
  const MapView({super.key});

  @override
  State<MapView> createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  GoogleMapController? _mapController;
  final Set<Marker> _markers = {};

  // 기본 지도 중심 (서울역)
  static const CameraPosition _defaultLocation = CameraPosition(
    target: LatLng(37.5565, 126.9720),
    zoom: 14.0,
  );

  @override
  void initState() {
    super.initState();
    _initializeLocation();
  }

  void _initializeLocation() {
    context.read<MapBloc>().add(const MapEvent.getCurrentLocation());
  }

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
    _moveMapToCurrentLocation();
  }

  void _onMapTapped(LatLng position) {
    debugPrint('Map tapped at: ${position.latitude}, ${position.longitude}');
  }

  void _moveMapToCurrentLocation() {
    final state = context.read<MapBloc>().state;
    if (_mapController != null && state.currentLocation != null) {
      final location = state.currentLocation!;
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

  Future<void> _searchRestaurants() async {
    if (_mapController == null) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('지도가 로드되지 않았습니다. 잠시 후 다시 시도해주세요.')),
        );
      }
      return;
    }

    try {
      final bounds = await _mapController!.getVisibleRegion();
      if (mounted) {
        final state = context.read<MapBloc>().state;
        context.read<MapBloc>().add(MapEvent.searchRestaurantsInBounds(
              bounds: bounds,
              radius: state.searchRadius * 1000, // km를 m로 변환
              types: state.selectedFoodTypes.isNotEmpty
                  ? state.selectedFoodTypes
                  : null,
            ));
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('검색 중 오류가 발생했습니다: $e')),
        );
      }
    }
  }

  void _showLocationDialog() {
    showDialog(
      context: context,
      builder: (context) => BlocBuilder<MapBloc, MapState>(
        builder: (context, state) {
          return AlertDialog(
            title: const Text('📍 위치 테스트'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('위치 권한: ${state.hasLocationPermission ? "허용됨" : "거부됨"}'),
                if (state.currentLocation != null) ...[
                  Text(
                      '현재 위치: ${state.currentLocation!.latitude.toStringAsFixed(4)}, ${state.currentLocation!.longitude.toStringAsFixed(4)}'),
                  Text('주소: ${state.currentLocation!.address}'),
                ],
                if (state.locationFailure != null) ...[
                  const SizedBox(height: 8),
                  Text('오류: ${state.locationFailure!.message}',
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
              if (!state.hasLocationPermission)
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    context
                        .read<MapBloc>()
                        .add(const MapEvent.requestLocationPermission());
                  },
                  child: const Text('위치 권한 요청'),
                ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  context.read<MapBloc>().add(const MapEvent.setLocation(
                        latitude: 37.5565,
                        longitude: 126.9720,
                      ));
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                child: const Text('서울역 설정'),
              ),
            ],
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<MapBloc, MapState>(
        listener: (context, state) {
          // 에러 처리
          if (state.locationFailure != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.locationFailure!.message),
                backgroundColor: Colors.red,
              ),
            );
          }

          if (state.restaurantFailure != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.restaurantFailure!.message),
                backgroundColor: Colors.red,
              ),
            );
          }

          // 레스토랑 검색 성공
          if (state.hasRestaurants) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('🍽️ ${state.restaurants.length}개의 레스토랑을 찾았습니다!'),
                backgroundColor: Colors.green,
              ),
            );
          }
        },
        builder: (context, state) {
          return Stack(
            children: [
              // 메인 컨텐츠
              Column(
                children: [
                  // Google Maps 영역
                  Expanded(
                    child: _buildMap(state),
                  ),
                  // 임시 배너 영역
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

              // 플로팅 UI 요소들
              _buildFloatingElements(state),

              // 로딩 오버레이
              if (state.isLoading)
                Container(
                  color: Colors.black26,
                  child: const AppLoadingWidget(message: '처리 중...'),
                ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildMap(MapState state) {
    if (kIsWeb && !state.isMapLoaded) {
      return Container(
        color: Colors.grey[100],
        child: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 16),
              Text('🗺️ Google Maps를 로드하는 중...',
                  style: TextStyle(fontSize: 16)),
              SizedBox(height: 8),
              Text('잠시만 기다려주세요',
                  style: TextStyle(fontSize: 14, color: Colors.grey)),
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
      onTap: state.isModalOpen ? null : _onMapTapped,
      compassEnabled: !state.isModalOpen,
      rotateGesturesEnabled: !state.isModalOpen,
      scrollGesturesEnabled: !state.isModalOpen,
      tiltGesturesEnabled: !state.isModalOpen,
      zoomGesturesEnabled: !state.isModalOpen,
      mapToolbarEnabled: !state.isModalOpen,
      zoomControlsEnabled: false,
    );
  }

  Widget _buildFloatingElements(MapState state) {
    return Stack(
      children: [
        // 좌측 상단 위치 권한 버튼
        Positioned(
          top: 20,
          left: 20,
          child: FloatingActionButton(
            onPressed: _showLocationDialog,
            backgroundColor: state.hasLocationPermission
                ? (state.currentLocation != null
                    ? Colors.green[100]
                    : Colors.orange[100])
                : Colors.red[100],
            elevation: 4,
            mini: true,
            child: Icon(
              state.hasLocationPermission
                  ? (state.currentLocation != null
                      ? Icons.location_on
                      : Icons.location_searching)
                  : Icons.location_off,
              color: state.hasLocationPermission
                  ? (state.currentLocation != null
                      ? Colors.green[700]
                      : Colors.orange[700])
                  : Colors.red[700],
            ),
          ),
        ),

        // 우측 상단 햄버거 메뉴 버튼
        Positioned(
          top: 20,
          right: 20,
          child: FloatingActionButton(
            onPressed: () {
              // TODO: 설정 페이지로 이동
            },
            backgroundColor: Colors.white,
            elevation: 4,
            mini: true,
            child: const Icon(Icons.menu, color: Colors.black87),
          ),
        ),

        // 하단 검색 컨트롤
        Positioned(
          bottom: 70,
          left: 20,
          right: 20,
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
                // 필터 버튼
                Expanded(
                  flex: 2,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      context
                          .read<MapBloc>()
                          .add(const MapEvent.setModalOpen(isOpen: true));
                      // TODO: 필터 모달 표시
                    },
                    icon: const Icon(Icons.filter_list),
                    label: const Text('종류 선택'),
                  ),
                ),
                const SizedBox(width: 8),

                // 반경 드롭다운
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.6),
                    borderRadius: BorderRadius.circular(8),
                    border:
                        Border.all(color: Colors.grey.withValues(alpha: 0.3)),
                  ),
                  child: DropdownButton<double>(
                    value: state.searchRadius,
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
                        context
                            .read<MapBloc>()
                            .add(MapEvent.setSearchRadius(radius: value));
                      }
                    },
                  ),
                ),
                const SizedBox(width: 8),

                // 검색 버튼
                Expanded(
                  flex: 2,
                  child: ElevatedButton(
                    onPressed:
                        state.isLoadingRestaurants ? null : _searchRestaurants,
                    child: state.isLoadingRestaurants
                        ? const SizedBox(
                            width: 16,
                            height: 16,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : const Text('검색'),
                  ),
                ),
              ],
            ),
          ),
        ),

        // 랜덤 선택 버튼
        Positioned(
          bottom: 170,
          right: 20,
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
              onPressed: () {
                if (state.hasRestaurants) {
                  // TODO: 랜덤 레스토랑 선택
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('먼저 맛집을 검색해주세요!')),
                  );
                }
              },
              icon: const Icon(
                Icons.restaurant,
                color: Color(0xFFE57373),
                size: 28,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
