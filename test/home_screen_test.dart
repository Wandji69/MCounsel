import 'dart:async';

import 'package:couple_conversations/features/home/presentation/home_screen.dart';
import 'package:couple_conversations/features/questions/data/question_repository.dart';
import 'package:couple_conversations/features/questions/domain/question.dart';
import 'package:couple_conversations/features/sessions/domain/prototype_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('home shows categories from the repository', (tester) async {
    await tester.pumpWidget(_home(repository: _FakeRepository(_sampleCatalog())));
    await tester.pump();

    expect(find.text('Values and life goals'), findsOneWidget);
    expect(find.text('Money, debt, saving, and spending'), findsOneWidget);
    expect(
      find.text(
        'Practice prototype. Do not enter real relationship information. Nothing is saved after you close the app.',
      ),
      findsOneWidget,
    );
    expect(find.text('2 questions'), findsNWidgets(2));
  });

  testWidgets('home shows a loading state', (tester) async {
    final completer = Completer<QuestionCatalog>();
    await tester.pumpWidget(
      _home(repository: _PendingRepository(completer.future)),
    );

    expect(find.text('Loading questions'), findsOneWidget);

    completer.complete(_sampleCatalog());
    await tester.pump();

    expect(find.text('Values and life goals'), findsOneWidget);
  });

  testWidgets('home shows an empty catalog', (tester) async {
    await tester.pumpWidget(
      _home(
        repository: _FakeRepository(
          const QuestionCatalog(categories: [], questions: []),
        ),
      ),
    );
    await tester.pump();

    expect(find.text('No questions yet.'), findsOneWidget);
  });

  testWidgets('home shows an error and retries', (tester) async {
    final repository = _FakeRepository(
      _sampleCatalog(),
      errorOnFirstCall: Exception('offline'),
    );
    await tester.pumpWidget(_home(repository: repository));
    await tester.pump();

    expect(find.text('The questions could not be loaded.'), findsOneWidget);

    await tester.tap(find.text('Try again'));
    await tester.pump();

    expect(find.text('Values and life goals'), findsOneWidget);
    expect(repository.calls, 2);
  });
}

Widget _home({required QuestionRepository repository}) {
  return MaterialApp(
    home: HomeScreen(repository: repository, store: PrototypeStore()),
  );
}

QuestionCatalog _sampleCatalog() {
  return const QuestionCatalog(
    categories: [
      QuestionCategory(
        id: 'values',
        title: 'Values and life goals',
        description: 'A shared picture of daily life.',
      ),
      QuestionCategory(
        id: 'money',
        title: 'Money, debt, saving, and spending',
        description: 'What to know and what to decide together.',
      ),
    ],
    questions: [
      Question(
        id: 'q1',
        version: 1,
        categoryId: 'values',
        title: 'An ordinary week',
        text: 'What do you hope an ordinary week feels like?',
        stage: 'engaged',
        sensitivity: Sensitivity.standard,
        guidance: 'A preference.',
        followUpPrompts: ['Which part matters most?'],
        reviewStatus: 'draft',
        language: 'en',
      ),
      Question(
        id: 'q2',
        version: 1,
        categoryId: 'values',
        title: 'A hard season',
        text: 'What would you want from each other?',
        stage: 'engaged',
        sensitivity: Sensitivity.standard,
        guidance: 'Support.',
        followUpPrompts: [],
        reviewStatus: 'draft',
        language: 'en',
      ),
      Question(
        id: 'q3',
        version: 1,
        categoryId: 'money',
        title: 'What we each know',
        text: 'How much do you want to know?',
        stage: 'engaged',
        sensitivity: Sensitivity.standard,
        guidance: 'A boundary.',
        followUpPrompts: [],
        reviewStatus: 'draft',
        language: 'en',
      ),
      Question(
        id: 'q4',
        version: 1,
        categoryId: 'money',
        title: 'A spending disagreement',
        text: 'How would you like to decide?',
        stage: 'engaged',
        sensitivity: Sensitivity.standard,
        guidance: 'A way of deciding.',
        followUpPrompts: [],
        reviewStatus: 'draft',
        language: 'en',
      ),
    ],
  );
}

class _PendingRepository implements QuestionRepository {
  _PendingRepository(this.future);

  final Future<QuestionCatalog> future;

  @override
  Future<QuestionCatalog> loadCatalog() => future;
}

class _FakeRepository implements QuestionRepository {
  _FakeRepository(this.catalog, {this.errorOnFirstCall});

  final QuestionCatalog catalog;
  final Object? errorOnFirstCall;
  var calls = 0;

  @override
  Future<QuestionCatalog> loadCatalog() async {
    calls += 1;
    if (calls == 1 && errorOnFirstCall != null) {
      throw errorOnFirstCall!;
    }
    return catalog;
  }
}
