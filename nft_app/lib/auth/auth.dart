import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nft_app/auth/login_or_register.dart';
import 'package:nft_app/pages/home_page.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          //user loged in
          if (snapshot.hasData) {
            return const HomePage();
          }

          //user not regsitred
          else {
            return const LoginOrRegister();
          }
        },
      ),
    );
  }
}
