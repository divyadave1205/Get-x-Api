import 'package:flutter/material.dart';
import 'package:mbo_admin_pannel/src/online_chat/model/chat_detail_model.dart';

// ignore: must_be_immutable
class OnlineChatDetailScreen extends StatelessWidget {
  final String? imageUrl;
  final String? name;

  List<ChatMessage> messages = [
    ChatMessage(
        messageContent:
            "لوريم إيبسوم هو ببساطة نص شكلي يستخدم في صناعة الطباعة والتنضيد.",
        messageType: "receiver"),
    ChatMessage(
        messageContent:
            "لوريم إيبسوم هو ببساطة نص شكلي يستخدم في صناعة الطباعة والتنضيد.",
        messageType: "sender"),
  ];

  OnlineChatDetailScreen({Key? key, this.imageUrl, this.name = 'اسم'})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
          backgroundColor: Colors.transparent,
          actions: [
            CircleAvatar(
                radius: 20, backgroundImage: NetworkImage(imageUrl.toString())),
            Text(name.toString()),
          ],
        ),
        body: ListView.builder(
          itemCount: messages.length,
          shrinkWrap: true,
          padding: const EdgeInsets.only(top: 10, bottom: 10),
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return Container(
              padding: const EdgeInsets.only(
                  left: 14, right: 14, top: 10, bottom: 10),
              child: Align(
                alignment: (messages[index].messageType == "receiver"
                    ? Alignment.topLeft
                    : Alignment.topRight),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: (messages[index].messageType == "receiver"
                        ? Colors.grey.shade200
                        : Colors.blue[200]),
                  ),
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    messages[index].messageContent.toString(),
                    style: const TextStyle(fontSize: 15),
                  ),
                ),
              ),
            );
          },
        ));
  }
}
