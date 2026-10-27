import 'package:couple_conversations/features/auth/data/auth_repository.dart';
import 'package:couple_conversations/features/auth/domain/account_session.dart';
import 'package:couple_conversations/features/auth/presentation/sign_up_screen.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({
    super.key,
    required this.auth,
    required this.onSignedIn,
    this.onPracticeWithoutAccount,
  });

  final AuthRepository auth;
  final void Function(BuildContext context, AccountSession session) onSignedIn;
  final void Function(BuildContext context)? onPracticeWithoutAccount;

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  final _email = TextEditingController();
  final _password = TextEditingController();
  var _submitting = false;
  String? _error;

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign in')),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 32),
          children: [
            Text(
              'Create an account to keep your profile. Practice answers still stay on this phone until you close the app.',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _email,
              keyboardType: TextInputType.emailAddress,
              autofillHints: const [AutofillHints.email],
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
              validator: _validateEmail,
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _password,
              obscureText: true,
              autofillHints: const [AutofillHints.password],
              decoration: const InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
              validator: _validatePassword,
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
              child: Text(_submitting ? 'Signing in' : 'Sign in'),
            ),
            const SizedBox(height: 8),
            TextButton(
              onPressed: _submitting
                  ? null
                  : () {
                      Navigator.of(context).push(
                        MaterialPageRoute<void>(
                          builder: (context) => SignUpScreen(
                            auth: widget.auth,
                            onSignedIn: widget.onSignedIn,
                          ),
                        ),
                      );
                    },
              child: const Text('Create an account'),
            ),
            if (widget.onPracticeWithoutAccount != null)
              TextButton(
                onPressed: _submitting
                    ? null
                    : () => widget.onPracticeWithoutAccount!(context),
                child: const Text('Practice without an account'),
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
      final session = await widget.auth.signIn(
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
      setState(() => _error = 'Sign-in could not reach the server.');
    } finally {
      if (mounted) {
        setState(() => _submitting = false);
      }
    }
  }
}

String? _validateEmail(String? value) {
  final email = value?.trim() ?? '';
  if (email.isEmpty || !email.contains('@')) {
    return 'Enter the email for your account.';
  }
  return null;
}

String? _validatePassword(String? value) {
  if (value == null || value.length < 8) {
    return 'Use at least 8 characters.';
  }
  return null;
}
