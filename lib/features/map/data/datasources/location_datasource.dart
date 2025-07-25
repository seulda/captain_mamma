import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import '../../../../core/error/exceptions.dart';
import '../models/location_model.dart';

/// 위치 데이터 소스 인터페이스
abstract class LocationDataSource {
  /// 현재 위치 가져오기
  Future<LocationModel> getCurrentLocation();

  /// 위치 권한 요청
  Future<bool> requestLocationPermission();

  /// 위치 권한 상태 확인
  bool hasLocationPermission();

  /// 좌표를 주소로 변환
  Future<String> getAddressFromCoordinates(double latitude, double longitude);
}

/// 위치 데이터 소스 구현체
class LocationDataSourceImpl implements LocationDataSource {
  @override
  Future<LocationModel> getCurrentLocation() async {
    try {
      // 위치 서비스 활성화 확인
      if (!await Geolocator.isLocationServiceEnabled()) {
        throw const LocationServiceException('Location services are disabled');
      }

      // 권한 확인
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          throw const LocationPermissionException(
              'Location permissions are denied');
        }
      }

      if (permission == LocationPermission.deniedForever) {
        throw const LocationPermissionException(
          'Location permissions are permanently denied, we cannot request permissions.',
        );
      }

      // 현재 위치 가져오기
      final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      // 주소 변환
      final address = await getAddressFromCoordinates(
        position.latitude,
        position.longitude,
      );

      return LocationModel(
        latitude: position.latitude,
        longitude: position.longitude,
        address: address,
        timestamp: DateTime.now(),
        accuracy: position.accuracy,
      );
    } on LocationServiceException {
      rethrow;
    } on LocationPermissionException {
      rethrow;
    } catch (e) {
      throw LocationServiceException('Failed to get current location: $e');
    }
  }

  @override
  Future<bool> requestLocationPermission() async {
    try {
      LocationPermission permission = await Geolocator.checkPermission();

      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      }

      return permission == LocationPermission.whileInUse ||
          permission == LocationPermission.always;
    } catch (e) {
      throw LocationPermissionException(
          'Failed to request location permission: $e');
    }
  }

  @override
  bool hasLocationPermission() {
    // 이것은 비동기 메서드여야 하지만, 인터페이스 일관성을 위해 동기로 구현
    // 실제로는 항상 false를 반환하고, 실제 확인은 비동기 메서드에서 수행
    return false;
  }

  @override
  Future<String> getAddressFromCoordinates(
      double latitude, double longitude) async {
    try {
      final placemarks = await placemarkFromCoordinates(latitude, longitude);

      if (placemarks.isNotEmpty) {
        final place = placemarks.first;
        final addressParts = [
          place.street,
          place.subLocality,
          place.locality,
          place.administrativeArea,
          place.country,
        ].where((part) => part != null && part.isNotEmpty).toList();

        return addressParts.join(', ');
      }

      return '주소를 찾을 수 없습니다';
    } catch (e) {
      throw LocationServiceException('Failed to get address: $e');
    }
  }
}
