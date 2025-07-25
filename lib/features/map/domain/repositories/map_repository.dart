import 'package:dartz/dartz.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../../core/error/failures.dart';
import '../entities/location.dart';
import '../entities/restaurant.dart';

/// Map 관련 기능을 위한 Repository 인터페이스
abstract class MapRepository {
  /// 현재 위치 가져오기
  Future<Either<Failure, Location>> getCurrentLocation();

  /// 위치 권한 요청
  Future<Either<Failure, bool>> requestLocationPermission();

  /// 위치 권한 상태 확인
  bool hasLocationPermission();

  /// 특정 위치 설정
  Future<Either<Failure, Location>> setLocation(
      double latitude, double longitude);

  /// 지도 영역 내 레스토랑 검색
  Future<Either<Failure, List<Restaurant>>> searchRestaurantsInBounds({
    required LatLngBounds bounds,
    required double radius,
    List<String>? types,
  });

  /// 특정 위치 주변 레스토랑 검색
  Future<Either<Failure, List<Restaurant>>> searchNearbyRestaurants({
    required double latitude,
    required double longitude,
    required double radius,
    List<String>? types,
  });

  /// 레스토랑 상세 정보 가져오기
  Future<Either<Failure, Restaurant>> getRestaurantDetails(String restaurantId);
}
