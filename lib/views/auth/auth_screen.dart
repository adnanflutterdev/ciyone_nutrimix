import 'package:ciyone_nutrimix/views/home/home_screen.dart';
import 'package:ciyone_nutrimix/views/welcome_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.data == null || !snapshot.hasData) {
          // print('User need to login...');
          return const WelcomeScreen();
        } else {
          return const HomeScreen();
        }
      },
    );
  }
}
