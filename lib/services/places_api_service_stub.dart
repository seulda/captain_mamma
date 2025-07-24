import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';

/// 플랫폼별 Places API 구현을 위한 스텁
/// 이 파일은 실제로는 사용되지 않고, 웹/모바일 전용 구현이 사용됩니다.
class PlatformPlacesApi {
  static Future<List<Map<String, dynamic>>> searchWithAPI({
    required LatLng center,
    required double radius,
  }) async {
    throw UnsupportedError('플랫폼별 구현이 필요합니다.');
  }
}
