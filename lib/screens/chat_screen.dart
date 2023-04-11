import 'package:chat_app/core/constants/colors.dart';
import 'package:chat_app/model/message_model.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference messages =
        FirebaseFirestore.instance.collection('Messages');
    TextEditingController controller = TextEditingController();
    double width = MediaQuery.of(context).size.width;
    return FutureBuilder<QuerySnapshot>(
        future: messages.get(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            print(snapshot.data?.docs[0]['Message']);
            List<Message> messagesList = [];
            for(int i = 0; i < snapshot.data!.docs.length; i++){
              messagesList.add(Message.fromJson(snapshot.data!.docs[i]));
            }
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
                  Expanded(
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: messagesList.length,
                      itemBuilder: (BuildContext context, int index) =>
                          ChatBubble(
                            clipper:
                            ChatBubbleClipper1(type: BubbleType.receiverBubble),
                            backGroundColor: kPrimaryColor,
                            child: Text(
                              '${snapshot.data?.docs[index]['Message']}',
                              style: const TextStyle(color: Colors.white),
                            ),
                          ).py(10),
                    ).px(12),
                  ),
                  TextField(
                    controller: controller,
                    onSubmitted: (value) {
                      messages.add({
                        'Message': value,
                      });
                      controller.clear();
                    },
                    decoration: InputDecoration(
                      hintText: 'Send a Message',
                      suffixIcon: IconButton(
                        onPressed: () {
                          messages.add({
                            'Message': controller.text,
                          });
                        },
                        icon: const Icon(
                          Icons.send,
                          color: kPrimaryColor,
                        ),
                      ),
                      contentPadding: const EdgeInsets.all(8),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: kPrimaryColor),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ).pSymmetric(v: 6, h: 8)
                ],
              ).pOnly(bottom: 8),
            );
          }  else {
            return Scaffold(body: Center(child: CircularProgressIndicator()));
          }
        });
  }
}
