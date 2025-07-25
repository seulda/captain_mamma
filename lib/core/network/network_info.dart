import 'dart:io';

/// 네트워크 연결 상태 확인을 위한 추상 클래스
abstract class NetworkInfo {
  Future<bool> get isConnected;
}

/// NetworkInfo의 구현 클래스
class NetworkInfoImpl implements NetworkInfo {
  @override
  Future<bool> get isConnected => _hasConnection();

  Future<bool> _hasConnection() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      return false;
    }
  }
}
