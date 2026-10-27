import 'package:couple_conversations/features/auth/domain/account_session.dart';

abstract class AuthRepository {
  Future<AccountSession> signIn({
    required String email,
    required String password,
  });

  Future<AccountSession> signUp({
    required String displayName,
    required String email,
    required String password,
  });

  Future<void> signOut();
}

class UnconfiguredAuthRepository implements AuthRepository {
  const UnconfiguredAuthRepository();

  @override
  Future<AccountSession> signIn({
    required String email,
    required String password,
  }) {
    return Future.error(_missingConfig);
  }

  @override
  Future<AccountSession> signUp({
    required String displayName,
    required String email,
    required String password,
  }) {
    return Future.error(_missingConfig);
  }

  @override
  Future<void> signOut() async {}
}

const AuthException _missingConfig = AuthException(
  'Sign-in is not configured on this build. Add SUPABASE_URL, SUPABASE_ANON_KEY, and API_BASE_URL when you start the server.',
);
