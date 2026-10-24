import 'package:couple_conversations/features/questions/data/question_repository.dart';
import 'package:couple_conversations/features/questions/domain/question.dart';
import 'package:flutter/services.dart';

class AssetQuestionRepository implements QuestionRepository {
  AssetQuestionRepository({AssetBundle? bundle}) : _bundle = bundle ?? rootBundle;

  static const assetPath = 'assets/content/engaged_questions_v1.json';

  final AssetBundle _bundle;

  @override
  Future<QuestionCatalog> loadCatalog() async {
    final raw = await _bundle.loadString(assetPath);
    return QuestionCatalog.parse(raw);
  }
}
