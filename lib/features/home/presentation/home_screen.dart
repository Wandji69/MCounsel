import 'package:couple_conversations/core/widgets/prototype_banner.dart';
import 'package:couple_conversations/features/questions/data/question_repository.dart';
import 'package:couple_conversations/features/questions/domain/question.dart';
import 'package:couple_conversations/features/questions/presentation/category_screen.dart';
import 'package:couple_conversations/features/sessions/domain/prototype_store.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
    required this.repository,
    required this.store,
  });

  final QuestionRepository repository;
  final PrototypeStore store;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<QuestionCatalog> _catalog = widget.repository.loadCatalog();

  void _retry() {
    setState(() {
      _catalog = widget.repository.loadCatalog();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Couple Conversations')),
      body: FutureBuilder<QuestionCatalog>(
        future: _catalog,
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const _LoadingQuestions();
          }
          if (snapshot.hasError) {
            return _CatalogMessage(
              message: 'The questions could not be loaded.',
              actionLabel: 'Try again',
              onAction: _retry,
            );
          }
          final catalog = snapshot.requireData;
          if (catalog.isEmpty) {
            return const _CatalogMessage(message: 'No questions yet.');
          }
          return _HomeCatalog(catalog: catalog, store: widget.store);
        },
      ),
    );
  }
}

class _HomeCatalog extends StatelessWidget {
  const _HomeCatalog({required this.catalog, required this.store});

  final QuestionCatalog catalog;
  final PrototypeStore store;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 32),
      children: [
        const PrototypeBanner(),
        const SizedBox(height: 20),
        Text('Practice a conversation', style: textTheme.headlineSmall),
        const SizedBox(height: 8),
        Text(
          'Couple Conversations helps engaged couples practice questions they might otherwise postpone. It is not a therapist, a compatibility test, or a crisis service.',
          style: textTheme.bodyLarge,
        ),
        const SizedBox(height: 20),
        Text('How sharing works', style: textTheme.titleMedium),
        const SizedBox(height: 8),
        const Text(
          'You answer privately. A partner would see whether you submitted, not the words. Both answers would be shown only after both people submit and the reveal rule is checked. This practice build keeps the answer in memory and does not send it.',
          style: TextStyle(height: 1.4),
        ),
        const SizedBox(height: 24),
        Text('Categories', style: textTheme.titleMedium),
        const SizedBox(height: 12),
        for (final category in catalog.categories) ...[
          _CategoryCard(
            category: category,
            questionCount: catalog.questionsFor(category.id).length,
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute<void>(
                  builder: (context) => CategoryScreen(
                    category: category,
                    questions: catalog.questionsFor(category.id),
                    store: store,
                  ),
                ),
              );
            },
          ),
          const SizedBox(height: 12),
        ],
      ],
    );
  }
}

class _CategoryCard extends StatelessWidget {
  const _CategoryCard({
    required this.category,
    required this.questionCount,
    required this.onTap,
  });

  final QuestionCategory category;
  final int questionCount;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final countLabel = questionCount == 1 ? '1 question' : '$questionCount questions';
    return Material(
      color: scheme.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: scheme.outlineVariant),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(category.title, style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 4),
              Text(category.description),
              const SizedBox(height: 8),
              Text(countLabel, style: Theme.of(context).textTheme.labelLarge),
            ],
          ),
        ),
      ),
    );
  }
}

class _LoadingQuestions extends StatelessWidget {
  const _LoadingQuestions();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircularProgressIndicator(),
          SizedBox(height: 16),
          Text('Loading questions'),
        ],
      ),
    );
  }
}

class _CatalogMessage extends StatelessWidget {
  const _CatalogMessage({
    required this.message,
    this.actionLabel,
    this.onAction,
  });

  final String message;
  final String? actionLabel;
  final VoidCallback? onAction;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(message, textAlign: TextAlign.center),
            if (actionLabel != null && onAction != null) ...[
              const SizedBox(height: 16),
              FilledButton(onPressed: onAction, child: Text(actionLabel!)),
            ],
          ],
        ),
      ),
    );
  }
}
