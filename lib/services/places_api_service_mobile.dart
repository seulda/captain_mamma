import 'dart:async';
import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

/// 모바일 플랫폼용 Places API 구현 (더미 데이터 사용)
class PlatformPlacesApi {
  static Future<List<Map<String, dynamic>>> searchWithAPI({
    required LatLng center,
    required double radius,
  }) async {
    debugPrint('📱 모바일에서 더미 데이터 생성');

    // 실제 API 호출 시뮬레이션을 위한 지연
    await Future.delayed(const Duration(milliseconds: 500));

    return _generateDummyRestaurants(center);
  }

  /// 더미 음식점 데이터 생성
  static List<Map<String, dynamic>> _generateDummyRestaurants(LatLng center) {
    final random = Random();
    final dummyRestaurants = <Map<String, dynamic>>[];

    final restaurantNames = [
      '맛있는 한식당',
      '이탈리아 파스타',
      '일본 라멘집',
      '중국집 대박',
      '카페 모닝',
      '햄버거 하우스',
      '치킨 전문점',
      '피자 마니아',
      '태국 음식점',
      '베트남 쌀국수',
      '인도 카레하우스',
      '멕시코 타코',
      '스시 모모',
      '불고기 브라더스',
      '팟타이 키친',
    ];

    final foodTypes = [
      ['restaurant', 'food', 'establishment'],
      ['meal_takeaway', 'restaurant', 'food'],
      ['cafe', 'food', 'establishment'],
      ['bakery', 'food', 'store'],
    ];

    // 10-15개의 더미 음식점 생성
    final count = 10 + random.nextInt(6);

    for (int i = 0; i < count; i++) {
      // 중심점 주변 랜덤 위치 생성 (반경 내)
      final latOffset = (random.nextDouble() - 0.5) * 0.01;
      final lngOffset = (random.nextDouble() - 0.5) * 0.01;

      dummyRestaurants.add({
        'name': restaurantNames[random.nextInt(restaurantNames.length)],
        'rating': 3.5 + random.nextDouble() * 1.5,
        'vicinity': '서울시 중구 ${random.nextInt(100) + 1}번지',
        'types': foodTypes[random.nextInt(foodTypes.length)],
        'price_level': random.nextInt(4) + 1,
        'place_id': 'mobile_dummy_place_id_$i',
        'latitude': center.latitude + latOffset,
        'longitude': center.longitude + lngOffset,
        'icon': '',
        'photos': [],
      });
    }

    debugPrint('📱 모바일 더미 데이터: ${dummyRestaurants.length}개 음식점 생성');
    return dummyRestaurants;
  }
}
