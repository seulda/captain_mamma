#!/bin/bash

# .env 파일에서 환경 변수 로드
if [ -f .env ]; then
    echo "📋 Android용 .env 파일에서 환경 변수를 로드합니다..."
    source .env
else
    echo "❌ .env 파일을 찾을 수 없습니다!"
    exit 1
fi

# 필수 환경 변수 확인
if [ -z "$GOOGLE_MAPS_API_KEY" ]; then
    echo "❌ GOOGLE_MAPS_API_KEY가 설정되지 않았습니다!"
    exit 1
fi

echo "🚀 Flutter Android 앱을 시작합니다..."
echo "📍 Google Maps API Key: ${GOOGLE_MAPS_API_KEY:0:10}..."

# Android 연결된 기기 확인
echo "🔍 연결된 기기 확인 중..."
flutter devices

# 안드로이드 기기 ID 자동 찾기
ANDROID_DEVICE=$(flutter devices | grep "emulator" | grep -o "emulator-[0-9]*" | head -1)

if [ -z "$ANDROID_DEVICE" ]; then
    echo "❌ 연결된 안드로이드 기기를 찾을 수 없습니다!"
    echo "💡 다음 중 하나를 시도해보세요:"
    echo "   1. 에뮬레이터가 완전히 부팅될 때까지 기다린 후 다시 실행"
    echo "   2. 'flutter emulators --launch <에뮬레이터_이름>' 으로 에뮬레이터 실행"
    echo "   3. 'adb devices' 로 ADB 연결 상태 확인"
    exit 1
fi

echo "📱 안드로이드 기기 발견: $ANDROID_DEVICE"

# Flutter Android 실행 (Skia 렌더러 강제 사용)
flutter run -d $ANDROID_DEVICE \
  --enable-software-rendering \
  --dart-define=GOOGLE_MAPS_API_KEY="$GOOGLE_MAPS_API_KEY" \
  --dart-define=KAKAO_API_KEY="$KAKAO_API_KEY" \
  --dart-define=NAVER_CLIENT_ID="$NAVER_CLIENT_ID" \
  --dart-define=NAVER_CLIENT_SECRET="$NAVER_CLIENT_SECRET" \
  --dart-define=ADMOB_APP_ID_ANDROID="$ADMOB_APP_ID_ANDROID" \
  --dart-define=ADMOB_AD_UNIT_ID_BANNER="$ADMOB_AD_UNIT_ID_BANNER" \
  --dart-define=ADMOB_TEST_BANNER_ID="$ADMOB_TEST_BANNER_ID" \
  --dart-define=ADMOB_TEST_INTERSTITIAL_ID="$ADMOB_TEST_INTERSTITIAL_ID" \
  --dart-define=DEBUG_MODE="$DEBUG_MODE" \
  --dart-define=APP_VERSION="$APP_VERSION" \
  -P GOOGLE_MAPS_API_KEY="$GOOGLE_MAPS_API_KEY" \
  -P ADMOB_APP_ID_ANDROID="$ADMOB_APP_ID_ANDROID" 