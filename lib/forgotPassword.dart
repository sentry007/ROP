import 'package:flutter/material.dart';
import 'package:rop_user_app/OTPpage.dart';
import 'package:rop_user_app/logInPage.dart';
import 'package:rop_user_app/InfoPage.dart';

class FPscreen extends StatelessWidget {
  FPscreen({super.key});
  var email_id;
  TextEditingController FP_email = TextEditingController();

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
                  "Forgot Password?",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.w600,
                      color: Colors.blue),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Center(
                child: Text(
                  "Enter the email account registered with the account",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
                ),
              ),
              const SizedBox(
                height: 144,
              ),
              Form(
                  child: Column(
                children: [
                  TextFormField(
                    controller: FP_email,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.person_outline_outlined),
                        labelText: "email",
                        hintText: "enter your registerd email",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        )),
                  ),
                ],
              )),
              const SizedBox(
                height: 8,
              ),

              Container(
                child: ElevatedButton(
                    onPressed: () {
                      _navigateToNextScreen(context);
                      email_id = FP_email.text;
                      print(email_id);
                    },
                    child: Text('Send OTP')),
                width: double.infinity,
              ),
            ],
          ),
        ),
      ),
    ));
  }
}

void _navigateToNextScreen(BuildContext context) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => const OTP_screen()));
}
