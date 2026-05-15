import 'package:flutter/material.dart';

import '../../../core/storage/token_storage.dart';
import '../services/auth_service.dart';

class AuthController extends ChangeNotifier {
  final AuthService _authService = AuthService();
  final TokenStorage _tokenStorage = TokenStorage();

  bool isLoading = false;
  String? errorMessage;

  Future<bool> login({
    required String email,
    required String password,
  }) async {
    try {
      isLoading = true;
      errorMessage = null;
      notifyListeners();

      final response = await _authService.login(
        email: email,
        password: password,
      );

      final token = response['token']?.toString();

      if (token == null || token.isEmpty) {
        throw Exception('Token não encontrado na resposta do servidor');
      }

      await _tokenStorage.saveToken(token);

      return true;
    } catch (error) {
      errorMessage = error.toString().replaceFirst('Exception: ', '');
      return false;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> register({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      isLoading = true;
      errorMessage = null;
      notifyListeners();

      await _authService.register(
        name: name,
        email: email,
        password: password,
      );

      return true;
    } catch (error) {
      errorMessage = error.toString().replaceFirst('Exception: ', '');
      return false;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> hasToken() async {
    final token = await _tokenStorage.getToken();
    return token != null && token.isNotEmpty;
  }

  Future<void> logout() async {
    await _tokenStorage.deleteToken();
  }
}
