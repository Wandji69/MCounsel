import 'dart:convert';

import 'package:couple_conversations/core/networking/api_config.dart';
import 'package:couple_conversations/features/auth/data/supabase_auth_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';

void main() {
  const config = ApiConfig(
    supabaseUrl: 'https://example.supabase.co',
    supabaseAnonKey: 'public-anon-key',
    apiBaseUrl: 'https://api.example.test',
  );

  test('sign-in asks Laravel for the token user and keeps the service key out', () async {
    final requests = <http.Request>[];
    final client = MockClient((request) async {
      requests.add(request);
      if (request.url.path.endsWith('/token')) {
        return http.Response(
          jsonEncode({
            'access_token': 'user-access-token',
            'user': {'id': 'someone-else'},
          }),
          200,
        );
      }
      expect(request.url.path, '/api/me');
      expect(request.url.queryParameters.containsKey('user_id'), isFalse);
      return http.Response(
        jsonEncode({
          'id': '11111111-1111-1111-1111-111111111111',
          'display_name': 'Ada',
          'role': 'partner',
        }),
        200,
      );
    });

    final session = await SupabaseAuthRepository(
      config: config,
      client: client,
    ).signIn(email: 'ada@example.com', password: 'password1');

    expect(session.displayName, 'Ada');
    expect(requests.first.headers['apikey'], 'public-anon-key');
    expect(requests.first.headers.containsKey('service_role'), isFalse);
    expect(requests.last.headers['Authorization'], 'Bearer user-access-token');
    expect(requests.last.url.path, '/api/me');
    expect(jsonEncode(requests.map((request) => request.body).toList()).contains('service_role'), isFalse);
  });
}
