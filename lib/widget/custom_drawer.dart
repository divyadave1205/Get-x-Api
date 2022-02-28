import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mbo_admin_pannel/src/member/controller/member_controller.dart';
import 'package:mbo_admin_pannel/src/member/model/get_userlist_model.dart';
import 'package:mbo_admin_pannel/utilities/assets_utilities.dart';
import 'package:mbo_admin_pannel/utilities/color_utilities.dart';

// ignore: must_be_immutable
class CustomDrawer extends StatelessWidget {
  MemberScreenController memberScreenController =
      Get.put(MemberScreenController());
  CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          const DrawerHeader(
              child: Image(
            image: AssetImage(AssetUtilities.applicationLogo),
          )),
          Column(
            children: [
              ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: pageModel.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Get.toNamed(pageModel[index].navigator);
                      },
                      child: Container(
                        width: 250,
                        height: 50,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 8),
                        alignment: Alignment.center,
                        child: Text(pageModel[index].title,
                            style: memberScreenController.selected
                                ? const TextStyle(fontWeight: FontWeight.bold)
                                : const TextStyle(fontWeight: FontWeight.w400)),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: memberScreenController.selected
                              ? ColorUtilities.blueshadowColor
                              : ColorUtilities.whiteColor,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.shade300,
                                blurRadius: 1,
                                offset: const Offset(2, 5),
                                spreadRadius: 0.5)
                          ],
                        ),
                      ),
                    );
                  }),
            ],
          )
        ],
      ),
    );
  }
}
