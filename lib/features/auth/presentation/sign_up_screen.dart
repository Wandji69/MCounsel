import 'package:couple_conversations/features/auth/data/auth_repository.dart';
import 'package:couple_conversations/features/auth/domain/account_session.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({
    super.key,
    required this.auth,
    required this.onSignedIn,
  });

  final AuthRepository auth;
  final void Function(BuildContext context, AccountSession session) onSignedIn;

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final _name = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();
  var _submitting = false;
  String? _error;

  @override
  void dispose() {
    _name.dispose();
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create account')),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 32),
          children: [
            const Text(
              'Your display name is what your partner can see. It is not a score, and it does not share your answers.',
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _name,
              textCapitalization: TextCapitalization.words,
              decoration: const InputDecoration(
                labelText: 'Display name',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Enter a display name.';
                }
                return null;
              },
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _email,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                final email = value?.trim() ?? '';
                if (email.isEmpty || !email.contains('@')) {
                  return 'Enter an email address.';
                }
                return null;
              },
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _password,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.length < 8) {
                  return 'Use at least 8 characters.';
                }
                return null;
              },
            ),
            if (_error != null) ...[
              const SizedBox(height: 12),
              Text(
                _error!,
                style: TextStyle(color: Theme.of(context).colorScheme.error),
              ),
            ],
            const SizedBox(height: 20),
            FilledButton(
              onPressed: _submitting ? null : _submit,
              child: Text(_submitting ? 'Creating account' : 'Create account'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _submit() async {
    if (_formKey.currentState?.validate() != true) {
      return;
    }
    setState(() {
      _submitting = true;
      _error = null;
    });
    try {
      final session = await widget.auth.signUp(
        displayName: _name.text,
        email: _email.text,
        password: _password.text,
      );
      if (!mounted) {
        return;
      }
      widget.onSignedIn(context, session);
    } on AuthException catch (error) {
      if (!mounted) {
        return;
      }
      setState(() => _error = error.message);
    } catch (_) {
      if (!mounted) {
        return;
      }
      setState(() => _error = 'Account creation could not reach the server.');
    } finally {
      if (mounted) {
        setState(() => _submitting = false);
      }
    }
  }
}
