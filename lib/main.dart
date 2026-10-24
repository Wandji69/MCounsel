import 'package:couple_conversations/app/app.dart';
import 'package:couple_conversations/features/questions/data/asset_question_repository.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(CoupleConversationsApp(repository: AssetQuestionRepository()));
}
