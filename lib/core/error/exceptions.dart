/// 기본 예외 클래스
abstract class AppException implements Exception {
  final String message;
  const AppException(this.message);

  @override
  String toString() => 'AppException: $message';
}

/// 서버 관련 예외
class ServerException extends AppException {
  const ServerException([super.message = 'Server error occurred']);
}

/// 캐시 관련 예외
class CacheException extends AppException {
  const CacheException([super.message = 'Cache error occurred']);
}

/// 네트워크 관련 예외
class NetworkException extends AppException {
  const NetworkException([super.message = 'Network error occurred']);
}

/// 위치 권한 관련 예외
class LocationPermissionException extends AppException {
  const LocationPermissionException(
      [super.message = 'Location permission denied']);
}

/// 위치 서비스 관련 예외
class LocationServiceException extends AppException {
  const LocationServiceException(
      [super.message = 'Location service unavailable']);
}

/// Places API 관련 예외
class PlacesApiException extends AppException {
  const PlacesApiException([super.message = 'Places API error occurred']);
}

/// 파싱 관련 예외
class ParsingException extends AppException {
  const ParsingException([super.message = 'Data parsing error occurred']);
}
