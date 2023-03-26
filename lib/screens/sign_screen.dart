import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../core/components/textfield.dart';

class SignIn extends StatelessWidget {
  const SignIn({Key? key}) : super(key: key);

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
          ).pOnly(bottom: height * 0.13),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome Back!',
                style: TextStyle(
                    fontSize: width * 0.09, fontWeight: FontWeight.bold),
              ),
              Text(
                'Sign in to continue',
                style: TextStyle(fontSize: width * 0.04, color: Colors.black54),
              ).pOnly(bottom: height * 0.08),
              defaultTextField(
                  label: 'Username',
                  inputType: TextInputType.emailAddress,
                  hint: 'Enter your username'),
              defaultTextField(
                      label: 'Password',
                      inputType: TextInputType.visiblePassword,
                      hint: 'Enter your password')
                  .py8(),
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
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                            backgroundColor: const Color.fromRGBO(251, 196, 38, 1),
                            foregroundColor: Colors.black87),
                        child: Text(
                          'Login Now',
                          style: TextStyle(fontSize: width * 0.05),
                        ),
                      ),
                    ).pOnly(bottom: height * 0.01),
                    const Text('Forgot Password?'),
                  ],
                ),
              ).pOnly(bottom: height * 0.21),
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
                    'Don\'t have an account?',
                    style: TextStyle(color: Colors.black54),
                  ),
                  InkWell(onTap: () {}, child: const Text(' Sign up')),
                ],
              ),
            ],
          ),
        ],
      ).p(16),
    );
  }
}
