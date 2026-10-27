import 'package:couple_conversations/app/app.dart';
import 'package:couple_conversations/core/networking/api_config.dart';
import 'package:couple_conversations/features/auth/data/auth_repository.dart';
import 'package:couple_conversations/features/auth/data/supabase_auth_repository.dart';
import 'package:couple_conversations/features/questions/data/asset_question_repository.dart';
import 'package:flutter/material.dart';

void main() {
  final config = ApiConfig.fromEnvironment();
  runApp(
    CoupleConversationsApp(
      repository: AssetQuestionRepository(),
      authRepository: config.isConfigured
          ? SupabaseAuthRepository(config: config)
          : const UnconfiguredAuthRepository(),
      allowPracticeWithoutAccount: !config.isConfigured,
    ),
  );
}
