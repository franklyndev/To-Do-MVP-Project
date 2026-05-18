import 'dart:convert';

import 'package:http/http.dart' as http;

import '../constants/api_config.dart';
import '../storage/token_storage.dart';

class ApiClient {
  final TokenStorage _tokenStorage = TokenStorage();

  Future<Map<String, String>> _headers({bool useToken = true}) async {
    final headers = {
      'Content-Type': 'application/json',
    };

    if (useToken) {
      final token = await _tokenStorage.getToken();

      if (token != null) {
        headers['Authorization'] = 'Bearer $token';
      }
    }

    return headers;
  }

  Future<dynamic> get(String path, {bool useToken = true}) async {
    final response = await http.get(
      Uri.parse('${Apiconfig.baseUrl}$path'),
      headers: await _headers(useToken: useToken),
    );

    return _handleResponse(response);
  }

  Future<dynamic> post(
    String path,
    Map<String, dynamic> body, {
    bool useToken = true,
  }) async {
    final response = await http.post(
      Uri.parse('${Apiconfig.baseUrl}$path'),
      headers: await _headers(useToken: useToken),
      body: jsonEncode(body),
    );

    return _handleResponse(response);
  }

  Future<dynamic> patch(
    String path,
    Map<String, dynamic> body, {
    bool useToken = true,
  }) async {
    final response = await http.patch(
      Uri.parse('${Apiconfig.baseUrl}$path'),
      headers: await _headers(useToken: useToken),
      body: jsonEncode(body),
    );

    return _handleResponse(response);
  }

  Future<dynamic> delete(String path, {bool useToken = true}) async {
    final response = await http.delete(
      Uri.parse('${Apiconfig.baseUrl}$path'),
      headers: await _headers(useToken: useToken),
    );

    return _handleResponse(response);
  }

  dynamic _handleResponse(http.Response response) {
    final hasBody = response.body.isNotEmpty;
    final data = hasBody ? jsonDecode(response.body) : null;

    if (response.statusCode >= 200 && response.statusCode < 300) {
      return data;
    }

    final message = data is Map && data['message'] != null
        ? data['message'].toString()
        : 'Erro ao comunicar com o servidor';

    throw Exception(message);
  }
}
