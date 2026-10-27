import 'package:couple_conversations/features/auth/data/auth_repository.dart';
import 'package:couple_conversations/features/auth/domain/account_session.dart';
import 'package:couple_conversations/features/auth/presentation/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('empty sign-in stays on the form', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: SignInScreen(auth: _FakeAuth(), onSignedIn: (_, _) {}),
      ),
    );

    await tester.tap(find.widgetWithText(FilledButton, 'Sign in'));
    await tester.pump();

    expect(find.text('Enter the email for your account.'), findsOneWidget);
    expect(find.text('Ada'), findsNothing);
  });

  testWidgets('a successful sign-in opens only the returned profile', (
    tester,
  ) async {
    AccountSession? opened;
    await tester.pumpWidget(
      MaterialApp(
        home: SignInScreen(
          auth: _FakeAuth(),
          onSignedIn: (_, session) => opened = session,
        ),
      ),
    );

    await tester.enterText(find.byType(TextFormField).at(0), 'ada@example.com');
    await tester.enterText(find.byType(TextFormField).at(1), 'password1');
    await tester.tap(find.widgetWithText(FilledButton, 'Sign in'));
    await tester.pump();

    expect(opened?.displayName, 'Ada');
    expect(opened?.role, 'partner');
    expect(opened?.userId, '11111111-1111-1111-1111-111111111111');
  });

  testWidgets('practice without an account stays available when offered', (
    tester,
  ) async {
    var opened = false;
    await tester.pumpWidget(
      MaterialApp(
        home: SignInScreen(
          auth: _FakeAuth(),
          onSignedIn: (_, _) {},
          onPracticeWithoutAccount: (_) => opened = true,
        ),
      ),
    );

    await tester.tap(find.text('Practice without an account'));
    await tester.pump();

    expect(opened, isTrue);
  });
}

class _FakeAuth implements AuthRepository {
  @override
  Future<AccountSession> signIn({
    required String email,
    required String password,
  }) async {
    return const AccountSession(
      userId: '11111111-1111-1111-1111-111111111111',
      displayName: 'Ada',
      role: 'partner',
    );
  }

  @override
  Future<AccountSession> signUp({
    required String displayName,
    required String email,
    required String password,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<void> signOut() async {}
}
