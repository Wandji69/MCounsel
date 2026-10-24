import 'dart:convert';

enum Sensitivity { standard, high }

class QuestionCategory {
  const QuestionCategory({
    required this.id,
    required this.title,
    required this.description,
  });

  final String id;
  final String title;
  final String description;
}

class Question {
  const Question({
    required this.id,
    required this.version,
    required this.categoryId,
    required this.title,
    required this.text,
    required this.stage,
    required this.sensitivity,
    required this.guidance,
    required this.followUpPrompts,
    required this.reviewStatus,
    required this.language,
  });

  final String id;
  final int version;
  final String categoryId;
  final String title;
  final String text;
  final String stage;
  final Sensitivity sensitivity;
  final String guidance;
  final List<String> followUpPrompts;
  final String reviewStatus;
  final String language;

  bool get isHighSensitivity => sensitivity == Sensitivity.high;
}

class QuestionCatalog {
  const QuestionCatalog({required this.categories, required this.questions});

  final List<QuestionCategory> categories;
  final List<Question> questions;

  bool get isEmpty => categories.isEmpty;

  List<Question> questionsFor(String categoryId) {
    return questions
        .where((question) => question.categoryId == categoryId)
        .toList();
  }

  static QuestionCatalog parse(String raw) {
    final decoded = jsonDecode(raw);
    if (decoded is! Map) {
      throw const FormatException('Question catalog must be a JSON object.');
    }
    final map = Map<String, Object?>.from(decoded);
    final categoryItems = _requireList(map, 'categories');
    final questionItems = _requireList(map, 'questions');
    final categories = categoryItems.map(_readCategory).toList();
    final categoryIds = categories.map((category) => category.id).toSet();
    final questions = questionItems
        .map((item) => _readQuestion(item, categoryIds))
        .toList();
    return QuestionCatalog(categories: categories, questions: questions);
  }
}

QuestionCategory _readCategory(Object? item) {
  final map = _requireMap(item, 'category');
  return QuestionCategory(
    id: _requireString(map, 'id'),
    title: _requireString(map, 'title'),
    description: _requireString(map, 'description'),
  );
}

Question _readQuestion(Object? item, Set<String> categoryIds) {
  final map = _requireMap(item, 'question');
  final id = _requireString(map, 'id');
  final categoryId = _requireString(map, 'categoryId');
  if (!categoryIds.contains(categoryId)) {
    throw FormatException('Question $id uses unknown category $categoryId.');
  }
  return Question(
    id: id,
    version: _requireInt(map, 'version', id),
    categoryId: categoryId,
    title: _requireString(map, 'title'),
    text: _requireString(map, 'text'),
    stage: _requireString(map, 'stage'),
    sensitivity: _readSensitivity(_requireString(map, 'sensitivity'), id),
    guidance: _requireString(map, 'guidance'),
    followUpPrompts: _requireStringList(map, 'followUpPrompts', id),
    reviewStatus: _requireString(map, 'reviewStatus'),
    language: _requireString(map, 'language'),
  );
}

Sensitivity _readSensitivity(String value, String questionId) {
  return switch (value) {
    'standard' => Sensitivity.standard,
    'high' => Sensitivity.high,
    _ => throw FormatException(
      'Unknown sensitivity "$value" on question $questionId.',
    ),
  };
}

List<Object?> _requireList(Map<String, Object?> map, String key) {
  final value = map[key];
  if (value is! List) {
    throw FormatException('Catalog field $key must be a list.');
  }
  return value;
}

Map<String, Object?> _requireMap(Object? item, String label) {
  if (item is! Map) {
    throw FormatException('Each $label must be a JSON object.');
  }
  return Map<String, Object?>.from(item);
}

String _requireString(Map<String, Object?> map, String key) {
  final value = map[key];
  if (value is! String || value.trim().isEmpty) {
    throw FormatException('Field $key must be a non-empty string.');
  }
  return value;
}

int _requireInt(Map<String, Object?> map, String key, String questionId) {
  final value = map[key];
  if (value is! int) {
    throw FormatException('Question $questionId field $key must be an integer.');
  }
  return value;
}

List<String> _requireStringList(
  Map<String, Object?> map,
  String key,
  String questionId,
) {
  final value = map[key];
  if (value is! List || value.any((item) => item is! String)) {
    throw FormatException(
      'Question $questionId field $key must be a list of strings.',
    );
  }
  return value.cast<String>();
}
