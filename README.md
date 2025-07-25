# 선장님 오늘의 메뉴는요? 📱

위치 기반 식당 추천 Flutter 앱

## 📋 프로젝트 개요

메뉴 선택에 어려움을 겪는 사용자들(선택장애님, 선장님)을 위한 위치 기반 식당 추천 서비스입니다.
현재 위치 또는 특정 위치를 기준으로 근처 식당을 필터링하여 추천하고, 랜덤 선택 기능도 제공합니다.

## 🎯 주요 기능

- ✅ **현재 위치 기반 검색**: GPS를 활용한 근처 맛집 찾기
- ✅ **필터링 시스템**: 음식 종류(한식/양식/중식/일식/기타) 및 메뉴 타입(해물/고기/면/밥/국물) 필터
- ✅ **검색 반경 설정**: 500m~5km까지 조절 가능
- ✅ **랜덤 선택**: 고민 해결을 위한 랜덤 가게 추천
- ✅ **소셜 로그인**: Google, Naver, Kakao 로그인 지원
- ✅ **테마 시스템**: 라이트/다크 모드 지원
- ✅ **길안내 연결**: 선택한 가게까지의 경로 안내

## 🛠 기술 스택

- **프레임워크**: Flutter 3.10+
- **언어**: Dart 3.0+
- **상태 관리**: Provider
- **라우팅**: go_router
- **네트워킹**: Dio
- **로컬 스토리지**: SharedPreferences
- **위치 서비스**: Geolocator, Geocoding
- **지도**: Google Maps Flutter
- **소셜 로그인**: Google Sign-In
- **광고**: Google Mobile Ads

## 📱 지원 플랫폼

- iOS
- Android
- Web (추후 지원)

## 🚀 시작하기

### 1. Flutter 설치

Flutter 공식 홈페이지에서 Flutter SDK를 설치하세요.

```bash
# Flutter 설치 확인
flutter doctor
```

### 2. 프로젝트 클론 및 설정

```bash
# 프로젝트 클론
git clone <repository-url>
cd captain_menu_app

# 패키지 설치
flutter pub get
```

### 3. API 키 설정

`lib/services/restaurant_service.dart` 파일에서 API 키를 설정하세요:

```dart
// 카카오 로컬 API 키
static const String kakaoApiKey = 'YOUR_KAKAO_API_KEY';

// 네이버 검색 API 키 (선택사항)
static const String naverClientId = 'YOUR_NAVER_CLIENT_ID';
static const String naverClientSecret = 'YOUR_NAVER_CLIENT_SECRET';
```

### 4. 구글 맵 API 설정

#### Android

`android/app/src/main/AndroidManifest.xml`에 API 키 추가:

```xml
<meta-data
    android:name="com.google.android.geo.API_KEY"
    android:value="YOUR_GOOGLE_MAPS_API_KEY"/>
```

#### iOS

`ios/Runner/AppDelegate.swift`에 API 키 추가:

```swift
GMSServices.provideAPIKey("YOUR_GOOGLE_MAPS_API_KEY")
```

### 5. 실행

```bash
# 디버그 모드로 실행
flutter run
flutter run -d chrome --web-hostname=0.0.0.0 --web-port=8080
flutter clean && flutter pub get && ./scripts/run_android.sh

# 릴리즈 모드로 빌드
flutter build apk  # Android
flutter build ios  # iOS
```

## 🏗 프로젝트 구조

```
lib/
├── core/                          # 공통/코어 코드 (에러, 네트워크, 유틸, 공용 위젯 등)
│   ├── error/
│   ├── network/
│   ├── utils/
│   └── widgets/
├── features/                      # 각 기능(Feature)별 폴더
│   ├── map/
│   │   ├── data/                  # 데이터 계층 (datasources, models, repositories)
│   │   ├── domain/                # 도메인 계층 (entities, repositories, usecases)
│   │   └── presentation/          # 프리젠테이션 계층 (bloc, pages, widgets)
│   └── ...                        # 다른 feature도 동일 구조
├── main.dart                      # 앱 엔트리포인트
```

- 각 feature는 data/domain/presentation 3계층으로 분리
- core/에는 공통 유틸, 에러, 네트워크, 공용 위젯 등 위치
- Bloc, Freezed, Either, Repository 패턴 등 클린 아키텍처 원칙 적용

## 🔧 필요한 API 키

### 필수

- **카카오 로컬 API**: 장소 검색용
- **Google Maps API**: 지도 표시용
- **Google Sign-In**: 소셜 로그인용

### 선택사항

- **Naver 검색 API**: 추가 장소 정보용
- **Google Mobile Ads**: 광고 표시용

## 📋 개발 로드맵

### Phase 1 (MVP) ✅

- [x] 기본 프로젝트 구조 및 테마 시스템
- [x] 위치 기반 검색 기능
- [x] 필터링 시스템
- [x] 소셜 로그인 연동
- [x] 기본 UI/UX

### Phase 2 (개선)

- [ ] Google Maps 연동
- [ ] 실제 API 연동 (카카오/네이버)
- [ ] 가게 상세 정보 표시
- [ ] 네비게이션 기능 구현
- [ ] 광고 시스템 연동

### Phase 3 (확장)

- [ ] 리뷰 시스템
- [ ] 즐겨찾기 기능
- [ ] 그룹 기능
- [ ] 음성 인식
- [ ] 개인화 추천

## 🐛 알려진 이슈

- 현재는 더미 데이터를 사용하여 레스토랑 정보를 표시합니다
- Google Maps 연동이 아직 완료되지 않았습니다
- Naver, Kakao 로그인 SDK 연동이 필요합니다

## 🤝 기여하기

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📄 라이선스

이 프로젝트는 MIT 라이선스 하에 배포됩니다. 자세한 내용은 `LICENSE` 파일을 참조하세요.

## 📞 문의

문제가 있거나 제안사항이 있으시면 Issues를 통해 알려주세요.

---

**선장님 오늘의 메뉴는요?** - 메뉴 고민 끝! 🍽️
