import Flutter
import UIKit
import GoogleMaps

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
        // Google Maps SDK 초기화 (dart-define 환경 변수에서만 읽기)
    // .env 파일 → dart-define → Info.plist 경로로만 API 키 전달
    if let apiKey = Bundle.main.object(forInfoDictionaryKey: "GOOGLE_MAPS_API_KEY") as? String,
       !apiKey.isEmpty {
      GMSServices.provideAPIKey(apiKey)
      print("Google Maps SDK가 초기화되었습니다. (API Key: \(String(apiKey.prefix(10)))...)")
    } else {
      print("❌ Google Maps API 키가 설정되지 않았습니다.")
      print("💡 해결 방법: ./scripts/run_ios.bat으로 실행하여 환경 변수를 전달하세요.")
    }
    
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
