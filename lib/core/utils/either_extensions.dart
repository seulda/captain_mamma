import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import '../error/failures.dart';

/// Either에 대한 확장 함수들
extension EitherExtensions<L, R> on Either<L, R> {
  /// Right 값을 안전하게 가져오기
  R getRight() => (this as Right<L, R>).value;

  /// Left 값을 안전하게 가져오기
  L getLeft() => (this as Left<L, R>).value;

  /// UI에서 성공/실패에 따라 다른 위젯을 반환
  Widget when({
    required Widget Function(L failure) failure,
    required Widget Function(R data) success,
  }) {
    return fold(
      (l) => failure(l),
      (r) => success(r),
    );
  }

  /// 연속적인 작업을 위한 flatMap
  Either<L, T> flatMap<T>(Either<L, T> Function(R r) f) {
    return fold(
      (l) => Left(l),
      (r) => f(r),
    );
  }

  /// Right 값이 존재하는지 확인
  bool get isRightValue => isRight();

  /// Left 값이 존재하는지 확인
  bool get isLeftValue => isLeft();
}

/// Failure에 특화된 Either 확장
extension EitherFailureExtensions<R> on Either<Failure, R> {
  /// 사용자 친화적인 에러 메시지 반환
  String get errorMessage {
    return fold(
      (failure) => failure.message,
      (_) => '',
    );
  }

  /// 에러 타입에 따른 아이콘 반환
  IconData get errorIcon {
    return fold(
      (failure) {
        if (failure is NetworkFailure) return Icons.wifi_off;
        if (failure is LocationPermissionFailure) return Icons.location_off;
        if (failure is LocationServiceFailure) return Icons.location_disabled;
        if (failure is PlacesApiFailure) return Icons.map_outlined;
        if (failure is ServerFailure) return Icons.dns;
        if (failure is CacheFailure) return Icons.storage;
        return Icons.error_outline;
      },
      (_) => Icons.check_circle,
    );
  }

  /// SnackBar용 색상 반환
  Color get errorColor {
    return fold(
      (failure) {
        if (failure is NetworkFailure) return Colors.orange;
        if (failure is LocationPermissionFailure) return Colors.amber;
        if (failure is ValidationFailure) return Colors.blue;
        return Colors.red;
      },
      (_) => Colors.green,
    );
  }
}
