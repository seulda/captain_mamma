import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/location_model.dart';

class LocationProvider extends ChangeNotifier {
  LocationModel? _currentLocation;
  LocationModel? _selectedLocation;
  bool _isLoading = false;
  String? _errorMessage;
  bool _hasLocationPermission = false;

  LocationModel? get currentLocation => _currentLocation;
  LocationModel? get selectedLocation => _selectedLocation;
  LocationModel get searchLocation =>
      _selectedLocation ?? _currentLocation ?? LocationModel.defaultLocation();
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  bool get hasLocationPermission => _hasLocationPermission;

  LocationProvider() {
    _checkLocationPermission();
  }

  // 위치 권한 확인
  Future<void> _checkLocationPermission() async {
    try {
      final status = await Permission.location.status;
      _hasLocationPermission = status == PermissionStatus.granted;

      if (_hasLocationPermission) {
        await getCurrentLocation();
      }

      notifyListeners();
    } catch (e) {
      debugPrint('위치 권한 확인 실패: $e');
    }
  }

  // 위치 권한 요청
  Future<bool> requestLocationPermission() async {
    try {
      final status = await Permission.location.request();
      _hasLocationPermission = status == PermissionStatus.granted;

      if (_hasLocationPermission) {
        await getCurrentLocation();
      } else {
        _setError('위치 권한이 필요합니다.');
      }

      notifyListeners();
      return _hasLocationPermission;
    } catch (e) {
      debugPrint('위치 권한 요청 실패: $e');
      _setError('위치 권한 요청 중 오류가 발생했습니다.');
      return false;
    }
  }

  // 현재 위치 가져오기
  Future<void> getCurrentLocation() async {
    if (!_hasLocationPermission) {
      _setError('위치 권한이 없습니다.');
      return;
    }

    _setLoading(true);
    _clearError();

    try {
      final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
        timeLimit: const Duration(seconds: 10),
      );

      final address = await _getAddressFromCoordinates(
        position.latitude,
        position.longitude,
      );

      _currentLocation = LocationModel(
        latitude: position.latitude,
        longitude: position.longitude,
        address: address,
        timestamp: DateTime.now(),
      );

      await _saveCurrentLocation();
      notifyListeners();
    } catch (e) {
      debugPrint('현재 위치 가져오기 실패: $e');
      _setError('현재 위치를 가져올 수 없습니다.');
      await _loadSavedLocation();
    } finally {
      _setLoading(false);
    }
  }

  // 특정 위치 설정 (로그인한 사용자만)
  Future<void> setSelectedLocation(double latitude, double longitude) async {
    _setLoading(true);
    _clearError();

    try {
      final address = await _getAddressFromCoordinates(latitude, longitude);

      _selectedLocation = LocationModel(
        latitude: latitude,
        longitude: longitude,
        address: address,
        timestamp: DateTime.now(),
      );

      await _saveSelectedLocation();
      notifyListeners();
    } catch (e) {
      debugPrint('위치 설정 실패: $e');
      _setError('위치 설정 중 오류가 발생했습니다.');
    } finally {
      _setLoading(false);
    }
  }

  // 주소로 위치 검색
  Future<List<LocationModel>> searchLocationByAddress(String address) async {
    try {
      final locations = await locationFromAddress(address);

      List<LocationModel> results = [];
      for (final location in locations) {
        final addressString = await _getAddressFromCoordinates(
          location.latitude,
          location.longitude,
        );

        results.add(LocationModel(
          latitude: location.latitude,
          longitude: location.longitude,
          address: addressString,
          timestamp: DateTime.now(),
        ));
      }

      return results;
    } catch (e) {
      debugPrint('주소 검색 실패: $e');
      return [];
    }
  }

  // 선택된 위치 초기화
  void clearSelectedLocation() {
    _selectedLocation = null;
    _clearSelectedLocation();
    notifyListeners();
  }

  // 좌표로부터 주소 가져오기
  Future<String> _getAddressFromCoordinates(
      double latitude, double longitude) async {
    try {
      final placemarks = await placemarkFromCoordinates(latitude, longitude);
      if (placemarks.isNotEmpty) {
        final place = placemarks.first;
        return '${place.administrativeArea ?? ''} ${place.locality ?? ''} ${place.subLocality ?? ''}';
      }
      return '주소 불명';
    } catch (e) {
      debugPrint('주소 변환 실패: $e');
      return '주소 불명';
    }
  }

  // 현재 위치 저장
  Future<void> _saveCurrentLocation() async {
    if (_currentLocation == null) return;

    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setDouble('currentLatitude', _currentLocation!.latitude);
      await prefs.setDouble('currentLongitude', _currentLocation!.longitude);
      await prefs.setString('currentAddress', _currentLocation!.address);
    } catch (e) {
      debugPrint('현재 위치 저장 실패: $e');
    }
  }

  // 선택된 위치 저장
  Future<void> _saveSelectedLocation() async {
    if (_selectedLocation == null) return;

    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setDouble('selectedLatitude', _selectedLocation!.latitude);
      await prefs.setDouble('selectedLongitude', _selectedLocation!.longitude);
      await prefs.setString('selectedAddress', _selectedLocation!.address);
    } catch (e) {
      debugPrint('선택된 위치 저장 실패: $e');
    }
  }

  // 저장된 위치 불러오기
  Future<void> _loadSavedLocation() async {
    try {
      final prefs = await SharedPreferences.getInstance();

      // 현재 위치 불러오기
      final currentLat = prefs.getDouble('currentLatitude');
      final currentLng = prefs.getDouble('currentLongitude');
      final currentAddr = prefs.getString('currentAddress');

      if (currentLat != null && currentLng != null && currentAddr != null) {
        _currentLocation = LocationModel(
          latitude: currentLat,
          longitude: currentLng,
          address: currentAddr,
          timestamp: DateTime.now(),
        );
      }

      // 선택된 위치 불러오기
      final selectedLat = prefs.getDouble('selectedLatitude');
      final selectedLng = prefs.getDouble('selectedLongitude');
      final selectedAddr = prefs.getString('selectedAddress');

      if (selectedLat != null && selectedLng != null && selectedAddr != null) {
        _selectedLocation = LocationModel(
          latitude: selectedLat,
          longitude: selectedLng,
          address: selectedAddr,
          timestamp: DateTime.now(),
        );
      }

      notifyListeners();
    } catch (e) {
      debugPrint('저장된 위치 불러오기 실패: $e');
    }
  }

  // 선택된 위치 삭제
  Future<void> _clearSelectedLocation() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove('selectedLatitude');
      await prefs.remove('selectedLongitude');
      await prefs.remove('selectedAddress');
    } catch (e) {
      debugPrint('선택된 위치 삭제 실패: $e');
    }
  }

  // 로딩 상태 설정
  void _setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  // 에러 메시지 설정
  void _setError(String error) {
    _errorMessage = error;
    notifyListeners();
  }

  // 에러 메시지 삭제
  void _clearError() {
    _errorMessage = null;
  }
}
