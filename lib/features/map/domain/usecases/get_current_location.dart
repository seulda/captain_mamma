import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/location.dart';
import '../repositories/map_repository.dart';

/// 현재 위치를 가져오는 UseCase
class GetCurrentLocation implements UseCase<Location, NoParams> {
  final MapRepository repository;

  const GetCurrentLocation(this.repository);

  @override
  Future<Either<Failure, Location>> call(NoParams params) async {
    return await repository.getCurrentLocation();
  }
}
