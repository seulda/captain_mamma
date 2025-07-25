import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';
import '../../../../core/usecases/usecase.dart';
import '../../domain/usecases/get_current_location.dart';
import '../../domain/usecases/search_restaurants.dart';
import 'map_event.dart';
import 'map_state.dart';

/// Map 기능을 관리하는 BLoC
class MapBloc extends Bloc<MapEvent, MapState> {
  final GetCurrentLocation getCurrentLocationUseCase;
  final SearchRestaurants searchRestaurantsUseCase;

  MapBloc({
    required this.getCurrentLocationUseCase,
    required this.searchRestaurantsUseCase,
  }) : super(const MapState()) {
    // 이벤트 핸들러 등록
    on<MapEvent>((event, emit) {
      event.when(
        requestLocationPermission: () => _onRequestLocationPermission(emit),
        getCurrentLocation: () => _onGetCurrentLocation(emit),
        setLocation: (latitude, longitude) =>
            _onSetLocation(latitude, longitude, emit),
        searchRestaurantsInBounds: (bounds, radius, types) =>
            _onSearchRestaurantsInBounds(bounds, radius, types, emit),
        searchNearbyRestaurants: (latitude, longitude, radius, types) =>
            _onSearchNearbyRestaurants(
                latitude, longitude, radius, types, emit),
        getRestaurantDetails: (restaurantId) =>
            _onGetRestaurantDetails(restaurantId, emit),
        setSearchRadius: (radius) => _onSetSearchRadius(radius, emit),
        toggleFoodType: (foodType) => _onToggleFoodType(foodType, emit),
        resetFilters: () => _onResetFilters(emit),
        setModalOpen: (isOpen) => _onSetModalOpen(isOpen, emit),
        setMapLoaded: (isLoaded) => _onSetMapLoaded(isLoaded, emit),
        clearLocationError: () => _onClearLocationError(emit),
        clearRestaurantError: () => _onClearRestaurantError(emit),
      );
    });
  }

  /// 위치 권한 요청
  Future<void> _onRequestLocationPermission(Emitter<MapState> emit) async {
    emit(state.copyWith(isLoadingLocation: true, locationFailure: null));

    // TODO: 위치 권한 요청 UseCase 구현 필요
    try {
      // 임시 구현
      await Future.delayed(const Duration(seconds: 1));
      emit(state.copyWith(
        isLoadingLocation: false,
        hasLocationPermission: true,
      ));
    } catch (e) {
      emit(state.copyWith(
        isLoadingLocation: false,
        hasLocationPermission: false,
      ));
    }
  }

  /// 현재 위치 가져오기
  Future<void> _onGetCurrentLocation(Emitter<MapState> emit) async {
    emit(state.copyWith(isLoadingLocation: true, locationFailure: null));

    final result = await getCurrentLocationUseCase(NoParams());

    result.fold(
      (failure) {
        debugPrint('위치 가져오기 실패: ${failure.message}');
        emit(state.copyWith(
          isLoadingLocation: false,
          locationFailure: failure,
        ));
      },
      (location) {
        debugPrint('위치 가져오기 성공: ${location.address}');
        emit(state.copyWith(
          isLoadingLocation: false,
          currentLocation: location,
          hasLocationPermission: true,
        ));
      },
    );
  }

  /// 특정 위치 설정
  Future<void> _onSetLocation(
    double latitude,
    double longitude,
    Emitter<MapState> emit,
  ) async {
    emit(state.copyWith(isLoadingLocation: true, locationFailure: null));

    // TODO: SetLocation UseCase 구현 필요
    try {
      // 임시 구현
      await Future.delayed(const Duration(milliseconds: 500));
      emit(state.copyWith(
        isLoadingLocation: false,
      ));
    } catch (e) {
      emit(state.copyWith(isLoadingLocation: false));
    }
  }

  /// 지도 영역 내 레스토랑 검색
  Future<void> _onSearchRestaurantsInBounds(
    bounds,
    double radius,
    List<String>? types,
    Emitter<MapState> emit,
  ) async {
    emit(state.copyWith(isLoadingRestaurants: true, restaurantFailure: null));

    final params = SearchRestaurantsParams(
      bounds: bounds,
      radius: radius,
      types: types,
    );

    final result = await searchRestaurantsUseCase(params);

    result.fold(
      (failure) {
        debugPrint('레스토랑 검색 실패: ${failure.message}');
        emit(state.copyWith(
          isLoadingRestaurants: false,
          restaurantFailure: failure,
        ));
      },
      (restaurants) {
        debugPrint('레스토랑 검색 성공: ${restaurants.length}개 발견');
        emit(state.copyWith(
          isLoadingRestaurants: false,
          restaurants: restaurants,
        ));
      },
    );
  }

  /// 주변 레스토랑 검색
  Future<void> _onSearchNearbyRestaurants(
    double latitude,
    double longitude,
    double radius,
    List<String>? types,
    Emitter<MapState> emit,
  ) async {
    emit(state.copyWith(isLoadingRestaurants: true, restaurantFailure: null));

    // TODO: SearchNearbyRestaurants UseCase 구현 필요
    try {
      // 임시 구현
      await Future.delayed(const Duration(seconds: 2));
      emit(state.copyWith(
        isLoadingRestaurants: false,
        restaurants: [], // 빈 리스트
      ));
    } catch (e) {
      emit(state.copyWith(isLoadingRestaurants: false));
    }
  }

  /// 레스토랑 상세 정보 가져오기
  Future<void> _onGetRestaurantDetails(
    String restaurantId,
    Emitter<MapState> emit,
  ) async {
    // TODO: GetRestaurantDetails UseCase 구현 필요
    debugPrint('레스토랑 상세 정보 요청: $restaurantId');
  }

  /// 검색 반경 설정
  void _onSetSearchRadius(double radius, Emitter<MapState> emit) {
    emit(state.copyWith(searchRadius: radius));
  }

  /// 음식 종류 필터 토글
  void _onToggleFoodType(String foodType, Emitter<MapState> emit) {
    final currentTypes = List<String>.from(state.selectedFoodTypes);

    if (currentTypes.contains(foodType)) {
      currentTypes.remove(foodType);
    } else {
      currentTypes.add(foodType);
    }

    emit(state.copyWith(selectedFoodTypes: currentTypes));
  }

  /// 필터 초기화
  void _onResetFilters(Emitter<MapState> emit) {
    emit(state.copyWith(
      searchRadius: 1.0,
      selectedFoodTypes: [],
    ));
  }

  /// 모달 열림 상태 설정
  void _onSetModalOpen(bool isOpen, Emitter<MapState> emit) {
    emit(state.copyWith(isModalOpen: isOpen));
  }

  /// 지도 로드 상태 설정
  void _onSetMapLoaded(bool isLoaded, Emitter<MapState> emit) {
    emit(state.copyWith(isMapLoaded: isLoaded));
  }

  /// 위치 에러 클리어
  void _onClearLocationError(Emitter<MapState> emit) {
    emit(state.copyWith(locationFailure: null));
  }

  /// 레스토랑 에러 클리어
  void _onClearRestaurantError(Emitter<MapState> emit) {
    emit(state.copyWith(restaurantFailure: null));
  }
}
