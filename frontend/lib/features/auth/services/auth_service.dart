import '../../../core/services/api_client.dart';

class AuthService {
  final ApiClient _apiClient = ApiClient();

  Future<Map<String, dynamic>> login({
    required String email,
    required String password,
  }) async {
    final response = await _apiClient.post('/login', {
      'email': email,
      'password': password,
    }, useToken: false);

    return Map<String, dynamic>.from(response);
  }

  Future<Map<String, dynamic>> register({
    required String name,
    required String email,
    required String password,
  }) async {
    final response = await _apiClient.post('/users', {
      'name': name,
      'email': email,
      'password': password,
    }, useToken: false);

    return Map<String, dynamic>.from(response);
  }
}
