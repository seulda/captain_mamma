import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/user_model.dart';
import '../services/auth_service.dart';

class AuthProvider extends ChangeNotifier {
  UserModel? _user;
  bool _isAuthenticated = false;
  bool _isLoading = false;

  UserModel? get user => _user;
  bool get isAuthenticated => _isAuthenticated;
  bool get isLoading => _isLoading;

  final AuthService _authService = AuthService();
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  AuthProvider() {
    _checkAuthStatus();
  }

  // 로그인 상태 확인
  Future<void> _checkAuthStatus() async {
    _setLoading(true);
    try {
      final prefs = await SharedPreferences.getInstance();
      final userId = prefs.getString('userId');
      final userEmail = prefs.getString('userEmail');
      final userName = prefs.getString('userName');

      if (userId != null && userEmail != null && userName != null) {
        _user = UserModel(
          id: userId,
          email: userEmail,
          name: userName,
          loginProvider: prefs.getString('loginProvider') ?? 'unknown',
        );
        _isAuthenticated = true;
      }
    } catch (e) {
      debugPrint('인증 상태 확인 실패: $e');
    } finally {
      _setLoading(false);
    }
  }

  // Google 로그인
  Future<bool> signInWithGoogle() async {
    _setLoading(true);
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        _setLoading(false);
        return false;
      }

      final user = UserModel(
        id: googleUser.id,
        email: googleUser.email,
        name: googleUser.displayName ?? '',
        photoUrl: googleUser.photoUrl,
        loginProvider: 'google',
      );

      await _saveUserData(user);
      
      // 서버에 사용자 정보 저장 (백그라운드에서 실행)
      _authService.saveUserToServer(user);
      
      _user = user;
      _isAuthenticated = true;
      
      notifyListeners();
      return true;
    } catch (e) {
      debugPrint('Google 로그인 실패: $e');
      return false;
    } finally {
      _setLoading(false);
    }
  }

  // Naver 로그인 (추후 구현)
  Future<bool> signInWithNaver() async {
    _setLoading(true);
    try {
      // TODO: Naver 로그인 SDK 연동
      await Future.delayed(const Duration(seconds: 1)); // 임시
      return false;
    } catch (e) {
      debugPrint('Naver 로그인 실패: $e');
      return false;
    } finally {
      _setLoading(false);
    }
  }

  // Kakao 로그인 (추후 구현)
  Future<bool> signInWithKakao() async {
    _setLoading(true);
    try {
      // TODO: Kakao 로그인 SDK 연동
      await Future.delayed(const Duration(seconds: 1)); // 임시
      return false;
    } catch (e) {
      debugPrint('Kakao 로그인 실패: $e');
      return false;
    } finally {
      _setLoading(false);
    }
  }

  // 로그아웃
  Future<void> signOut() async {
    _setLoading(true);
    try {
      // 소셜 로그인 로그아웃
      if (_user?.loginProvider == 'google') {
        await _googleSignIn.signOut();
      }

      // 로컬 데이터 삭제
      await _clearUserData();
      
      _user = null;
      _isAuthenticated = false;
      
      notifyListeners();
    } catch (e) {
      debugPrint('로그아웃 실패: $e');
    } finally {
      _setLoading(false);
    }
  }

  // 사용자 데이터 저장
  Future<void> _saveUserData(UserModel user) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('userId', user.id);
      await prefs.setString('userEmail', user.email);
      await prefs.setString('userName', user.name);
      await prefs.setString('loginProvider', user.loginProvider);
      if (user.photoUrl != null) {
        await prefs.setString('userPhotoUrl', user.photoUrl!);
      }
    } catch (e) {
      debugPrint('사용자 데이터 저장 실패: $e');
    }
  }

  // 사용자 데이터 삭제
  Future<void> _clearUserData() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove('userId');
      await prefs.remove('userEmail');
      await prefs.remove('userName');
      await prefs.remove('loginProvider');
      await prefs.remove('userPhotoUrl');
    } catch (e) {
      debugPrint('사용자 데이터 삭제 실패: $e');
    }
  }

  // 로딩 상태 설정
  void _setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }
} 