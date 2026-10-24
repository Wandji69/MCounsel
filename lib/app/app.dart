import 'package:couple_conversations/app/theme/app_theme.dart';
import 'package:couple_conversations/features/home/presentation/home_screen.dart';
import 'package:couple_conversations/features/questions/data/question_repository.dart';
import 'package:couple_conversations/features/sessions/domain/prototype_store.dart';
import 'package:flutter/material.dart';

class CoupleConversationsApp extends StatefulWidget {
  const CoupleConversationsApp({
    super.key,
    required this.repository,
    this.store,
  });

  final QuestionRepository repository;

  /// When omitted, the app owns an in-memory store and disposes it.
  final PrototypeStore? store;

  @override
  State<CoupleConversationsApp> createState() => _CoupleConversationsAppState();
}

class _CoupleConversationsAppState extends State<CoupleConversationsApp> {
  late final PrototypeStore _store = widget.store ?? PrototypeStore();
  late final bool _ownsStore = widget.store == null;

  @override
  void dispose() {
    if (_ownsStore) {
      _store.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Couple Conversations',
      theme: buildAppTheme(),
      home: HomeScreen(repository: widget.repository, store: _store),
    );
  }
}
