import 'package:flutter/material.dart';

// TODO(justinmc): Cupertino version with platform switcher.
// TODO(justinmc): Darkmode with switcher.

class LoginExample extends StatelessWidget {
  LoginExample({
    Key? key,
  }) : super(key: key);

  static const String route = 'login';
  static const String title = 'Login Example';
  static const String subtitle = 'A basic login form with a faked API.';

  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  final FocusNode _submitFocusNode = FocusNode();

  String _email = '';

  void _onSubmit() {
    // TODO(justinmc): Call a fake API and do full error/loading/success states.
    print('justin submitted');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(LoginExample.title),
      ),
      body: Center(
        child: SizedBox(
          width: 200.0,
          child: Form(
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
                  //focusNode: _email,
                  decoration: InputDecoration(
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
                  obscureText: true,
                  decoration: const InputDecoration(
                    hintText: 'Password',
                  ),
                ),
                const SizedBox(
                  height: 40.0,
                ),
                ElevatedButton(
                  focusNode: _submitFocusNode,
                  onPressed: _onSubmit,
                  child: const Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
