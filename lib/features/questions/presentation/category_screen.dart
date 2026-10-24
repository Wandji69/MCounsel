import 'package:couple_conversations/features/questions/domain/question.dart';
import 'package:couple_conversations/features/questions/presentation/question_detail_screen.dart';
import 'package:couple_conversations/features/sessions/domain/prototype_store.dart';
import 'package:couple_conversations/features/sessions/presentation/status_chip.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({
    super.key,
    required this.category,
    required this.questions,
    required this.store,
  });

  final QuestionCategory category;
  final List<Question> questions;
  final PrototypeStore store;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(category.title)),
      body: ListenableBuilder(
        listenable: store,
        builder: (context, _) {
          if (questions.isEmpty) {
            return const Center(child: Text('No questions yet.'));
          }
          return ListView.separated(
            padding: const EdgeInsets.fromLTRB(20, 12, 20, 32),
            itemCount: questions.length,
            separatorBuilder: (context, index) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              final question = questions[index];
              final status = store.statusFor(question.id);
              return Material(
                color: Theme.of(context).colorScheme.surface,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                  side: BorderSide(
                    color: Theme.of(context).colorScheme.outlineVariant,
                  ),
                ),
                child: InkWell(
                  borderRadius: BorderRadius.circular(16),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute<void>(
                        builder: (context) => QuestionDetailScreen(
                          question: question,
                          store: store,
                        ),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            question.title,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ),
                        const SizedBox(width: 12),
                        StatusChip(status: status),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
