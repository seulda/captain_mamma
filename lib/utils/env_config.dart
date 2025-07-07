import 'package:flutter_dotenv/flutter_dotenv.dart';

/// 환경 변수 관리 클래스
class EnvConfig {
  // API Keys
  static String get kakaoApiKey => dotenv.env['KAKAO_API_KEY'] ?? '';
  static String get naverClientId => dotenv.env['NAVER_CLIENT_ID'] ?? '';
  static String get naverClientSecret => dotenv.env['NAVER_CLIENT_SECRET'] ?? '';
  static String get googleMapsApiKey => dotenv.env['GOOGLE_MAPS_API_KEY'] ?? '';

  // App Configuration
  static String get appVersion => dotenv.env['APP_VERSION'] ?? '1.0.0';
  static bool get isDebugMode => dotenv.env['DEBUG_MODE']?.toLowerCase() == 'true';

  // Database Configuration (추후 필요시 사용)
  static String get databaseUrl => dotenv.env['DATABASE_URL'] ?? '';
  static String get databaseName => dotenv.env['DATABASE_NAME'] ?? '';

  /// 환경 변수 유효성 검사
  static bool get isConfigValid {
    return kakaoApiKey.isNotEmpty && 
           googleMapsApiKey.isNotEmpty;
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
      print('=== Environment Configuration ===');
      print('KAKAO_API_KEY: ${kakaoApiKey.isNotEmpty ? '✓ Loaded' : '✗ Missing'}');
      print('NAVER_CLIENT_ID: ${naverClientId.isNotEmpty ? '✓ Loaded' : '✗ Missing'}');
      print('NAVER_CLIENT_SECRET: ${naverClientSecret.isNotEmpty ? '✓ Loaded' : '✗ Missing'}');
      print('GOOGLE_MAPS_API_KEY: ${googleMapsApiKey.isNotEmpty ? '✓ Loaded' : '✗ Missing'}');
      print('App Version: $appVersion');
      print('Debug Mode: $isDebugMode');
      
      if (!isConfigValid) {
        print('⚠️ Missing required keys: ${missingKeys.join(', ')}');
      }
      print('================================');
    }
  }
} 