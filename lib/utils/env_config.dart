import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'dart:developer' as developer;

/// 환경 변수 관리 클래스
class EnvConfig {
  // dart-define을 통한 환경 변수 (웹에서도 안전하게 사용 가능)
  static const String googleMapsApiKey = String.fromEnvironment(
    'GOOGLE_MAPS_API_KEY',
    defaultValue: '', // 기본값: 빈 문자열
  );

  static const String kakaoApiKey = String.fromEnvironment(
    'KAKAO_API_KEY',
    defaultValue: '',
  );

  static const String naverClientId = String.fromEnvironment(
    'NAVER_CLIENT_ID',
    defaultValue: '',
  );

  static const String naverClientSecret = String.fromEnvironment(
    'NAVER_CLIENT_SECRET',
    defaultValue: '',
  );

  // API 키 유효성 검사
  static bool get isGoogleMapsApiKeyValid => googleMapsApiKey.isNotEmpty;
  static bool get isKakaoApiKeyValid => kakaoApiKey.isNotEmpty;
  static bool get isNaverConfigValid =>
      naverClientId.isNotEmpty && naverClientSecret.isNotEmpty;

  // 개발 모드 확인
  static const bool isDebugMode =
      bool.fromEnvironment('DEBUG_MODE', defaultValue: false);
  static const String appVersion =
      String.fromEnvironment('APP_VERSION', defaultValue: '1.0.0');

  // Database Configuration (추후 필요시 사용)
  static String get databaseUrl => dotenv.env['DATABASE_URL'] ?? '';
  static String get databaseName => dotenv.env['DATABASE_NAME'] ?? '';

  /// 환경 변수 유효성 검사
  static bool get isConfigValid {
    return kakaoApiKey.isNotEmpty && googleMapsApiKey.isNotEmpty;
  }

  /// 누락된 환경 변수 목록 반환
  static List<String> get missingKeys {
    List<String> missing = [];

    if (kakaoApiKey.isEmpty) missing.add('KAKAO_API_KEY');
    if (googleMapsApiKey.isEmpty) missing.add('GOOGLE_MAPS_API_KEY');

    return missing;
  }

  /// 환경 변수 로드 상태 출력 (디버그용)
  static void printConfigStatus() {
    if (isDebugMode) {
      developer.log('=== Environment Configuration ===', name: 'EnvConfig');
      developer.log(
          'KAKAO_API_KEY: ${kakaoApiKey.isNotEmpty ? '✓ Loaded' : '✗ Missing'}',
          name: 'EnvConfig');
      developer.log(
          'NAVER_CLIENT_ID: ${naverClientId.isNotEmpty ? '✓ Loaded' : '✗ Missing'}',
          name: 'EnvConfig');
      developer.log(
          'NAVER_CLIENT_SECRET: ${naverClientSecret.isNotEmpty ? '✓ Loaded' : '✗ Missing'}',
          name: 'EnvConfig');
      developer.log(
          'GOOGLE_MAPS_API_KEY: ${googleMapsApiKey.isNotEmpty ? '✓ Loaded' : '✗ Missing'}',
          name: 'EnvConfig');
      developer.log('App Version: $appVersion', name: 'EnvConfig');
      developer.log('Debug Mode: $isDebugMode', name: 'EnvConfig');

      if (!isConfigValid) {
        developer.log('⚠️ Missing required keys: ${missingKeys.join(', ')}',
            name: 'EnvConfig');
      }
      developer.log('================================', name: 'EnvConfig');
    }
  }
}
