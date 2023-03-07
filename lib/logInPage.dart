import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rop_user_app/forgotpassword.dart';
import 'package:rop_user_app/signuppage.dart';
import 'package:rop_user_app/InfoPage.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  TextEditingController login_e = TextEditingController();

  TextEditingController login_p = TextEditingController();

  Future<void> signUserIn() async {
    print("in Sing IN");
    showDialog(
      context: context,
      builder: (context) {
        return const Center(child: CircularProgressIndicator());
      },
    );

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: login_e.text.trim(), password: login_p.text);
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        wrongMessage("Wrong Email");
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        wrongMessage("Wrong Password");
      }
    }
  }

  void wrongMessage(String message) {
    showDialog(
        context: context,
        builder: (context) {
          // ignore: unnecessary_string_interpolations
          return AlertDialog(
              backgroundColor: Colors.blueGrey,
              title: Center(
                child: Text(message),
              ));
        });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              // top of tyhe page
              const Center(
                child: Text(
                  "Welcome To",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.w600,
                      color: Colors.blueAccent),
                ),
              ),
              const Center(
                child: Text(
                  "Aravind Eye hospital",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.w600,
                      color: Colors.blueAccent),
                ),
              ),
              const SizedBox(
                height: 96,
              ),
              Form(
                  child: Column(
                children: [
                  TextFormField(
                    controller: login_e,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.person_outline_outlined),
                        labelText: "email",
                        hintText: "enter your registerd email",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        )),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  TextFormField(
                    style: TextStyle(color: Colors.amber),
                    controller: login_p,
                    obscureText: true,
                    obscuringCharacter: '*',
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.lock_outline),
                      labelText: "Password",
                      hintText: "Password",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                    ),
                  ),
                ],
              )),
              SizedBox(
                height: 20,
              ),
              TextButton(
                  onPressed: () {
                    _navigateToNextScreen(context);
                  },
                  child: Text('forget password?')),
              SizedBox(
                height: 144,
              ),
              Container(
                child: ElevatedButton(
                    onPressed: () {
                      //_navigateToInfoScreen(context);
                      print(login_e.text.trim());
                      print(login_p.text);
                      signUserIn();
                    },
                    child: Text('Login')),
                width: double.infinity,
              ),
              SizedBox(
                height: 16,
              ),
              Text('or'),
              SizedBox(
                height: 8,
              ),
              Container(
                child: OutlinedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignUpScreen()),
                      );
                    },
                    child: Text('register')),
                width: double.infinity,
              )
            ],
          ),
        ),
      ),
    ));
  }
}

void _navigateToInfoScreen(BuildContext context) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => InfoScreen()));
}

void _navigateToNextScreen(BuildContext context) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => FPscreen()));
}
