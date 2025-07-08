import 'package:flutter/material.dart';

import '../utils/router.dart';

enum ErrorType {
  locationPermission,
  network,
  noResults,
  general,
}

class ErrorScreen extends StatelessWidget {
  final Object? error;
  final ErrorType errorType;

  const ErrorScreen({
    super.key,
    this.error,
    this.errorType = ErrorType.general,
  });

  @override
  Widget build(BuildContext context) {
    final errorData = _getErrorData(errorType);

    return Scaffold(
      appBar: AppBar(
        title: Text(errorData.title),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => AppNavigation.back(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // 에러 아이콘
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.errorContainer,
                  borderRadius: BorderRadius.circular(60),
                ),
                child: Icon(
                  errorData.icon,
                  size: 60,
                  color: Theme.of(context).colorScheme.error,
                ),
              ),
              
              const SizedBox(height: 32),
              
              // 에러 제목
              Text(
                errorData.title,
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              
              const SizedBox(height: 16),
              
              // 에러 메시지
              Text(
                errorData.message,
                style: Theme.of(context).textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
              
              const SizedBox(height: 48),
              
              // 액션 버튼들
              ...errorData.actions.map((action) => Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: action.onPressed,
                    child: Text(action.label),
                  ),
                ),
              )),
              
              // 디버그 정보 (개발 모드에서만)
              if (error != null) ...[
                const SizedBox(height: 24),
                ExpansionTile(
                  title: const Text('디버그 정보'),
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Text(
                        error.toString(),
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                  ],
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  ErrorData _getErrorData(ErrorType type) {
    switch (type) {
      case ErrorType.locationPermission:
        return ErrorData(
          icon: Icons.location_off,
          title: '위치 권한 필요',
          message: '현재 위치 기반 서비스를 이용하려면\n위치 권한을 허용해주세요.',
          actions: [
            ErrorAction(
              label: '설정으로 이동',
              onPressed: () {
                // TODO: 앱 설정으로 이동하는 기능 구현
                AppNavigation.back();
              },
            ),
            ErrorAction(
              label: '취소',
              onPressed: () => AppNavigation.back(),
            ),
          ],
        );
        
      case ErrorType.network:
        return ErrorData(
          icon: Icons.wifi_off,
          title: '네트워크 오류',
          message: '인터넷 연결을 확인하고\n다시 시도해주세요.',
          actions: [
            ErrorAction(
              label: '다시 시도',
              onPressed: () => AppNavigation.back(),
            ),
          ],
        );
        
      case ErrorType.noResults:
        return ErrorData(
          icon: Icons.search_off,
          title: '검색 결과 없음',
          message: '검색된 가게가 없습니다.\n검색 반경을 늘리거나 필터를 조정해보세요.',
          actions: [
            ErrorAction(
              label: '필터 변경',
              onPressed: () => AppNavigation.back(),
            ),
            ErrorAction(
              label: '뒤로가기',
              onPressed: () => AppNavigation.back(),
            ),
          ],
        );
        
      case ErrorType.general:
        return ErrorData(
          icon: Icons.error_outline,
          title: '오류 발생',
          message: '예상치 못한 오류가 발생했습니다.\n잠시 후 다시 시도해주세요.',
          actions: [
            ErrorAction(
              label: '다시 시도',
              onPressed: () => AppNavigation.back(),
            ),
            ErrorAction(
              label: '홈으로 이동',
              onPressed: () => AppNavigation.toMain(),
            ),
          ],
        );
    }
  }
}

class ErrorData {
  final IconData icon;
  final String title;
  final String message;
  final List<ErrorAction> actions;

  ErrorData({
    required this.icon,
    required this.title,
    required this.message,
    required this.actions,
  });
}

class ErrorAction {
  final String label;
  final VoidCallback onPressed;

  ErrorAction({
    required this.label,
    required this.onPressed,
  });
} 