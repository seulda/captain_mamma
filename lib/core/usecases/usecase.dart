import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../error/failures.dart';

/// 기본 UseCase 추상 클래스
abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

/// 매개변수가 없는 UseCase
class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}
