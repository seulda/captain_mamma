import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/theme_provider.dart';
import '../providers/auth_provider.dart';
import '../utils/router.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('설정'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => AppNavigation.back(),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // 사용자 정보
          Consumer<AuthProvider>(
            builder: (context, authProvider, child) {
              return Card(
                child: ListTile(
                  leading: const Icon(Icons.account_circle),
                  title: Text(authProvider.isAuthenticated
                      ? authProvider.user?.name ?? '사용자'
                      : '로그인되지 않음'),
                  subtitle: Text(authProvider.isAuthenticated
                      ? '${authProvider.user?.loginProvider} 로그인'
                      : '로그인하여 더 많은 기능을 이용해보세요'),
                  trailing: authProvider.isAuthenticated
                      ? IconButton(
                          icon: const Icon(Icons.logout),
                          onPressed: () => _showLogoutDialog(context),
                        )
                      : null,
                  onTap: authProvider.isAuthenticated
                      ? null
                      : () => AppNavigation.toLogin(),
                ),
              );
            },
          ),

          const SizedBox(height: 16),

          // 테마 설정
          Card(
            child: Consumer<ThemeProvider>(
              builder: (context, themeProvider, child) {
                return SwitchListTile(
                  secondary: const Icon(Icons.dark_mode),
                  title: const Text('다크 모드'),
                  subtitle: const Text('어두운 테마로 변경'),
                  value: themeProvider.isDarkMode,
                  onChanged: (value) => themeProvider.toggleTheme(),
                );
              },
            ),
          ),

          const SizedBox(height: 16),

          // 알림 설정 (플레이스홀더)
          Card(
            child: SwitchListTile(
              secondary: const Icon(Icons.notifications),
              title: const Text('푸시 알림'),
              subtitle: const Text('앱 알림 받기'),
              value: true,
              onChanged: (value) {
                // TODO: 알림 설정 구현
              },
            ),
          ),

          const SizedBox(height: 16),

          // 위치 권한 관리 (플레이스홀더)
          Card(
            child: SwitchListTile(
              secondary: const Icon(Icons.location_on),
              title: const Text('위치 서비스'),
              subtitle: const Text('현재 위치 사용'),
              value: true,
              onChanged: (value) {
                // TODO: 위치 권한 관리 구현
              },
            ),
          ),

          const SizedBox(height: 16),

          // 앱 정보
          Card(
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.info),
                  title: const Text('앱 정보'),
                  subtitle: const Text('버전 1.0.0'),
                  onTap: () {
                    showAboutDialog(
                      context: context,
                      applicationName: '선장님 오늘의 메뉴는요?',
                      applicationVersion: '1.0.0',
                      applicationIcon: const Icon(Icons.restaurant),
                      children: [
                        const Text('메뉴 고민 끝! 가까운 맛집을 찾아드려요.'),
                      ],
                    );
                  },
                ),
                const Divider(height: 1),
                ListTile(
                  leading: const Icon(Icons.description),
                  title: const Text('이용약관'),
                  onTap: () {
                    // TODO: 이용약관 화면으로 이동
                  },
                ),
                const Divider(height: 1),
                ListTile(
                  leading: const Icon(Icons.privacy_tip),
                  title: const Text('개인정보처리방침'),
                  onTap: () {
                    // TODO: 개인정보처리방침 화면으로 이동
                  },
                ),
              ],
            ),
          ),

          // 광고 배너 영역 (플레이스홀더)
          const SizedBox(height: 32),
          Container(
            height: 50,
            width: double.infinity,
            color: Colors.amber[100],
            child: const Center(
              child: Text(
                '광고 배너 영역',
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('로그아웃'),
        content: const Text('정말 로그아웃하시겠습니까?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('취소'),
          ),
          TextButton(
            onPressed: () {
              context.read<AuthProvider>().signOut();
              Navigator.pop(context);
              AppNavigation.back();
            },
            child: const Text('로그아웃'),
          ),
        ],
      ),
    );
  }
}
