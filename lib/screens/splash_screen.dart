import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/location_provider.dart';
import '../providers/auth_provider.dart';
import '../utils/router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeIn,
    ));

    _animationController.forward();
    _initializeApp();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Future<void> _initializeApp() async {
    try {
      // 최소 스플래시 표시 시간
      await Future.delayed(const Duration(seconds: 2));

      // Provider들을 미리 가져오기
      if (!mounted) return;
      final locationProvider = context.read<LocationProvider>();

      // AuthProvider 초기화 (생성자에서 자동으로 인증 상태 확인)
      context.read<AuthProvider>();

      // 위치 권한 확인
      await locationProvider.requestLocationPermission();

      // 메인 화면으로 이동
      if (mounted) {
        AppNavigation.toMain();
      }
    } catch (e) {
      debugPrint('앱 초기화 실패: $e');
      if (mounted) {
        AppNavigation.toMain();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // 앱 아이콘 또는 로고 (추후 추가)
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.1),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.restaurant,
                  size: 60,
                  color: Color(0xFF2196F3),
                ),
              ),

              const SizedBox(height: 32),

              // 앱 제목
              Text(
                '선장님 오늘의 메뉴는요?',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 16),

              // 부제목
              Text(
                '메뉴 고민 끝! 가까운 맛집을 찾아드려요',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Colors.white.withValues(alpha: 0.8),
                    ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 48),

              // 로딩 인디케이터
              const SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
