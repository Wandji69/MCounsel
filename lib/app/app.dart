import 'package:couple_conversations/app/theme/app_theme.dart';
import 'package:couple_conversations/features/auth/data/auth_repository.dart';
import 'package:couple_conversations/features/auth/domain/account_session.dart';
import 'package:couple_conversations/features/auth/presentation/account_screen.dart';
import 'package:couple_conversations/features/auth/presentation/sign_in_screen.dart';
import 'package:couple_conversations/features/home/presentation/home_screen.dart';
import 'package:couple_conversations/features/questions/data/question_repository.dart';
import 'package:couple_conversations/features/sessions/domain/prototype_store.dart';
import 'package:flutter/material.dart';

class CoupleConversationsApp extends StatefulWidget {
  const CoupleConversationsApp({
    super.key,
    required this.repository,
    required this.authRepository,
    this.store,
    this.allowPracticeWithoutAccount = false,
  });

  final QuestionRepository repository;
  final AuthRepository authRepository;

  /// When omitted, the app owns an in-memory store and disposes it.
  final PrototypeStore? store;

  /// Available only when this build has no auth server configured.
  final bool allowPracticeWithoutAccount;

  @override
  State<CoupleConversationsApp> createState() => _CoupleConversationsAppState();
}

class _CoupleConversationsAppState extends State<CoupleConversationsApp> {
  late final PrototypeStore _store = widget.store ?? PrototypeStore();
  late final bool _ownsStore = widget.store == null;

  @override
  void dispose() {
    if (_ownsStore) {
      _store.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Couple Conversations',
      theme: buildAppTheme(),
      home: _signIn(),
    );
  }

  SignInScreen _signIn() {
    return SignInScreen(
      auth: widget.authRepository,
      onSignedIn: _openAccount,
      onPracticeWithoutAccount: widget.allowPracticeWithoutAccount
          ? _openPractice
          : null,
    );
  }

  void _openPractice(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (context) => HomeScreen(repository: widget.repository, store: _store),
      ),
    );
  }

  void _openAccount(BuildContext context, AccountSession session) {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute<void>(
        builder: (context) => AccountScreen(
          session: session,
          questions: widget.repository,
          store: _store,
          onSignOut: () => _signOut(context),
        ),
      ),
      (route) => false,
    );
  }

  Future<void> _signOut(BuildContext context) async {
    await widget.authRepository.signOut();
    if (!context.mounted) {
      return;
    }
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute<void>(
        builder: (context) => _signIn(),
      ),
      (route) => false,
    );
  }
}
