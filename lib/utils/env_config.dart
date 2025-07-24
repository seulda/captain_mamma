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

  // AdMob 환경 변수
  static const String admobAppIdAndroid = String.fromEnvironment(
    'ADMOB_APP_ID_ANDROID',
    defaultValue: '',
  );

  static const String admobAppIdIos = String.fromEnvironment(
    'ADMOB_APP_ID_IOS',
    defaultValue: '',
  );

  static const String admobBannerAdUnitId = String.fromEnvironment(
    'ADMOB_AD_UNIT_ID_BANNER',
    defaultValue: '',
  );

  // 테스트용 광고 단위 ID들
  static const String admobTestBannerId = String.fromEnvironment(
    'ADMOB_TEST_BANNER_ID',
    defaultValue: 'ca-app-pub-3940256099942544/6300978111', // Google 제공 테스트 ID
  );

  static const String admobTestInterstitialId = String.fromEnvironment(
    'ADMOB_TEST_INTERSTITIAL_ID',
    defaultValue: 'ca-app-pub-3940256099942544/1033173712', // Google 제공 테스트 ID
  );

  // API 키 유효성 검사
  static bool get isGoogleMapsApiKeyValid => googleMapsApiKey.isNotEmpty;
  static bool get isKakaoApiKeyValid => kakaoApiKey.isNotEmpty;
  static bool get isNaverConfigValid =>
      naverClientId.isNotEmpty && naverClientSecret.isNotEmpty;

  // AdMob 유효성 검사
  static bool get isAdmobAndroidConfigValid => admobAppIdAndroid.isNotEmpty;
  static bool get isAdmobIosConfigValid => admobAppIdIos.isNotEmpty;
  static bool get isAdmobBannerConfigValid => admobBannerAdUnitId.isNotEmpty;

  // 플랫폼별 AdMob App ID 반환
  static String getAdmobAppId() {
    // Android에서는 Android App ID, iOS에서는 iOS App ID 사용
    // 현재는 Android만 설정되어 있으므로 Android ID 반환
    return admobAppIdAndroid.isNotEmpty ? admobAppIdAndroid : admobAppIdIos;
  }

  // 배너 광고 단위 ID 반환 (프로덕션 vs 테스트)
  static String getBannerAdUnitId({bool useTestAd = false}) {
    if (useTestAd || isDebugMode) {
      return admobTestBannerId;
    }
    return admobBannerAdUnitId.isNotEmpty
        ? admobBannerAdUnitId
        : admobTestBannerId;
  }

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

  /// 필수 환경 변수 유효성 검사 (AdMob 포함)
  static bool get isAllConfigValid {
    return isConfigValid && isAdmobAndroidConfigValid;
  }

  /// 누락된 환경 변수 목록 반환
  static List<String> get missingKeys {
    List<String> missing = [];

    if (kakaoApiKey.isEmpty) missing.add('KAKAO_API_KEY');
    if (googleMapsApiKey.isEmpty) missing.add('GOOGLE_MAPS_API_KEY');
    if (admobAppIdAndroid.isEmpty) missing.add('ADMOB_APP_ID_ANDROID');
    if (admobBannerAdUnitId.isEmpty) missing.add('ADMOB_AD_UNIT_ID_BANNER');

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

      // AdMob 설정 출력
      developer.log('--- AdMob Configuration ---', name: 'EnvConfig');
      developer.log(
          'ADMOB_APP_ID_ANDROID: ${admobAppIdAndroid.isNotEmpty ? '✓ Loaded' : '✗ Missing'}',
          name: 'EnvConfig');
      developer.log(
          'ADMOB_BANNER_AD_UNIT_ID: ${admobBannerAdUnitId.isNotEmpty ? '✓ Loaded' : '✗ Missing'}',
          name: 'EnvConfig');
      developer.log('Current Banner Ad Unit: ${getBannerAdUnitId()}',
          name: 'EnvConfig');
      developer.log('Using Test Ads: $isDebugMode', name: 'EnvConfig');

      developer.log('App Version: $appVersion', name: 'EnvConfig');
      developer.log('Debug Mode: $isDebugMode', name: 'EnvConfig');

      if (!isAllConfigValid) {
        developer.log('⚠️ Missing required keys: ${missingKeys.join(', ')}',
            name: 'EnvConfig');
      }
      developer.log('================================', name: 'EnvConfig');
    }
  }
}
