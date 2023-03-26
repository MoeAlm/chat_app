import 'package:chat_app/screens/sign_screen.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Chatting',
          style: TextStyle(fontSize: width * 0.07),
        ),
      ),
      body: Column(
        children: [
          Image.asset('assets/images/Chatting.png'),
          Text(
            'Hello!',
            style:
                TextStyle(fontSize: width * 0.09, fontWeight: FontWeight.bold),
          ),
          Text(
            'Welcome to our chatting app talk  and to anyone from anywhere for free',
            style: TextStyle(fontSize: width * 0.05, color: Colors.black54),
            textAlign: TextAlign.center,
          ).px32(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: width * 0.3,
                child: ElevatedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(251, 196, 38, 1),//const Color.fromRGBO(251, 196, 38, 1),
                      foregroundColor: Colors.black54),
                  child: Text(
                    'Login',
                    style: TextStyle(
                        fontSize: width * 0.05, color: Colors.black87),
                  ),
                ),
              ).px8(),
              SizedBox(
                width: width * 0.3,
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return const SignIn();
                      }),
                    );
                  },
                  style:
                      OutlinedButton.styleFrom(foregroundColor: Colors.black),
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                        fontSize: width * 0.05, color: Colors.black87),
                  ),
                ),
              ).px8(),
            ],
          ).py16(),
          const Text(
            'Or via social media',
            style: TextStyle(color: Colors.black87),
          ),
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
          ).px(width * 0.25).py16()
        ],
      ),
    );
  }
}
