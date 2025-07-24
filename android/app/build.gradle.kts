plugins {
    id("com.android.application")
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}

// 환경변수 키 상수 정의 (사용하는 키들을 명확하게 관리)
object EnvKeys {
    const val GOOGLE_MAPS_API_KEY = "GOOGLE_MAPS_API_KEY"
    const val ADMOB_APP_ID_ANDROID = "ADMOB_APP_ID_ANDROID"
    const val ADMOB_AD_UNIT_ID_BANNER = "ADMOB_AD_UNIT_ID_BANNER"
    const val DEBUG_MODE = "DEBUG_MODE"
}

// 환경변수 값 읽기 함수 (우선순위: dart-define > 시스템환경변수 > 기본값)
fun getEnvValue(key: String, defaultValue: String = ""): String {
    return project.findProperty(key)?.toString() 
        ?: System.getenv(key) 
        ?: defaultValue
}

android {
    namespace = "com.example.captain_menu_app"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = "27.0.12077973"

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    defaultConfig {
        // TODO: Specify your own unique Application ID (https://developer.android.com/studio/build/application-id.html).
        applicationId = "com.example.captain_menu_app"
        // You can update the following values to match your application needs.
        // For more information, see: https://flutter.dev/to/review-gradle-config.
        minSdk = 23 // Google Mobile Ads 요구사항
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
        
        // 환경 변수를 AndroidManifest.xml에서 사용할 수 있도록 설정
        // 상수화된 키를 사용하여 명확하게 관리 (값은 .env에서만 관리)
        manifestPlaceholders += mapOf(
            EnvKeys.GOOGLE_MAPS_API_KEY to getEnvValue(EnvKeys.GOOGLE_MAPS_API_KEY),
            EnvKeys.ADMOB_APP_ID_ANDROID to getEnvValue(EnvKeys.ADMOB_APP_ID_ANDROID)
        )
    }

    buildTypes {
        release {
            // TODO: Add your own signing config for the release build.
            // Signing with the debug keys for now, so `flutter run --release` works.
            signingConfig = signingConfigs.getByName("debug")
        }
    }
}

flutter {
    source = "../.."
}
