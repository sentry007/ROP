import 'package:flutter/material.dart';
import 'package:rop_user_app/logInPage.dart';

class OTP_screen extends StatelessWidget {
  const OTP_screen({super.key});

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
                  "OTP",
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
                  "Enter the OTP sent to your registered email",
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
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.person_outline_outlined),
                        labelText: "OTP",
                        hintText: "enter OTP",
                        border: UnderlineInputBorder()),
                    keyboardType: TextInputType.number,
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
                    },
                    child: Text('Verify')),
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
      .push(MaterialPageRoute(builder: (context) => LogInScreen()));
}
