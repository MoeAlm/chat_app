import 'package:chat_app/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../core/components/textfield.dart';
import '../core/constants/colors.dart';

class SignUp extends StatelessWidget {
  SignUp({Key? key}) : super(key: key);

  String? email;
  String? password;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Chatting'),
      ),
      body: Stack(
        children: [
          Opacity(
            opacity: 0.3,
            child: Align(
              alignment: Alignment.center,
              child: Image.asset(
                'assets/images/sign_up.png',
                width: width,
                height: height * 0.5,
              ),
            ),
          ).pOnly(top: height * 0.1),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Sign Up',
                style: TextStyle(
                    fontSize: width * 0.09, fontWeight: FontWeight.bold),
              ),
              Text(
                'And talk with your friends from anywhere!',
                style: TextStyle(fontSize: width * 0.04, color: Colors.black54),
              ).pOnly(bottom: height * 0.08),
              defaultTextField(
                label: 'Username',
                inputType: TextInputType.emailAddress,
                hint: 'Enter your username',
                onChanged: (text) {
                  email = text;
                },
              ),
              defaultTextField(
                label: 'Password',
                inputType: TextInputType.visiblePassword,
                hint: 'Enter your password',
                onChanged: (text) {
                  password = text;
                },
              ).py8(),
              SizedBox(
                height: height * 0.04,
              ),
              Align(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    SizedBox(
                      width: width * 0.5,
                      child: ElevatedButton(
                        onPressed: () async {
                          //اوبجكت لـ FirebaseAuth
                          try {
                            await registerUser();
                          } on FirebaseAuthException catch (e) {
                            if (e.code == "email-already-in-use") {
                              showSnackBar(context, text: 'Email is Already exit');
                            } else if (e.code == "weak password") {
                              showSnackBar(context, text: 'Weak password');
                            }
                          }
                        },
                        style: OutlinedButton.styleFrom(
                            backgroundColor: kPrimaryColor,
                            foregroundColor: Colors.black87),
                        child: Text(
                          'Sign Up',
                          style: TextStyle(fontSize: width * 0.05),
                        ),
                      ),
                    ).pOnly(bottom: height * 0.01),
                  ],
                ),
              ).pOnly(bottom: height * 0.235),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.asset(
                    'assets/icons/facebook.png',
                    width: width * 0.1,
                  ),
                  Image.asset(
                    'assets/icons/google.png',
                    width: width * 0.1,
                  ),
                  Image.asset(
                    'assets/icons/linkedin.png',
                    width: width * 0.1,
                  ),
                ],
              ).px(width * 0.2).py16(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Already have an account?',
                    style: TextStyle(color: Colors.black54),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return const LogIn();
                        }),
                      );
                    },
                    child: const Text(' Log In'),
                  ),
                ],
              ),
            ],
          ),
        ],
      ).p(16),
    );
  }

  void showSnackBar(BuildContext context, {required String text}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(text),
      ),
    );
  }

  Future<void> registerUser() async {
     UserCredential user =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email!,
      password: password!,
    );
  }
}
