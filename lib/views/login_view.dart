import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:todo_bloc_app/firebase_options.dart';
import 'package:todo_bloc_app/views/register_view.dart';

class LoginView extends StatefulWidget {
  final String title;
  const LoginView({required this.title, super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late final TextEditingController _email;
  late final TextEditingController _password;

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Column(
        children: [
          TextField(
            controller: _email,
          ),
          TextField(
            controller: _password,
          ),
          TextButton(
              onPressed: () async {
                try {
                  final email = _email.text;
                  final password = _password.text;
                  final userCredentials = await FirebaseAuth.instance
                      .signInWithEmailAndPassword(
                          email: email, password: password);
                  print(userCredentials);
                } on FirebaseAuthException catch (e) {
                  if (e.code == 'wrong-password') {
                    print('wrong password');
                  }
                  print('hau${e.message}');
                }
              },
              child: const Text("Log in")),
          TextButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, '/register/', (route) => false);
              },
              child: const Text("Not registered yet? Register here"))
        ],
      ),
    );
  }
}
