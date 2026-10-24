import 'package:flutter/foundation.dart';

enum ResponseStatus { notStarted, draft, submitted, skipped, notReady }

extension ResponseStatusLabel on ResponseStatus {
  String get label {
    return switch (this) {
      ResponseStatus.notStarted => 'Not started',
      ResponseStatus.draft => 'Draft',
      ResponseStatus.submitted => 'Submitted',
      ResponseStatus.skipped => 'Skipped',
      ResponseStatus.notReady => 'Not ready',
    };
  }
}

/// In-memory practice answers for the running app.
///
/// The store has no partner-answer field. A partner can be represented only
/// by [partnerStatusLabel]. Closing the process drops every entry.
class PrototypeStore extends ChangeNotifier {
  final Map<String, _Response> _responses = {};

  static const partnerStatusLabel = 'Not yet submitted';

  ResponseStatus statusFor(String questionId) {
    return _responses[questionId]?.status ?? ResponseStatus.notStarted;
  }

  String textFor(String questionId) {
    return _responses[questionId]?.text ?? '';
  }

  bool isLocked(String questionId) {
    return statusFor(questionId) == ResponseStatus.submitted;
  }

  void saveDraft(String questionId, String text) {
    if (isLocked(questionId) || text.trim().isEmpty) {
      return;
    }
    _responses[questionId] = _Response(
      text: text,
      status: ResponseStatus.draft,
    );
    notifyListeners();
  }

  /// Locks a non-empty answer. Returns false when the text is empty or the
  /// answer is already locked.
  bool submit(String questionId, String text) {
    if (isLocked(questionId)) {
      return false;
    }
    final trimmed = text.trim();
    if (trimmed.isEmpty) {
      return false;
    }
    _responses[questionId] = _Response(
      text: trimmed,
      status: ResponseStatus.submitted,
    );
    notifyListeners();
    return true;
  }

  void skip(String questionId) {
    _setUnlockedStatus(questionId, ResponseStatus.skipped);
  }

  void markNotReady(String questionId) {
    _setUnlockedStatus(questionId, ResponseStatus.notReady);
  }

  void _setUnlockedStatus(String questionId, ResponseStatus status) {
    if (isLocked(questionId)) {
      return;
    }
    _responses[questionId] = _Response(
      text: textFor(questionId),
      status: status,
    );
    notifyListeners();
  }
}

class _Response {
  const _Response({required this.text, required this.status});

  final String text;
  final ResponseStatus status;
}
