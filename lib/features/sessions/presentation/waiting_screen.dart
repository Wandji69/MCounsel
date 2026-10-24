import 'package:couple_conversations/features/questions/domain/question.dart';
import 'package:couple_conversations/features/sessions/domain/prototype_store.dart';
import 'package:flutter/material.dart';

class WaitingScreen extends StatelessWidget {
  const WaitingScreen({
    super.key,
    required this.question,
    required this.store,
  });

  final Question question;
  final PrototypeStore store;

  @override
  Widget build(BuildContext context) {
    final answer = store.textFor(question.id);
    return Scaffold(
      appBar: AppBar(title: const Text('Waiting')),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 12, 20, 32),
        children: [
          Text(question.title, style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: 12),
          const Text(
            'Your answer is submitted and locked in this practice session.',
          ),
          const SizedBox(height: 20),
          Text('Your answer', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 8),
          Text(answer),
          const SizedBox(height: 24),
          Text('Partner', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 8),
          Text(
            PrototypeStore.partnerStatusLabel,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 8),
          const Text(
            'Their answer stays hidden. This practice build has no partner answer, and it does not send yours anywhere.',
          ),
        ],
      ),
    );
  }
}
