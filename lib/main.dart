import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:todo_bloc_app/firebase_options.dart';
import 'package:todo_bloc_app/views/login_view.dart';
import 'package:todo_bloc_app/views/register_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromARGB(255, 26, 24, 28)),
          useMaterial3: true,
        ),
        routes: {
          '/login/': (context) => const LoginView(title: 'Login'),
          '/register/': (context) => const RegisterView(),
        },
        home: HomePage()),
  );
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform,
        ),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return const Text("waiting");
            case ConnectionState.done:
              // print('hai Dinshad');
              // final user = FirebaseAuth.instance.currentUser;

              // if (user!.emailVerified ?? false) {
              //   return Text('Done');
              // } else {
              //   return VerifyEmailView();
              //   // return const VerifyEmailView();
              // }
              return const LoginView(title: 'Login');
            default:
              return const Text("loading");
          }
        });
  }
}
