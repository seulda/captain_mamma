import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/auth_provider.dart';
import '../utils/router.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => AppNavigation.back(),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // 로고
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Icon(
                  Icons.restaurant,
                  size: 50,
                  color: Colors.white,
                ),
              ),

              const SizedBox(height: 32),

              // 앱 제목
              Text(
                '선장님 오늘의 메뉴는요?',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 16),

              // 안내 메시지
              Text(
                '특정 위치 설정 및\n부가기능 이용을 위해\n로그인해주세요',
                style: Theme.of(context).textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 48),

              // 소셜 로그인 버튼들
              Consumer<AuthProvider>(
                builder: (context, authProvider, child) {
                  if (authProvider.isLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  return Column(
                    children: [
                      // Google 로그인
                      SizedBox(
                        width: double.infinity,
                        height: 48,
                        child: ElevatedButton.icon(
                          onPressed: () => _handleGoogleLogin(context),
                          icon: const Icon(Icons.account_circle,
                              color: Colors.white),
                          label: const Text('Google로 로그인'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF4285F4),
                            foregroundColor: Colors.white,
                          ),
                        ),
                      ),

                      const SizedBox(height: 12),

                      // Naver 로그인
                      SizedBox(
                        width: double.infinity,
                        height: 48,
                        child: ElevatedButton.icon(
                          onPressed: () => _handleNaverLogin(context),
                          icon: const Icon(Icons.account_circle,
                              color: Colors.white),
                          label: const Text('Naver로 로그인'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF03C75A),
                            foregroundColor: Colors.white,
                          ),
                        ),
                      ),

                      const SizedBox(height: 12),

                      // Kakao 로그인
                      SizedBox(
                        width: double.infinity,
                        height: 48,
                        child: ElevatedButton.icon(
                          onPressed: () => _handleKakaoLogin(context),
                          icon: const Icon(Icons.account_circle,
                              color: Colors.black),
                          label: const Text('Kakao로 로그인'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFFEE500),
                            foregroundColor: Colors.black,
                          ),
                        ),
                      ),

                      const SizedBox(height: 32),

                      // 나중에 하기 버튼
                      TextButton(
                        onPressed: () => AppNavigation.back(),
                        child: Text(
                          '나중에 하기',
                          style:
                              Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.color,
                                  ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _handleGoogleLogin(BuildContext context) async {
    final authProvider = context.read<AuthProvider>();

    try {
      final success = await authProvider.signInWithGoogle();
      if (success && context.mounted) {
        _showLoginSuccess(context, 'Google');
        AppNavigation.back();
      } else if (context.mounted) {
        _showLoginError(context, 'Google 로그인에 실패했습니다.');
      }
    } catch (e) {
      if (context.mounted) {
        _showLoginError(context, 'Google 로그인 중 오류가 발생했습니다.');
      }
    }
  }

  Future<void> _handleNaverLogin(BuildContext context) async {
    final authProvider = context.read<AuthProvider>();

    try {
      final success = await authProvider.signInWithNaver();
      if (success && context.mounted) {
        _showLoginSuccess(context, 'Naver');
        AppNavigation.back();
      } else if (context.mounted) {
        _showLoginError(context, 'Naver 로그인 기능은 준비 중입니다.');
      }
    } catch (e) {
      if (context.mounted) {
        _showLoginError(context, 'Naver 로그인 중 오류가 발생했습니다.');
      }
    }
  }

  Future<void> _handleKakaoLogin(BuildContext context) async {
    final authProvider = context.read<AuthProvider>();

    try {
      final success = await authProvider.signInWithKakao();
      if (success && context.mounted) {
        _showLoginSuccess(context, 'Kakao');
        AppNavigation.back();
      } else if (context.mounted) {
        _showLoginError(context, 'Kakao 로그인 기능은 준비 중입니다.');
      }
    } catch (e) {
      if (context.mounted) {
        _showLoginError(context, 'Kakao 로그인 중 오류가 발생했습니다.');
      }
    }
  }

  void _showLoginSuccess(BuildContext context, String provider) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$provider 로그인 성공!'),
        backgroundColor: Colors.green,
      ),
    );
  }

  void _showLoginError(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ),
    );
  }
}
