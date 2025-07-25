import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'map_event.freezed.dart';

/// Map 기능의 이벤트
@freezed
class MapEvent with _$MapEvent {
  // 위치 관련 이벤트
  const factory MapEvent.requestLocationPermission() =
      _RequestLocationPermission;
  const factory MapEvent.getCurrentLocation() = _GetCurrentLocation;
  const factory MapEvent.setLocation({
    required double latitude,
    required double longitude,
  }) = _SetLocation;

  // 레스토랑 검색 관련 이벤트
  const factory MapEvent.searchRestaurantsInBounds({
    required LatLngBounds bounds,
    required double radius,
    List<String>? types,
  }) = _SearchRestaurantsInBounds;

  const factory MapEvent.searchNearbyRestaurants({
    required double latitude,
    required double longitude,
    required double radius,
    List<String>? types,
  }) = _SearchNearbyRestaurants;

  const factory MapEvent.getRestaurantDetails({
    required String restaurantId,
  }) = _GetRestaurantDetails;

  // 검색 설정 이벤트
  const factory MapEvent.setSearchRadius({
    required double radius,
  }) = _SetSearchRadius;

  const factory MapEvent.toggleFoodType({
    required String foodType,
  }) = _ToggleFoodType;

  const factory MapEvent.resetFilters() = _ResetFilters;

  // UI 상태 이벤트
  const factory MapEvent.setModalOpen({
    required bool isOpen,
  }) = _SetModalOpen;

  const factory MapEvent.setMapLoaded({
    required bool isLoaded,
  }) = _SetMapLoaded;

  // 에러 클리어 이벤트
  const factory MapEvent.clearLocationError() = _ClearLocationError;
  const factory MapEvent.clearRestaurantError() = _ClearRestaurantError;
}
