import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

// 웹에서만 사용하는 JavaScript interop
// ignore: avoid_web_libraries_in_flutter
import 'dart:js' as js;
// ignore: avoid_web_libraries_in_flutter
import 'dart:js_util' as js_util;

/// 웹 플랫폼용 Places API 구현 (JavaScript interop 사용)
class PlatformPlacesApi {
  static Future<List<Map<String, dynamic>>> searchWithAPI({
    required LatLng center,
    required double radius,
  }) async {
    final completer = Completer<List<Map<String, dynamic>>>();

    try {
      debugPrint('🌐 웹에서 JavaScript Places API 호출');

      // JavaScript 콜백 함수 정의 (JsArray를 직접 처리)
      js.context['dartCallback'] = js_util.allowInterop((dynamic data) {
        try {
          debugPrint('🔍 JavaScript에서 받은 데이터 타입: ${data.runtimeType}');

          List<Map<String, dynamic>> restaurants = [];

          // 데이터 타입에 따라 다르게 처리
          if (data is String) {
            // JSON 문자열인 경우
            debugPrint('📄 JSON 문자열로 받음: $data');
            final List<dynamic> decoded = json.decode(data);
            restaurants = decoded.cast<Map<String, dynamic>>();
          } else {
            // JsArray 또는 기타 JavaScript 객체인 경우
            debugPrint('🔧 JavaScript 객체로 받음, 직접 변환 시도');

            // JsArray를 List로 변환
            final List<dynamic> jsArray =
                js_util.dartify(data) as List<dynamic>;

            restaurants = jsArray.map((item) {
              final Map<String, dynamic> restaurant =
                  Map<String, dynamic>.from(item as Map);
              return restaurant;
            }).toList();
          }

          debugPrint('✅ 변환 완료: ${restaurants.length}개 음식점');
          completer.complete(restaurants);
        } catch (e) {
          debugPrint('❌ 데이터 변환 오류: $e');
          debugPrint('📄 받은 데이터: $data');
          completer.complete([]);
        }
      });

      // JavaScript 함수 호출
      js.context.callMethod('searchNearbyRestaurants', [
        center.latitude,
        center.longitude,
        radius.toInt(),
        js.context['dartCallback']
      ]);

      // 결과 대기 (최대 10초)
      return await completer.future.timeout(
        const Duration(seconds: 10),
        onTimeout: () {
          debugPrint('⏰ Places API 호출 타임아웃');
          return <Map<String, dynamic>>[];
        },
      );
    } catch (e) {
      debugPrint('❌ JavaScript API 호출 오류: $e');
      completer.complete([]);
      return completer.future;
    }
  }
}
