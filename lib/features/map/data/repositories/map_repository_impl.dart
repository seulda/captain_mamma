import 'package:dartz/dartz.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/location.dart';
import '../../domain/entities/restaurant.dart';
import '../../domain/repositories/map_repository.dart';
import '../datasources/location_datasource.dart';
import '../datasources/map_local_datasource.dart';
import '../datasources/map_remote_datasource.dart';
import '../models/location_model.dart';
import '../models/restaurant_model.dart';

/// MapRepository 구현체
class MapRepositoryImpl implements MapRepository {
  final MapRemoteDataSource remoteDataSource;
  final MapLocalDataSource localDataSource;
  final LocationDataSource locationDataSource;
  final NetworkInfo networkInfo;

  const MapRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.locationDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, Location>> getCurrentLocation() async {
    try {
      final locationModel = await locationDataSource.getCurrentLocation();

      // 위치 정보 캐시
      await localDataSource.cacheLocation(locationModel);

      return Right(locationModel.toDomain());
    } on LocationServiceException catch (e) {
      return Left(LocationServiceFailure(e.message));
    } on LocationPermissionException catch (e) {
      return Left(LocationPermissionFailure(e.message));
    } catch (e) {
      return Left(GeneralFailure('Failed to get current location: $e'));
    }
  }

  @override
  Future<Either<Failure, bool>> requestLocationPermission() async {
    try {
      final hasPermission =
          await locationDataSource.requestLocationPermission();

      // 권한 상태 캐시
      await localDataSource.saveLocationPermissionStatus(hasPermission);

      return Right(hasPermission);
    } on LocationPermissionException catch (e) {
      return Left(LocationPermissionFailure(e.message));
    } catch (e) {
      return Left(GeneralFailure('Failed to request location permission: $e'));
    }
  }

  @override
  bool hasLocationPermission() {
    // 캐시된 권한 상태를 동기적으로 반환
    // 실제 확인은 비동기 메서드에서 수행
    return locationDataSource.hasLocationPermission();
  }

  @override
  Future<Either<Failure, Location>> setLocation(
      double latitude, double longitude) async {
    try {
      final address = await locationDataSource.getAddressFromCoordinates(
          latitude, longitude);

      final locationModel = LocationModel(
        latitude: latitude,
        longitude: longitude,
        address: address,
        timestamp: DateTime.now(),
      );

      // 위치 정보 캐시
      await localDataSource.cacheLocation(locationModel);

      return Right(locationModel.toDomain());
    } on LocationServiceException catch (e) {
      return Left(LocationServiceFailure(e.message));
    } catch (e) {
      return Left(GeneralFailure('Failed to set location: $e'));
    }
  }

  Future<List<Restaurant>> _cacheAndConvertRestaurants(
      List<RestaurantModel> models) async {
    await localDataSource.cacheRestaurants(models);
    return models.map((model) => model.toDomain()).toList();
  }

  @override
  Future<Either<Failure, List<Restaurant>>> searchRestaurantsInBounds({
    required LatLngBounds bounds,
    required double radius,
    List<String>? types,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final restaurantModels =
            await remoteDataSource.searchRestaurantsInBounds(
          bounds: bounds,
          radius: radius,
          types: types,
        );

        final restaurants = await _cacheAndConvertRestaurants(restaurantModels);
        return Right(restaurants);
      } on PlacesApiException catch (e) {
        return Left(PlacesApiFailure(e.message));
      } on ServerException catch (e) {
        return Left(ServerFailure(e.message));
      } catch (e) {
        return Left(GeneralFailure('Failed to search restaurants: $e'));
      }
    } else {
      try {
        final cachedRestaurants = await localDataSource.getCachedRestaurants();
        final restaurants =
            cachedRestaurants.map((model) => model.toDomain()).toList();
        return Right(restaurants);
      } on CacheException catch (e) {
        return Left(CacheFailure(e.message));
      } catch (e) {
        return Left(NetworkFailure(
            'No internet connection and no cached data available'));
      }
    }
  }

  @override
  Future<Either<Failure, List<Restaurant>>> searchNearbyRestaurants({
    required double latitude,
    required double longitude,
    required double radius,
    List<String>? types,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final restaurantModels = await remoteDataSource.searchNearbyRestaurants(
          latitude: latitude,
          longitude: longitude,
          radius: radius,
          types: types,
        );

        final restaurants = await _cacheAndConvertRestaurants(restaurantModels);
        return Right(restaurants);
      } on PlacesApiException catch (e) {
        return Left(PlacesApiFailure(e.message));
      } on ServerException catch (e) {
        return Left(ServerFailure(e.message));
      } catch (e) {
        return Left(GeneralFailure('Failed to search nearby restaurants: $e'));
      }
    } else {
      try {
        final cachedRestaurants = await localDataSource.getCachedRestaurants();
        final restaurants =
            cachedRestaurants.map((model) => model.toDomain()).toList();
        return Right(restaurants);
      } on CacheException catch (e) {
        return Left(CacheFailure(e.message));
      } catch (e) {
        return Left(NetworkFailure(
            'No internet connection and no cached data available'));
      }
    }
  }

  @override
  Future<Either<Failure, Restaurant>> getRestaurantDetails(
      String restaurantId) async {
    if (await networkInfo.isConnected) {
      try {
        final restaurantModel =
            await remoteDataSource.getRestaurantDetails(restaurantId);
        return Right(restaurantModel.toDomain());
      } on PlacesApiException catch (e) {
        return Left(PlacesApiFailure(e.message));
      } on ServerException catch (e) {
        return Left(ServerFailure(e.message));
      } catch (e) {
        return Left(GeneralFailure('Failed to get restaurant details: $e'));
      }
    } else {
      return Left(NetworkFailure('No internet connection'));
    }
  }
}
