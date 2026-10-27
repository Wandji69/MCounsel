import 'package:couple_conversations/features/questions/domain/question.dart';
import 'package:couple_conversations/features/questions/presentation/category_screen.dart';
import 'package:couple_conversations/features/sessions/domain/prototype_store.dart';
import 'package:couple_conversations/features/sessions/presentation/answer_editor_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  const question = Question(
    id: 'values-ordinary-week',
    version: 1,
    categoryId: 'values-life-goals',
    title: 'An ordinary week',
    text: 'When you imagine an ordinary week, what do you hope it feels like?',
    stage: 'engaged',
    sensitivity: Sensitivity.standard,
    guidance: 'This asks for a preference.',
    followUpPrompts: ['Which part matters most?'],
    reviewStatus: 'draft',
    language: 'en',
  );
  const category = QuestionCategory(
    id: 'values-life-goals',
    title: 'Values and life goals',
    description: 'What a shared life needs to make room for.',
  );

  Future<void> pumpCategory(WidgetTester tester, PrototypeStore store) {
    tester.view.physicalSize = const Size(800, 1400);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    return tester.pumpWidget(
      MaterialApp(
        home: CategoryScreen(
          category: category,
          questions: const [question],
          store: store,
        ),
      ),
    );
  }

  testWidgets('empty submit stays on the editor', (tester) async {
    await pumpCategory(tester, PrototypeStore());
    await tester.tap(find.text('An ordinary week'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Answer privately'));
    await tester.pumpAndSettle();

    await tester.enterText(find.byType(TextFormField), '   ');
    await tester.tap(find.widgetWithText(FilledButton, 'Submit'));
    await tester.pumpAndSettle();

    expect(find.text('Write an answer before submitting.'), findsOneWidget);
    expect(find.text('Submit this answer?'), findsNothing);
    expect(find.text('Your private answer'), findsWidgets);
  });

  testWidgets('skip and not ready update the status chip', (tester) async {
    final store = PrototypeStore();
    await pumpCategory(tester, store);

    await tester.tap(find.text('An ordinary week'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Skip'));
    await tester.pumpAndSettle();

    expect(find.text('Skipped'), findsOneWidget);
    expect(store.statusFor(question.id), ResponseStatus.skipped);

    await tester.tap(find.text('An ordinary week'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Not ready to discuss'));
    await tester.pumpAndSettle();

    expect(find.text('Not ready'), findsOneWidget);
    expect(store.statusFor(question.id), ResponseStatus.notReady);
  });

  testWidgets('submit shows partner status without a partner answer', (
    tester,
  ) async {
    final store = PrototypeStore();
    await pumpCategory(tester, store);
    await tester.tap(find.text('An ordinary week'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Answer privately'));
    await tester.pumpAndSettle();

    await tester.enterText(
      find.byType(TextFormField),
      'Quiet evenings at home.',
    );
    await tester.tap(find.widgetWithText(FilledButton, 'Submit'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Submit answer'));
    await tester.pumpAndSettle();

    expect(find.text('Not yet submitted'), findsOneWidget);
    expect(find.textContaining('stays hidden'), findsOneWidget);
    expect(find.text('Quiet evenings at home.'), findsOneWidget);
    expect(store.textFor(question.id), 'Quiet evenings at home.');
    expect(store.isLocked(question.id), isTrue);

    final visibleText = tester
        .widgetList<Text>(find.byType(Text))
        .map((widget) => widget.data ?? widget.textSpan?.toPlainText() ?? '')
        .join('\n');
    expect(visibleText.contains('partner answer:'), isFalse);
    expect(visibleText.split('Quiet evenings at home.').length, 2);
  });

  testWidgets('a submitted answer stays locked', (tester) async {
    final store = PrototypeStore();
    store.submit(question.id, 'Quiet evenings at home.');
    tester.view.physicalSize = const Size(800, 1400);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(
      MaterialApp(
        home: AnswerEditorScreen(question: question, store: store),
      ),
    );

    expect(
      find.text('Submitted answers stay locked in this practice session.'),
      findsOneWidget,
    );
    expect(tester.widget<TextField>(find.byType(TextField)).readOnly, isTrue);
    expect(find.widgetWithText(FilledButton, 'Submit'), findsNothing);

    await tester.enterText(find.byType(TextField), 'A rewritten answer.');
    expect(store.textFor(question.id), 'Quiet evenings at home.');
  });
}
