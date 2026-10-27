import 'package:couple_conversations/features/auth/domain/account_session.dart';
import 'package:couple_conversations/features/home/presentation/home_screen.dart';
import 'package:couple_conversations/features/questions/data/question_repository.dart';
import 'package:couple_conversations/features/sessions/domain/prototype_store.dart';
import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({
    super.key,
    required this.session,
    required this.questions,
    required this.store,
    required this.onSignOut,
  });

  final AccountSession session;
  final QuestionRepository questions;
  final PrototypeStore store;
  final Future<void> Function() onSignOut;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Your account')),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 12, 20, 32),
        children: [
          Text(session.displayName, style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: 8),
          Text('Role: ${session.role}'),
          const SizedBox(height: 16),
          const Text(
            'This screen shows only your profile. Another account cannot open it. Practice answers on the next screen stay in memory on this phone.',
          ),
          const SizedBox(height: 20),
          FilledButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute<void>(
                  builder: (context) => HomeScreen(repository: questions, store: store),
                ),
              );
            },
            child: const Text('Practice questions'),
          ),
          const SizedBox(height: 8),
          TextButton(
            onPressed: () async {
              await onSignOut();
              if (!context.mounted) {
                return;
              }
              Navigator.of(context).popUntil((route) => route.isFirst);
            },
            child: const Text('Sign out'),
          ),
        ],
      ),
    );
  }
}
