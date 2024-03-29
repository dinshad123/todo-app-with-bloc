import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class VerifyEmailView extends StatefulWidget {
  const VerifyEmailView({super.key});

  @override
  State<VerifyEmailView> createState() => _VerifyEmailViewState();
}

class _VerifyEmailViewState extends State<VerifyEmailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Text('Please verify your email'),
          TextButton(
              onPressed: () async {
                User? user = FirebaseAuth.instance.currentUser;

                if (user != null && user.emailVerified == false) {
                  await user.sendEmailVerification();
                }
              },
              child: const Text('Send email verification'))
        ],
      ),
    );
    ;
  }
}
