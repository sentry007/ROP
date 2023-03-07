import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rop_user_app/InfoPage.dart';
import 'package:rop_user_app/logInPage.dart';
import 'package:rop_user_app/userInfo.dart';

// ignore: camel_case_types
class authPage extends StatelessWidget {
  const authPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return InfoScreen();
          } else {
            return LogInScreen();
          }
        },
      ),
    );
  }
}
