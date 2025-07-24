@echo off
setlocal enabledelayedexpansion

echo 📋 Android용 .env 파일에서 환경 변수를 로드합니다...

REM .env 파일 확인
if not exist ".env" (
    echo ❌ .env 파일을 찾을 수 없습니다!
    pause
    exit /b 1
)

REM .env 파일에서 환경 변수 로드
for /f "usebackq tokens=1,2 delims==" %%a in (".env") do (
    if not "%%a"=="" if not "%%a"=="REM" if not "%%a"=="#" (
        set "%%a=%%b"
    )
)

REM 필수 환경 변수 확인
if "!GOOGLE_MAPS_API_KEY!"=="" (
    echo ❌ GOOGLE_MAPS_API_KEY가 설정되지 않았습니다!
    pause
    exit /b 1
)

echo 🚀 Flutter Android 앱을 시작합니다...
echo 📍 Google Maps API Key: !GOOGLE_MAPS_API_KEY:~0,10!...

REM Android 연결된 기기 확인
echo 🔍 연결된 기기 확인 중...
flutter devices

REM 안드로이드 기기 ID 찾기 (emulator로 시작하는 기기 찾기)
for /f "tokens=*" %%i in ('flutter devices ^| findstr "emulator"') do (
    for %%j in (%%i) do (
        set "temp=%%j"
        if "!temp:~0,8!"=="emulator" (
            set "ANDROID_DEVICE=!temp!"
            goto :found
        )
    )
)

echo ❌ 연결된 안드로이드 에뮬레이터를 찾을 수 없습니다!
echo 💡 다음 중 하나를 시도해보세요:
echo    1. 에뮬레이터가 완전히 부팅될 때까지 기다린 후 다시 실행
echo    2. 'flutter emulators --launch ^<에뮬레이터_이름^>' 으로 에뮬레이터 실행
echo    3. 'adb devices' 로 ADB 연결 상태 확인
pause
exit /b 1

:found
echo 📱 안드로이드 기기 발견: !ANDROID_DEVICE!

REM Flutter Android 실행 (정확한 기기 ID 사용)
flutter run -d !ANDROID_DEVICE! ^
  --dart-define=GOOGLE_MAPS_API_KEY="!GOOGLE_MAPS_API_KEY!" ^
  --dart-define=KAKAO_API_KEY="!KAKAO_API_KEY!" ^
  --dart-define=NAVER_CLIENT_ID="!NAVER_CLIENT_ID!" ^
  --dart-define=NAVER_CLIENT_SECRET="!NAVER_CLIENT_SECRET!" ^
  --dart-define=ADMOB_APP_ID_ANDROID="!ADMOB_APP_ID_ANDROID!" ^
  --dart-define=ADMOB_AD_UNIT_ID_BANNER="!ADMOB_AD_UNIT_ID_BANNER!" ^
  --dart-define=ADMOB_TEST_BANNER_ID="!ADMOB_TEST_BANNER_ID!" ^
  --dart-define=ADMOB_TEST_INTERSTITIAL_ID="!ADMOB_TEST_INTERSTITIAL_ID!" ^
  --dart-define=DEBUG_MODE="!DEBUG_MODE!" ^
  --dart-define=APP_VERSION="!APP_VERSION!" ^
  -P GOOGLE_MAPS_API_KEY="!GOOGLE_MAPS_API_KEY!" ^
  -P ADMOB_APP_ID_ANDROID="!ADMOB_APP_ID_ANDROID!"

pause 