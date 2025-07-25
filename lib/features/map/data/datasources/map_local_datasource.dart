import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../../../../core/error/exceptions.dart';
import '../models/location_model.dart';
import '../models/restaurant_model.dart';

/// Map 로컬 데이터 소스 인터페이스
abstract class MapLocalDataSource {
  /// 마지막 위치 정보 캐시
  Future<void> cacheLocation(LocationModel location);

  /// 캐시된 마지막 위치 정보 가져오기
  Future<LocationModel> getLastLocation();

  /// 레스토랑 검색 결과 캐시
  Future<void> cacheRestaurants(List<RestaurantModel> restaurants);

  /// 캐시된 레스토랑 검색 결과 가져오기
  Future<List<RestaurantModel>> getCachedRestaurants();

  /// 위치 권한 상태 저장
  Future<void> saveLocationPermissionStatus(bool hasPermission);

  /// 위치 권한 상태 가져오기
  Future<bool> getLocationPermissionStatus();
}

/// Map 로컬 데이터 소스 구현체
class MapLocalDataSourceImpl implements MapLocalDataSource {
  final SharedPreferences sharedPreferences;

  static const String _lastLocationKey = 'LAST_LOCATION';
  static const String _cachedRestaurantsKey = 'CACHED_RESTAURANTS';
  static const String _locationPermissionKey = 'LOCATION_PERMISSION';

  const MapLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<void> cacheLocation(LocationModel location) async {
    try {
      final locationJson = json.encode(location.toJson());
      await sharedPreferences.setString(_lastLocationKey, locationJson);
    } catch (e) {
      throw const CacheException('Failed to cache location');
    }
  }

  @override
  Future<LocationModel> getLastLocation() async {
    try {
      final locationString = sharedPreferences.getString(_lastLocationKey);
      if (locationString == null) {
        throw const CacheException('No cached location found');
      }

      final locationJson = json.decode(locationString) as Map<String, dynamic>;
      return LocationModel.fromJson(locationJson);
    } catch (e) {
      throw const CacheException('Failed to get cached location');
    }
  }

  @override
  Future<void> cacheRestaurants(List<RestaurantModel> restaurants) async {
    try {
      final restaurantsJson = json.encode(
        restaurants.map((restaurant) => restaurant.toJson()).toList(),
      );
      await sharedPreferences.setString(_cachedRestaurantsKey, restaurantsJson);
    } catch (e) {
      throw const CacheException('Failed to cache restaurants');
    }
  }

  @override
  Future<List<RestaurantModel>> getCachedRestaurants() async {
    try {
      final restaurantsString =
          sharedPreferences.getString(_cachedRestaurantsKey);
      if (restaurantsString == null) {
        throw const CacheException('No cached restaurants found');
      }

      final restaurantsJson = json.decode(restaurantsString) as List<dynamic>;
      return restaurantsJson
          .map((json) => RestaurantModel.fromJson(json as Map<String, dynamic>))
          .toList();
    } catch (e) {
      throw const CacheException('Failed to get cached restaurants');
    }
  }

  @override
  Future<void> saveLocationPermissionStatus(bool hasPermission) async {
    try {
      await sharedPreferences.setBool(_locationPermissionKey, hasPermission);
    } catch (e) {
      throw const CacheException('Failed to save location permission status');
    }
  }

  @override
  Future<bool> getLocationPermissionStatus() async {
    try {
      return sharedPreferences.getBool(_locationPermissionKey) ?? false;
    } catch (e) {
      throw const CacheException('Failed to get location permission status');
    }
  }
}
