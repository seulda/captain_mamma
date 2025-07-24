#!/bin/bash

# .env 파일에서 환경 변수 로드
if [ -f .env ]; then
    echo "📋 .env 파일에서 환경 변수를 로드합니다..."
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

echo "🚀 Flutter 웹 앱을 시작합니다..."
echo "📍 Google Maps API Key: ${GOOGLE_MAPS_API_KEY:0:10}..."

# Google Sign-In Client ID 주입 (선택사항)
if [ -n "$GOOGLE_SIGNIN_CLIENT_ID" ]; then
    echo "🔐 Google Sign-In Client ID 설정 중..."
    # web/index.html에서 플레이스홀더를 실제 Client ID로 교체
    sed -i.bak "s/YOUR_GOOGLE_SIGNIN_CLIENT_ID/$GOOGLE_SIGNIN_CLIENT_ID/g" web/index.html
    echo "✅ Google Sign-In Client ID 설정 완료: ${GOOGLE_SIGNIN_CLIENT_ID:0:10}..."
else
    echo "⚠️ GOOGLE_SIGNIN_CLIENT_ID가 설정되지 않았습니다. Google 로그인이 비활성화됩니다."
fi

# Flutter 웹 실행 (dart-define으로 환경 변수 전달)
flutter run -d chrome \
  --web-hostname=0.0.0.0 \
  --web-port=8080 \
  --dart-define=GOOGLE_MAPS_API_KEY="$GOOGLE_MAPS_API_KEY" \
  --dart-define=KAKAO_API_KEY="$KAKAO_API_KEY" \
  --dart-define=NAVER_CLIENT_ID="$NAVER_CLIENT_ID" \
  --dart-define=NAVER_CLIENT_SECRET="$NAVER_CLIENT_SECRET" \
  --dart-define=DEBUG_MODE="$DEBUG_MODE" \
  --dart-define=APP_VERSION="$APP_VERSION" 

# 스크립트 종료 시 원본 파일 복원
cleanup() {
    echo "🧹 정리 작업 중..."
    if [ -f web/index.html.bak ]; then
        mv web/index.html.bak web/index.html
        echo "✅ web/index.html 원본 복원 완료"
    fi
}

# 스크립트 종료 시 정리 함수 실행
trap cleanup EXIT