import 'package:flutter/material.dart';
import '../error/failures.dart';

/// 에러 상태를 표시하는 공통 위젯
class AppErrorWidget extends StatelessWidget {
  final Failure failure;
  final VoidCallback? onRetry;
  final String? retryText;

  const AppErrorWidget({
    super.key,
    required this.failure,
    this.onRetry,
    this.retryText,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              _getErrorIcon(),
              size: 64,
              color: _getErrorColor(),
            ),
            const SizedBox(height: 16),
            Text(
              failure.message,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Colors.grey[700],
                  ),
            ),
            if (onRetry != null) ...[
              const SizedBox(height: 24),
              ElevatedButton.icon(
                onPressed: onRetry,
                icon: const Icon(Icons.refresh),
                label: Text(retryText ?? '다시 시도'),
              ),
            ],
          ],
        ),
      ),
    );
  }

  IconData _getErrorIcon() {
    if (failure is NetworkFailure) return Icons.wifi_off;
    if (failure is LocationPermissionFailure) return Icons.location_off;
    if (failure is LocationServiceFailure) return Icons.location_disabled;
    if (failure is PlacesApiFailure) return Icons.map_outlined;
    if (failure is ServerFailure) return Icons.dns;
    if (failure is CacheFailure) return Icons.storage;
    return Icons.error_outline;
  }

  Color _getErrorColor() {
    if (failure is NetworkFailure) return Colors.orange;
    if (failure is LocationPermissionFailure) return Colors.amber;
    if (failure is ValidationFailure) return Colors.blue;
    return Colors.red;
  }
}
