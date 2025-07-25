import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/location.dart';
import '../../domain/entities/restaurant.dart';

part 'map_state.freezed.dart';

/// Map 기능의 상태
@freezed
class MapState with _$MapState {
  const factory MapState({
    // 위치 관련 상태
    @Default(false) bool hasLocationPermission,
    @Default(false) bool isLoadingLocation,
    Location? currentLocation,
    Failure? locationFailure,

    // 레스토랑 검색 관련 상태
    @Default(false) bool isLoadingRestaurants,
    @Default([]) List<Restaurant> restaurants,
    Failure? restaurantFailure,

    // 검색 설정
    @Default(1.0) double searchRadius,
    @Default([]) List<String> selectedFoodTypes,

    // UI 상태
    @Default(false) bool isModalOpen,
    @Default(false) bool isMapLoaded,
  }) = _MapState;
}

/// Map 상태의 편의 메서드들
extension MapStateX on MapState {
  /// 위치 정보가 사용 가능한지 확인
  bool get hasValidLocation => hasLocationPermission && currentLocation != null;

  /// 에러가 있는지 확인
  bool get hasError => locationFailure != null || restaurantFailure != null;

  /// 어떤 로딩이든 진행 중인지 확인
  bool get isLoading => isLoadingLocation || isLoadingRestaurants;

  /// 검색 결과가 있는지 확인
  bool get hasRestaurants => restaurants.isNotEmpty;

  /// 현재 에러 메시지 반환
  String? get errorMessage {
    if (locationFailure != null) return locationFailure!.message;
    if (restaurantFailure != null) return restaurantFailure!.message;
    return null;
  }
}
