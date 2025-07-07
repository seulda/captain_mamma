import 'package:dio/dio.dart';
import '../models/user_model.dart';

class AuthService {
  final Dio _dio = Dio();
  
  // TODO: 실제 API 엔드포인트로 변경
  static const String baseUrl = 'https://api.captain-menu.com';

  AuthService() {
    _dio.options.baseUrl = baseUrl;
    _dio.options.connectTimeout = const Duration(seconds: 10);
    _dio.options.receiveTimeout = const Duration(seconds: 10);
  }

  // 사용자 정보 서버에 저장/업데이트
  Future<bool> saveUserToServer(UserModel user) async {
    try {
      final response = await _dio.post('/auth/user', data: user.toJson());
      return response.statusCode == 200;
    } catch (e) {
      print('사용자 정보 저장 실패: $e');
      return false;
    }
  }

  // 서버에서 사용자 정보 가져오기
  Future<UserModel?> getUserFromServer(String userId) async {
    try {
      final response = await _dio.get('/auth/user/$userId');
      if (response.statusCode == 200) {
        return UserModel.fromJson(response.data);
      }
      return null;
    } catch (e) {
      print('사용자 정보 가져오기 실패: $e');
      return null;
    }
  }

  // 사용자 삭제
  Future<bool> deleteUserFromServer(String userId) async {
    try {
      final response = await _dio.delete('/auth/user/$userId');
      return response.statusCode == 200;
    } catch (e) {
      print('사용자 삭제 실패: $e');
      return false;
    }
  }

  // 토큰 갱신
  Future<String?> refreshToken(String refreshToken) async {
    try {
      final response = await _dio.post('/auth/refresh', data: {
        'refreshToken': refreshToken,
      });
      
      if (response.statusCode == 200) {
        return response.data['accessToken'];
      }
      return null;
    } catch (e) {
      print('토큰 갱신 실패: $e');
      return null;
    }
  }
} 