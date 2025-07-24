import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

// 플랫폼별 조건부 import
import 'places_api_service_stub.dart'
    if (dart.library.js) 'places_api_service_web.dart'
    if (dart.library.io) 'places_api_service_mobile.dart';

class PlacesApiService {
  // 플랫폼별 Places API를 사용한 음식점 검색
  static Future<List<Map<String, dynamic>>> searchRestaurantsInBounds({
    required LatLngBounds bounds,
    double? radius,
    String? keyword,
  }) async {
    try {
      // 지도 중심점 계산
      final center = LatLng(
        (bounds.northeast.latitude + bounds.southwest.latitude) / 2,
        (bounds.northeast.longitude + bounds.southwest.longitude) / 2,
      );

      // 반경 계산
      final calculatedRadius = radius ?? _calculateRadiusFromBounds(bounds);

      debugPrint('🔍 검색 중심점: ${center.latitude}, ${center.longitude}');
      debugPrint('🔍 검색 반경: ${calculatedRadius.toStringAsFixed(0)}m');

      // 플랫폼별 구현 호출
      final results = await PlatformPlacesApi.searchWithAPI(
        center: center,
        radius: calculatedRadius,
      );

      debugPrint('✅ Places API 검색 완료: ${results.length}개 음식점');
      return results;
    } catch (e) {
      debugPrint('❌ 음식점 검색 중 오류 발생: $e');
      return [];
    }
  }

  // 지도 bounds에서 검색 반경 계산
  static double _calculateRadiusFromBounds(LatLngBounds bounds) {
    const double earthRadius = 6371000; // 지구 반지름 (미터)

    final lat1Rad = bounds.southwest.latitude * (pi / 180);
    final lat2Rad = bounds.northeast.latitude * (pi / 180);
    final deltaLatRad =
        (bounds.northeast.latitude - bounds.southwest.latitude) * (pi / 180);
    final deltaLngRad =
        (bounds.northeast.longitude - bounds.southwest.longitude) * (pi / 180);

    final a = sin(deltaLatRad / 2) * sin(deltaLatRad / 2) +
        cos(lat1Rad) *
            cos(lat2Rad) *
            sin(deltaLngRad / 2) *
            sin(deltaLngRad / 2);
    final c = 2 * asin(sqrt(a));

    // 대각선 거리의 60% 정도를 반경으로 사용
    return (earthRadius * c * 0.6).clamp(500, 5000); // 최소 500m, 최대 5km
  }

  // 음식점 정보를 콘솔에 출력
  static void printRestaurantList(List<Map<String, dynamic>> restaurants) {
    debugPrint('\n🍽️ ===== 검색된 음식점 목록 =====');
    debugPrint('📍 총 ${restaurants.length}개 음식점');
    debugPrint('=' * 40);

    for (int i = 0; i < restaurants.length; i++) {
      final restaurant = restaurants[i];
      final name = restaurant['name'] ?? '이름 없음';
      final rating = restaurant['rating']?.toString() ?? '평점 없음';
      final vicinity = restaurant['vicinity'] ?? '주소 없음';
      final types = (restaurant['types'] as List?)?.join(', ') ?? '분류 없음';
      final priceLevel = restaurant['price_level']?.toString() ?? '가격 정보 없음';
      final placeId = restaurant['place_id'] ?? '';

      debugPrint('${i + 1}. 🏪 $name');
      debugPrint('   ⭐ 평점: $rating');
      debugPrint('   📍 주소: $vicinity');
      debugPrint('   🏷️ 분류: $types');
      debugPrint('   💰 가격대: $priceLevel');
      debugPrint('   🆔 Place ID: $placeId');
      debugPrint('   ---');
    }

    debugPrint('=' * 40);
    debugPrint('✅ 실제 Google Places API 데이터 출력 완료\n');
  }
}
