import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/restaurant.dart';
import '../repositories/map_repository.dart';

/// 레스토랑 검색 매개변수
class SearchRestaurantsParams extends Equatable {
  final LatLngBounds bounds;
  final double radius;
  final List<String>? types;

  const SearchRestaurantsParams({
    required this.bounds,
    required this.radius,
    this.types,
  });

  @override
  List<Object?> get props => [bounds, radius, types];
}

/// 지도 영역 내 레스토랑 검색 UseCase
class SearchRestaurants
    implements UseCase<List<Restaurant>, SearchRestaurantsParams> {
  final MapRepository repository;

  const SearchRestaurants(this.repository);

  @override
  Future<Either<Failure, List<Restaurant>>> call(
      SearchRestaurantsParams params) async {
    return await repository.searchRestaurantsInBounds(
      bounds: params.bounds,
      radius: params.radius,
      types: params.types,
    );
  }
}
