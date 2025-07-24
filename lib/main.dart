import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'dart:developer' as developer;

import 'providers/theme_provider.dart';
import 'providers/auth_provider.dart';
import 'providers/location_provider.dart';
import 'providers/restaurant_provider.dart';
import 'themes/app_theme.dart';
import 'utils/router.dart';
import 'utils/env_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // 환경 변수 로드
  try {
    await dotenv.load(fileName: '.env');
    EnvConfig.printConfigStatus();
  } catch (e) {
    developer.log('⚠️ .env 파일을 로드할 수 없습니다: $e', name: 'EnvConfig');
    developer.log('📝 프로젝트 루트에 .env 파일을 생성하고 API 키를 설정해주세요.',
        name: 'EnvConfig');
  }

  // Google Mobile Ads 초기화
  try {
    await MobileAds.instance.initialize();
    developer.log('✅ Google Mobile Ads 초기화 완료', name: 'AdMob');
  } catch (e) {
    developer.log('❌ Google Mobile Ads 초기화 실패: $e', name: 'AdMob');
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => LocationProvider()),
        ChangeNotifierProvider(create: (_) => RestaurantProvider()),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp.router(
            title: '선장님 오늘의 메뉴는요?',
            debugShowCheckedModeBanner: false,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: themeProvider.themeMode,
            routerConfig: AppRouter.router,
          );
        },
      ),
    );
  }
}
