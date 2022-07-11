import 'package:flutter/material.dart';

import 'fake_api.dart';

// TODO(justinmc): Cupertino version with platform switcher.
// TODO(justinmc): Darkmode with switcher.

class LoginExample extends StatelessWidget {
  LoginExample({
    Key? key,
  }) : super(key: key);

  static const String route = 'login';
  static const String title = 'Login Example';
  static const String subtitle = 'A basic login form with a faked API.';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(LoginExample.title),
      ),
      body: Center(
        child: SizedBox(
          width: 300.0,
          child: _LoginForm(),
        ),
      ),
    );
  }
}

class _LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<_LoginForm> {
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  final FocusNode _submitFocusNode = FocusNode();

  String _email = '';
  String _password = '';

  String? _error;
  bool _loading = false;

  void _onSubmit() async {
    // TODO(justinmc): Call a fake API and do full error/loading/success states.
    print('justin submitted');

    setState(() {
      _loading = true;
      _error = null;
    });

    try {
      final bool success = await FakeServerApi.authenticate(_email, _password);
      if (!success) {
        _error = 'Failed to log in.';
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Success!'),
              actions: <Widget>[
                TextButton(
                  style: TextButton.styleFrom(
                    textStyle: Theme.of(context).textTheme.labelLarge,
                  ),
                  child: const Text('Ok'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      }
    } catch(exception) {
      _error = exception.toString();
    }

    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: <Widget>[
          const SizedBox(
            height: 20.0,
          ),
          // TODO(justinmc): Does this work with autofill like this?
          TextFormField(
            focusNode: _emailFocusNode,
            restorationId: 'email_field',
            textInputAction: TextInputAction.next,
            autofillHints: const <String>[
              AutofillHints.email,
            ],
            decoration: const InputDecoration(
              filled: true,
              icon: const Icon(Icons.email),
              hintText: 'Enter your email address.',//localizations.demoTextFieldYourEmailAddress,
              labelText: 'Email',//localizations.demoTextFieldEmail,
            ),
            keyboardType: TextInputType.emailAddress,
            onSaved: (String? value) {
              _email = value ?? '';
              _passwordFocusNode.requestFocus();
            },
          ),
          // TODO(justinmc): Make this field nice like the above field.
          TextFormField(
            focusNode: _passwordFocusNode,
            restorationId: 'password_field',
            textInputAction: TextInputAction.next,
            autofillHints: const <String>[
              AutofillHints.password,
            ],
            obscureText: true,
            decoration: const InputDecoration(
              filled: true,
              icon: Icon(Icons.password),
              hintText: 'Enter your password.',//localizations.demoTextFieldYourEmailAddress,
              labelText: 'Password',//localizations.demoTextFieldEmail,
            ),
            keyboardType: TextInputType.visiblePassword,
            onSaved: (String? value) {
              _password = value ?? '';
              _passwordFocusNode.requestFocus();
            },
          ),
          const SizedBox(
            height: 40.0,
          ),
          if (_loading)
            const CircularProgressIndicator(),
          if (!_loading)
            ElevatedButton(
              focusNode: _submitFocusNode,
              onPressed: _onSubmit,
              child: const Text('Submit'),
            ),
          if (_error != null)
            Text('Error: $_error'),
        ],
      ),
    );
  }
}
