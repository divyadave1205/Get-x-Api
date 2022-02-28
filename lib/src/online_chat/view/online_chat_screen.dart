import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mbo_admin_pannel/src/online_chat/model/online_chat_model.dart';
import 'package:mbo_admin_pannel/utilities/color_utilities.dart';
import 'package:mbo_admin_pannel/utilities/route_utilities.dart';
import 'package:mbo_admin_pannel/widget/custom_appbar.dart';
import 'package:mbo_admin_pannel/widget/custom_drawer.dart';

// ignore: must_be_immutable
class OnlineChatScreen extends StatelessWidget {
  OnlineChatScreen({Key? key}) : super(key: key);

  List<ChatUsers> chatUsers = [
    ChatUsers(
        name: "اسم",
        messageText:
            "لوريم إيبسوم هو ببساطة نص شكلي يستخدم في صناعة الطباعة والتنضيد.",
        imageURL:
            "https://thumbor.forbes.com/thumbor/fit-in/416x416/filters%3Aformat%28jpg%29/https%3A%2F%2Fspecials-images.forbesimg.com%2Fimageserve%2F5f4ebe0c87612dab4f12a597%2F0x0.jpg%3Fbackground%3D000000%26cropX1%3D292%26cropX2%3D3684%26cropY1%3D592%26cropY2%3D3987",
        time: "9:00 am"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size(0, 60),
          child: CustomAppbar(
            title: "OnlineChatTitleChat".tr,
          )),
      drawer: CustomDrawer(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextFormField(
              decoration: InputDecoration(
                  hintText: "searchTitleTextFieldText".tr,
                  hintStyle: const TextStyle(color: Colors.grey),
                  border: InputBorder.none,
                  suffixIcon: const Icon(Icons.search),
                  fillColor: ColorUtilities.blueshadowColor,
                  filled: true),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: chatUsers.length,
              shrinkWrap: true,
              padding: const EdgeInsets.only(top: 16),
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    Get.toNamed(RouteUtilities.onlineChatDetailScreen);
                  },
                  leading: CircleAvatar(
                      backgroundImage:
                          NetworkImage(chatUsers[index].imageURL.toString())),
                  title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(chatUsers[index].name.toString()),
                        Text(
                          chatUsers[index].time.toString(),
                          style: const TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                              overflow: TextOverflow.ellipsis),
                        ),
                      ]),
                  subtitle: Text(
                    chatUsers[index].messageText.toString(),
                    style: const TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                        overflow: TextOverflow.ellipsis),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
