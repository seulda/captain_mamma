import 'package:equatable/equatable.dart';

/// 기본 실패 추상 클래스
abstract class Failure extends Equatable {
  final String message;

  const Failure(this.message);

  @override
  List<Object> get props => [message];
}

/// 서버 관련 실패
class ServerFailure extends Failure {
  const ServerFailure([super.message = 'Server error occurred']);
}

/// 캐시 관련 실패
class CacheFailure extends Failure {
  const CacheFailure([super.message = 'Cache error occurred']);
}

/// 네트워크 관련 실패
class NetworkFailure extends Failure {
  const NetworkFailure([super.message = 'Network error occurred']);
}

/// 유효성 검사 실패
class ValidationFailure extends Failure {
  const ValidationFailure([super.message = 'Validation failed']);
}

/// 위치 권한 관련 실패
class LocationPermissionFailure extends Failure {
  const LocationPermissionFailure(
      [super.message = 'Location permission denied']);
}

/// 위치 서비스 관련 실패
class LocationServiceFailure extends Failure {
  const LocationServiceFailure(
      [super.message = 'Location service unavailable']);
}

/// Places API 관련 실패
class PlacesApiFailure extends Failure {
  const PlacesApiFailure([super.message = 'Places API error occurred']);
}

/// 일반적인 실패
class GeneralFailure extends Failure {
  const GeneralFailure([super.message = 'An unexpected error occurred']);
}
