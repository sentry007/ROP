import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController signUp_email = TextEditingController();

  TextEditingController signUp_password = TextEditingController();

  TextEditingController signUp_name = TextEditingController();

  TextEditingController signUp_phone = TextEditingController();

  TextEditingController signUp_address = TextEditingController();

  Future<void> signUpUser() async {
    print("in Sing IN");
    showDialog(
      context: context,
      builder: (context) {
        return const Center(child: CircularProgressIndicator());
      },
    );

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: signUp_email.text.trim(), password: signUp_password.text);
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

  final _formKey = GlobalKey<FormState>();

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
                  "Sign Up",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.w600,
                      color: Colors.blue),
                ),
              ),

              const SizedBox(
                height: 88,
              ),
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: signUp_name,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.person_outline_outlined),
                          labelText: "Full Name",
                          hintText: "jon doe?",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      TextFormField(
                        controller: signUp_email,
                        decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.email_outlined),
                            labelText: "Email",
                            hintText: "enter your email",
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                            )),
                        keyboardType: TextInputType.emailAddress,
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      TextFormField(
                        controller: signUp_phone,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.phone_android_outlined),
                          labelText: "Phone No",
                          hintText: "your number",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8),
                            ),
                          ),
                        ),
                        keyboardType: TextInputType.phone,
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      TextFormField(
                        controller: signUp_address,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.house_outlined),
                          labelText: "Address",
                          hintText: "your address",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      TextFormField(
                        controller: signUp_password,
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
                height: 120,
              ),
              Container(
                child: ElevatedButton(
                    onPressed: () {
                      signUpUser();
                      Navigator.pop(context);
                    },
                    child: Text('SignUp')),
                width: double.infinity,
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
