import 'package:couple_conversations/features/questions/domain/question.dart';

abstract class QuestionRepository {
  Future<QuestionCatalog> loadCatalog();
}
