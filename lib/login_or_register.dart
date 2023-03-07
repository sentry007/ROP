import 'package:flutter/material.dart';
import 'package:rop_user_app/logInPage.dart';
import 'package:rop_user_app/signUpPage.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
  bool showLogin = true;

  void toggle() {
    setState(() {
      showLogin = !showLogin;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLogin) {
      return LogInScreen();
    } else {
      return SignUpScreen();
    }
  }
}
