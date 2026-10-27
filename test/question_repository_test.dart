import 'dart:convert';
import 'dart:io';

import 'package:couple_conversations/features/questions/data/asset_question_repository.dart';
import 'package:couple_conversations/features/questions/domain/question.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('catalog parses engaged draft questions and no partner answers', () {
    final raw = File(
      'assets/content/engaged_questions_v1.json',
    ).readAsStringSync();
    final catalog = QuestionCatalog.parse(raw);

    expect(catalog.questions, hasLength(10));
    expect(catalog.categories, hasLength(6));
    expect(
      catalog.questions.every(
        (question) =>
            question.stage == 'engaged' &&
            question.version == 1 &&
            question.language == 'en' &&
            question.reviewStatus == 'draft',
      ),
      isTrue,
    );

    final highSensitivity = catalog.questions.where(
      (question) => question.sensitivity == Sensitivity.high,
    );
    expect(highSensitivity, isNotEmpty);
    expect(
      highSensitivity.every(
        (question) => question.guidance.toLowerCase().contains('skip'),
      ),
      isTrue,
    );

    final lowered = raw.toLowerCase();
    expect(lowered.contains('partneranswer'), isFalse);
    expect(lowered.contains('partner_answer'), isFalse);
    for (final question in catalog.questions) {
      expect(catalog.questionsFor(question.categoryId), isNotEmpty);
    }
  });

  test('parser rejects a question for an unknown category', () {
    const raw = '''
    {
      "categories": [
        {"id": "values", "title": "Values", "description": "Goals"}
      ],
      "questions": [
        {
          "id": "q1",
          "version": 1,
          "categoryId": "missing",
          "title": "Title",
          "text": "Question text",
          "stage": "engaged",
          "sensitivity": "standard",
          "guidance": "Guidance",
          "followUpPrompts": [],
          "reviewStatus": "draft",
          "language": "en"
        }
      ]
    }
    ''';

    expect(() => QuestionCatalog.parse(raw), throwsFormatException);
  });

  test('asset repository loads the catalog JSON', () async {
    final repository = AssetQuestionRepository(
      bundle: _MemoryBundle(
        File('assets/content/engaged_questions_v1.json').readAsStringSync(),
      ),
    );

    final catalog = await repository.loadCatalog();

    expect(catalog.categories.map((category) => category.title), [
      'Values and life goals',
      'Money, debt, saving, and spending',
      'Children and family expectations',
      'Extended family and boundaries',
      'Faith, culture, and traditions',
      'Household responsibilities',
    ]);
  });
}

class _MemoryBundle extends CachingAssetBundle {
  _MemoryBundle(this.raw);

  final String raw;

  @override
  Future<ByteData> load(String key) async {
    expect(key, AssetQuestionRepository.assetPath);
    return ByteData.sublistView(Uint8List.fromList(utf8.encode(raw)));
  }
}
