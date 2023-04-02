import 'package:chat_app/core/constants/colors.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        foregroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Text(
          'Chat',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
    );
  }
}
