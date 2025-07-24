import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../screens/splash_screen.dart';
import '../screens/main_screen.dart';
import '../screens/login_screen.dart';
import '../screens/restaurant_detail_screen.dart';
import '../screens/navigation_screen.dart';
import '../screens/settings_screen.dart';
import '../screens/error_screen.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/splash',
    errorBuilder: (context, state) => ErrorScreen(error: state.error),
    routes: [
      // 스플래시 화면
      GoRoute(
        path: '/splash',
        name: 'splash',
        builder: (context, state) => const SplashScreen(),
      ),

      // 메인 화면 (지도)
      GoRoute(
        path: '/',
        name: 'main',
        builder: (context, state) => const MainScreen(),
      ),

      // 로그인 화면
      GoRoute(
        path: '/login',
        name: 'login',
        builder: (context, state) => const LoginScreen(),
      ),

      // 레스토랑 상세 화면
      GoRoute(
        path: '/restaurant/:id',
        name: 'restaurant_detail',
        builder: (context, state) {
          final restaurantId = state.pathParameters['id']!;
          return RestaurantDetailScreen(restaurantId: restaurantId);
        },
      ),

      // 길안내 화면
      GoRoute(
        path: '/navigation',
        name: 'navigation',
        builder: (context, state) {
          final extra = state.extra as Map<String, dynamic>?;
          return NavigationScreen(
            restaurantId: extra?['restaurantId'],
            restaurantName: extra?['restaurantName'],
            latitude: extra?['latitude'],
            longitude: extra?['longitude'],
          );
        },
      ),

      // 설정 화면
      GoRoute(
        path: '/settings',
        name: 'settings',
        builder: (context, state) => const SettingsScreen(),
      ),

      // 에러 화면들
      GoRoute(
        path: '/error/location',
        name: 'location_error',
        builder: (context, state) => const ErrorScreen(
          errorType: ErrorType.locationPermission,
        ),
      ),

      GoRoute(
        path: '/error/network',
        name: 'network_error',
        builder: (context, state) => const ErrorScreen(
          errorType: ErrorType.network,
        ),
      ),

      GoRoute(
        path: '/error/no_results',
        name: 'no_results_error',
        builder: (context, state) => const ErrorScreen(
          errorType: ErrorType.noResults,
        ),
      ),
    ],
  );
}

// 네비게이션 헬퍼 클래스
class AppNavigation {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  // 스플래시에서 메인으로 이동
  static void toMain() {
    AppRouter.router.go('/');
  }

  // 로그인 화면으로 이동
  static void toLogin() {
    AppRouter.router.push('/login');
  }

  // 레스토랑 상세 화면으로 이동
  static void toRestaurantDetail(String restaurantId) {
    AppRouter.router.push('/restaurant/$restaurantId');
  }

  // 길안내 화면으로 이동
  static void toNavigation({
    required String restaurantId,
    required String restaurantName,
    required double latitude,
    required double longitude,
  }) {
    AppRouter.router.push('/navigation', extra: {
      'restaurantId': restaurantId,
      'restaurantName': restaurantName,
      'latitude': latitude,
      'longitude': longitude,
    });
  }

  // 설정 화면으로 이동
  static void toSettings() {
    AppRouter.router.push('/settings');
  }

  // 에러 화면으로 이동
  static void toLocationError() {
    AppRouter.router.push('/error/location');
  }

  static void toNetworkError() {
    AppRouter.router.push('/error/network');
  }

  static void toNoResultsError() {
    AppRouter.router.push('/error/no_results');
  }

  // 뒤로가기
  static void back() {
    AppRouter.router.pop();
  }

  // 특정 경로로 교체
  static void replace(String path) {
    AppRouter.router.pushReplacement(path);
  }
}
