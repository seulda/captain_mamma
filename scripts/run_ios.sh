#!/bin/bash

# .env 파일에서 환경 변수 로드
if [ -f .env ]; then
    echo "📋 iOS용 .env 파일에서 환경 변수를 로드합니다..."
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

echo "🚀 Flutter iOS 앱을 시작합니다..."
echo "📍 Google Maps API Key: ${GOOGLE_MAPS_API_KEY:0:10}..."

# iOS 시뮬레이터 확인
flutter devices

# Flutter iOS 실행 (dart-define으로 환경 변수 전달)
flutter run -d ios \
  --dart-define=GOOGLE_MAPS_API_KEY="$GOOGLE_MAPS_API_KEY" \
  --dart-define=KAKAO_API_KEY="$KAKAO_API_KEY" \
  --dart-define=NAVER_CLIENT_ID="$NAVER_CLIENT_ID" \
  --dart-define=NAVER_CLIENT_SECRET="$NAVER_CLIENT_SECRET" \
  --dart-define=DEBUG_MODE="$DEBUG_MODE" \
  --dart-define=APP_VERSION="$APP_VERSION" 