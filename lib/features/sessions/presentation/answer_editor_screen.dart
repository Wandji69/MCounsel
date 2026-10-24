import 'package:couple_conversations/core/widgets/prototype_banner.dart';
import 'package:couple_conversations/features/questions/domain/question.dart';
import 'package:couple_conversations/features/sessions/domain/prototype_store.dart';
import 'package:couple_conversations/features/sessions/presentation/waiting_screen.dart';
import 'package:flutter/material.dart';

class AnswerEditorScreen extends StatefulWidget {
  const AnswerEditorScreen({
    super.key,
    required this.question,
    required this.store,
  });

  final Question question;
  final PrototypeStore store;

  @override
  State<AnswerEditorScreen> createState() => _AnswerEditorScreenState();
}

class _AnswerEditorScreenState extends State<AnswerEditorScreen> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _controller = TextEditingController(
    text: widget.store.textFor(widget.question.id),
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final locked = widget.store.isLocked(widget.question.id);
    return Scaffold(
      appBar: AppBar(title: const Text('Your private answer')),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 32),
          children: [
            const PrototypeBanner(),
            const SizedBox(height: 16),
            Text(
              widget.question.text,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _controller,
              readOnly: locked,
              minLines: 6,
              maxLines: 10,
              textCapitalization: TextCapitalization.sentences,
              decoration: const InputDecoration(
                labelText: 'Your private answer',
                alignLabelWithHint: true,
                border: OutlineInputBorder(),
                helperText:
                    'Only you can see this in the practice session. It is not sent to a partner.',
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Write an answer before submitting.';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            if (locked) ...[
              const Text(
                'Submitted answers stay locked in this practice session.',
              ),
              const SizedBox(height: 12),
              FilledButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute<void>(
                      builder: (context) => WaitingScreen(
                        question: widget.question,
                        store: widget.store,
                      ),
                    ),
                  );
                },
                child: const Text('View waiting status'),
              ),
            ] else ...[
              FilledButton(
                onPressed: _submit,
                child: const Text('Submit'),
              ),
              const SizedBox(height: 8),
              OutlinedButton(
                onPressed: _saveDraft,
                child: const Text('Save draft'),
              ),
            ],
          ],
        ),
      ),
    );
  }

  void _saveDraft() {
    if (_controller.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Write something before saving a draft.'),
        ),
      );
      return;
    }
    widget.store.saveDraft(widget.question.id, _controller.text);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'Draft saved for this practice session. It is not sent anywhere.',
        ),
      ),
    );
  }

  Future<void> _submit() async {
    if (_formKey.currentState?.validate() != true) {
      return;
    }
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Submit this answer?'),
          content: const Text(
            'This practice answer locks for this session and is not sent anywhere.',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text('Keep editing'),
            ),
            FilledButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: const Text('Submit answer'),
            ),
          ],
        );
      },
    );
    if (!mounted || confirmed != true) {
      return;
    }
    final saved = widget.store.submit(widget.question.id, _controller.text);
    if (!saved || !mounted) {
      return;
    }
    await Navigator.of(context).pushReplacement(
      MaterialPageRoute<void>(
        builder: (context) => WaitingScreen(
          question: widget.question,
          store: widget.store,
        ),
      ),
    );
  }
}
