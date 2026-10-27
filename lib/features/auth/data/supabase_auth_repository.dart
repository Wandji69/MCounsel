import 'dart:convert';

import 'package:couple_conversations/core/networking/api_config.dart';
import 'package:couple_conversations/features/auth/data/auth_repository.dart';
import 'package:couple_conversations/features/auth/domain/account_session.dart';
import 'package:http/http.dart' as http;

class SupabaseAuthRepository implements AuthRepository {
  SupabaseAuthRepository({required this.config, http.Client? client})
    : _client = client ?? http.Client();

  final ApiConfig config;
  final http.Client _client;
  String? _accessToken;

  @override
  Future<AccountSession> signIn({
    required String email,
    required String password,
  }) async {
    final token = await _passwordToken(email: email, password: password);
    return _loadProfile(token);
  }

  @override
  Future<AccountSession> signUp({
    required String displayName,
    required String email,
    required String password,
  }) async {
    final response = await _client.post(
      _supabaseUri('/auth/v1/signup'),
      headers: _supabaseHeaders(),
      body: jsonEncode({
        'email': email.trim(),
        'password': password,
        'data': {'display_name': displayName.trim()},
      }),
    );
    final body = _decode(response);
    final token = body['access_token'];
    if (response.statusCode >= 400 || token is! String || token.isEmpty) {
      if (response.statusCode < 400) {
        throw const AuthException(
          'Account created. Confirm your email, then sign in.',
        );
      }
      throw AuthException(_errorMessage(body, 'The account could not be created.'));
    }
    return _loadProfile(token);
  }

  @override
  Future<void> signOut() async {
    final token = _accessToken;
    _accessToken = null;
    if (token == null) {
      return;
    }
    try {
      await _client.post(
        _supabaseUri('/auth/v1/logout'),
        headers: {..._supabaseHeaders(), 'Authorization': 'Bearer $token'},
      );
    } catch (_) {
      // The local session is already cleared.
    }
  }

  Future<String> _passwordToken({
    required String email,
    required String password,
  }) async {
    final response = await _client.post(
      _supabaseUri('/auth/v1/token?grant_type=password'),
      headers: _supabaseHeaders(),
      body: jsonEncode({'email': email.trim(), 'password': password}),
    );
    final body = _decode(response);
    final token = body['access_token'];
    if (response.statusCode >= 400 || token is! String || token.isEmpty) {
      throw AuthException(_errorMessage(body, 'The email or password was not accepted.'));
    }
    return token;
  }

  Future<AccountSession> _loadProfile(String accessToken) async {
    _accessToken = accessToken;
    final response = await _client.get(
      _apiUri('/api/me'),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
    );
    final body = _decode(response);
    if (response.statusCode == 403) {
      throw const AuthException('This account cannot open a profile.');
    }
    if (response.statusCode >= 400) {
      throw const AuthException('The server did not accept this session.');
    }
    return AccountSession.fromJson(body);
  }

  Uri _supabaseUri(String path) {
    final base = config.supabaseUrl.endsWith('/')
        ? config.supabaseUrl.substring(0, config.supabaseUrl.length - 1)
        : config.supabaseUrl;
    return Uri.parse('$base$path');
  }

  Uri _apiUri(String path) {
    final base = config.apiBaseUrl.endsWith('/')
        ? config.apiBaseUrl.substring(0, config.apiBaseUrl.length - 1)
        : config.apiBaseUrl;
    return Uri.parse('$base$path');
  }

  Map<String, String> _supabaseHeaders() {
    return {
      'apikey': config.supabaseAnonKey,
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
  }

  Map<String, Object?> _decode(http.Response response) {
    if (response.body.isEmpty) {
      return {};
    }
    final decoded = jsonDecode(response.body);
    if (decoded is Map<String, Object?>) {
      return decoded;
    }
    if (decoded is Map) {
      return Map<String, Object?>.from(decoded);
    }
    return {};
  }

  String _errorMessage(Map<String, Object?> body, String fallback) {
    final message = body['msg'] ?? body['error_description'] ?? body['message'];
    if (message is String && message.trim().isNotEmpty) {
      return message;
    }
    return fallback;
  }
}
