import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mbo_admin_pannel/utilities/color_utilities.dart';
import 'package:mbo_admin_pannel/utilities/route_utilities.dart';

class CustomAppbar extends StatelessWidget {
  final String title;
  final int? notificationMessageCount;
  const CustomAppbar(
      {Key? key, required this.title, this.notificationMessageCount = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      iconTheme: const IconThemeData(color: ColorUtilities.blueColor),
      title: Text(
        title,
        style: const TextStyle(color: ColorUtilities.blueColor),
      ),
      actions: [
        SizedBox(
          child: Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: IconButton(
                  icon: const Icon(
                    Icons.notifications,
                    size: 34,
                  ),
                  onPressed: () {
                    Get.toNamed(RouteUtilities.notificationScreen);
                  },
                ),
              ),
              Positioned(
                top: 12,
                right: 8,
                child: Container(
                  width: 18,
                  height: 18,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: ColorUtilities.redColor,
                      border: Border.all(color: Colors.white, width: 2)),
                  child: Center(
                    child: Text(
                      notificationMessageCount.toString(),
                      style: const TextStyle(fontSize: 8),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.person,
              size: 34,
            ))
      ],
    );
  }
}
