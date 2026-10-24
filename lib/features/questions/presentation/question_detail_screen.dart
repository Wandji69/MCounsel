import 'package:couple_conversations/features/questions/domain/question.dart';
import 'package:couple_conversations/features/sessions/domain/prototype_store.dart';
import 'package:couple_conversations/features/sessions/presentation/status_chip.dart';
import 'package:couple_conversations/features/sessions/presentation/answer_editor_screen.dart';
import 'package:couple_conversations/features/sessions/presentation/waiting_screen.dart';
import 'package:flutter/material.dart';

class QuestionDetailScreen extends StatelessWidget {
  const QuestionDetailScreen({
    super.key,
    required this.question,
    required this.store,
  });

  final Question question;
  final PrototypeStore store;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(question.title)),
      body: ListenableBuilder(
        listenable: store,
        builder: (context, _) {
          final status = store.statusFor(question.id);
          final locked = status == ResponseStatus.submitted;
          return ListView(
            padding: const EdgeInsets.fromLTRB(20, 12, 20, 32),
            children: [
              if (question.isHighSensitivity) ...[
                const _SensitivityNotice(),
                const SizedBox(height: 16),
              ],
              Text(
                question.text,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 16),
              Text(question.guidance, style: Theme.of(context).textTheme.bodyLarge),
              if (question.followUpPrompts.isNotEmpty) ...[
                const SizedBox(height: 20),
                Text(
                  'You might also ask',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 8),
                for (final prompt in question.followUpPrompts)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Text(prompt),
                  ),
              ],
              const SizedBox(height: 12),
              StatusChip(status: status),
              const SizedBox(height: 20),
              if (locked) ...[
                const Text(
                  'Your answer is submitted and locked for this practice session.',
                ),
                const SizedBox(height: 12),
                FilledButton(
                  onPressed: () => _openWaiting(context),
                  child: const Text('View waiting status'),
                ),
                const SizedBox(height: 8),
                TextButton(
                  onPressed: () => _openEditor(context),
                  child: const Text('Read your locked answer'),
                ),
              ] else ...[
                if (status == ResponseStatus.skipped)
                  const Padding(
                    padding: EdgeInsets.only(bottom: 12),
                    child: Text(
                      'You skipped this question. You can still answer it.',
                    ),
                  ),
                if (status == ResponseStatus.notReady)
                  const Padding(
                    padding: EdgeInsets.only(bottom: 12),
                    child: Text(
                      'You marked this not ready. You can still answer it.',
                    ),
                  ),
                FilledButton(
                  onPressed: () => _openEditor(context),
                  child: Text(
                    status == ResponseStatus.draft
                        ? 'Continue draft'
                        : 'Answer privately',
                  ),
                ),
                const SizedBox(height: 8),
                TextButton(
                  onPressed: () {
                    store.skip(question.id);
                    Navigator.of(context).pop();
                  },
                  child: const Text('Skip'),
                ),
                TextButton(
                  onPressed: () {
                    store.markNotReady(question.id);
                    Navigator.of(context).pop();
                  },
                  child: const Text('Not ready to discuss'),
                ),
              ],
            ],
          );
        },
      ),
    );
  }

  void _openEditor(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (context) =>
            AnswerEditorScreen(question: question, store: store),
      ),
    );
  }

  void _openWaiting(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (context) => WaitingScreen(question: question, store: store),
      ),
    );
  }
}

class _SensitivityNotice extends StatelessWidget {
  const _SensitivityNotice();

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Material(
      color: scheme.tertiaryContainer,
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Text(
          'Sensitive question. You can skip it. You do not owe the app or your partner an immediate answer. If talking about this could put you in danger, contact local emergency services. This app is not a crisis service.',
          style: TextStyle(color: scheme.onTertiaryContainer, height: 1.4),
        ),
      ),
    );
  }
}
