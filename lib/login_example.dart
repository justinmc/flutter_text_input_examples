import 'package:flutter/material.dart';

// TODO(justinmc): Cupertino version with platform switcher.
// TODO(justinmc): Darkmode with switcher.

class LoginExample extends StatelessWidget {
  const LoginExample({
    Key? key,
  }) : super(key: key);

  static const String route = 'login';
  static const String title = 'Login Example';
  static const String subtitle = 'A basic login form with a faked API.';

  void _onSubmit() {
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
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Email',
                  ),
                ),
                TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(
                    hintText: 'Password',
                  ),
                ),
                const SizedBox(
                  height: 40.0,
                ),
                ElevatedButton(
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
