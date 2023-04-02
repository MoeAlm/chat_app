import 'package:chat_app/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:flutter_chat_bubble/chat_bubble.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        foregroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Text(
          'Chat',
          style: TextStyle(
              color: Colors.white,
              fontSize: width * 0.085,
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          ChatBubble(
            alignment: Alignment.topRight,
            clipper: ChatBubbleClipper1(type: BubbleType.sendBubble),
            child: const Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua',
              style: TextStyle(color: Colors.white),
            ),
          ).py8(),
          ChatBubble(
            clipper: ChatBubbleClipper1(type: BubbleType.receiverBubble),
            backGroundColor: kPrimaryColor,
            child: Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ).px(12),
    );
  }
}
