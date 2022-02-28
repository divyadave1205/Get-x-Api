import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mbo_admin_pannel/src/member/controller/create_new_member_controller.dart';
import 'package:mbo_admin_pannel/utilities/assets_utilities.dart';
import 'package:mbo_admin_pannel/utilities/color_utilities.dart';
import 'package:mbo_admin_pannel/utilities/font_style_utilities.dart';
import 'package:mbo_admin_pannel/utilities/route_utilities.dart';

class ReadMemberDetailArgument {
  final String memberId;
  ReadMemberDetailArgument({required this.memberId});
}

class MemberDetailScreen extends StatefulWidget {
  final ReadMemberDetailArgument argument;
  const MemberDetailScreen({Key? key, required this.argument})
      : super(key: key);

  @override
  State<MemberDetailScreen> createState() => _MemberDetailScreenState();
}

class _MemberDetailScreenState extends State<MemberDetailScreen> {
  final MemberDetailScreenController _memberDetailScreenController =
      Get.find(tag: MemberDetailScreenController().toString());
  @override
  void initState() {
    _memberDetailScreenController.getUserDetail(
        userDetailId: widget.argument.memberId);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<MemberDetailScreenController>(
          init: _memberDetailScreenController,
          builder: (_) {
            if (_memberDetailScreenController.userDetail == null) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return Column(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(AssetUtilities.placeHolderImage),
                            fit: BoxFit.cover)),
                    height: Get.height * 0.36,
                    child: Stack(
                      children: [
                        Positioned(
                          top: 32,
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            color: Colors.grey.withOpacity(0.7),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    Get.back();
                                  },
                                  icon: const Icon(
                                    Icons.arrow_back,
                                    color: ColorUtilities.whiteColor,
                                    size: 25,
                                  ),
                                ),
                                Text(
                                  _memberDetailScreenController
                                      .userDetail!.data.personalInfo[0].fullName
                                      .toString(),
                                  style: const TextStyle(
                                      fontSize: 18,
                                      color: ColorUtilities.whiteColor),
                                ),
                                Stack(
                                  children: [
                                    IconButton(
                                      icon: const Icon(
                                        Icons.notifications,
                                        size: 34,
                                        color: ColorUtilities.whiteColor,
                                      ),
                                      onPressed: () {
                                        Get.toNamed(
                                            RouteUtilities.notificationScreen);
                                      },
                                    ),
                                    Positioned(
                                      top: 5,
                                      right: 7,
                                      child: Container(
                                        padding: const EdgeInsets.all(4),
                                        child: const Text(
                                          '0',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12),
                                        ),
                                        decoration: const BoxDecoration(
                                          color: Colors.red,
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Column(
                          children: [
                            const SizedBox(height: 20),
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              height: 80,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  buildUserDetailText(
                                      title: "firstNameTitle".tr,
                                      subTitle: _memberDetailScreenController
                                          .userDetail!
                                          .data
                                          .personalInfo[0]
                                          .familyName
                                          .toString()),
                                  buildUserDetailText(
                                      title: "lastNameTitle".tr,
                                      subTitle: _memberDetailScreenController
                                          .userDetail!
                                          .data
                                          .personalInfo[0]
                                          .firstName
                                          .toString()),
                                  buildUserDetailText(
                                      title: "fatherNameTitle".tr,
                                      subTitle: _memberDetailScreenController
                                          .userDetail!
                                          .data
                                          .personalInfo[0]
                                          .fatherName
                                          .toString()),
                                ],
                              ),
                              width: Get.width,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1, color: const Color(0xFFD7D7D7)),
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                            const SizedBox(height: 30),
                            Container(
                              child: buildUserDetailText(
                                  title: "dateOfBirthTitle".tr,
                                  subTitle: _memberDetailScreenController
                                      .userDetail!
                                      .data
                                      .personalInfo[0]
                                      .dateOfBirth
                                      .toString(),
                                  userDetailIcon: Icons.date_range),
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              height: 80,
                              width: Get.width,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1, color: const Color(0xFFD7D7D7)),
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                            const SizedBox(height: 20),
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              height: 80,
                              child: buildUserDetailText(
                                  title: "socialStatusTitle".tr,
                                  userDetailIcon:
                                      Icons.family_restroom_outlined,
                                  subTitle: _memberDetailScreenController
                                      .userDetail!
                                      .data
                                      .personalInfo[0]
                                      .socialStatus
                                      .toString()),
                              width: Get.width,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1, color: const Color(0xFFD7D7D7)),
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                            const SizedBox(height: 20),
                            SizedBox(
                              height: 100,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Text(
                                      'basicInformationContactInformationTitle'
                                          .tr,
                                      style: FontStyleUtilities.h18(
                                          fontColor: ColorUtilities.blackColor),
                                    ),
                                  ),
                                  const SizedBox(height: 15),
                                  buildInformation(
                                      informationIcon: Icons.public,
                                      informationText:
                                          _memberDetailScreenController
                                              .userDetail!
                                              .data
                                              .personalInfo[0]
                                              .city
                                              .toString()),
                                  const SizedBox(height: 8),
                                  buildInformation(
                                      informationIcon: Icons.call,
                                      informationText:
                                          _memberDetailScreenController
                                              .userDetail!
                                              .data
                                              .personalInfo[0]
                                              .phoneNumber
                                              .toString())
                                ],
                              ),
                            ),
                            const SizedBox(height: 20),
                            SizedBox(
                              height: 70,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'adressTitle'.tr,
                                    style: FontStyleUtilities.h18(
                                        fontColor: ColorUtilities.blackColor),
                                  ),
                                  const SizedBox(height: 15),
                                  buildInformation(
                                      informationIcon: Icons.location_on,
                                      informationText:
                                          _memberDetailScreenController
                                              .userDetail!
                                              .data
                                              .personalInfo[0]
                                              .address
                                              .toString()),
                                ],
                              ),
                            ),
                            const SizedBox(height: 20),
                            SizedBox(
                              height: 115,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'socialMediaLinkTitle'.tr,
                                    style: FontStyleUtilities.h18(
                                        fontColor: ColorUtilities.blackColor),
                                  ),
                                  buildInformation(
                                      informationIcon: Icons.image,
                                      informationText:
                                          _memberDetailScreenController
                                              .userDetail!
                                              .data
                                              .personalInfo[0]
                                              .instagram
                                              .toString()),
                                  const SizedBox(height: 8),
                                  buildInformation(
                                      informationIcon: Icons.near_me_sharp,
                                      informationText:
                                          _memberDetailScreenController
                                              .userDetail!
                                              .data
                                              .personalInfo[0]
                                              .twitter
                                              .toString()),
                                  const SizedBox(height: 8),
                                  buildInformation(
                                      informationIcon: Icons.person,
                                      informationText: "Manager assistant")
                                ],
                              ),
                            ),
                            const SizedBox(height: 30),
                            SizedBox(
                              height: 60,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    'hobbiesAndInterestTitle'.tr,
                                    style: FontStyleUtilities.h18(
                                        fontColor: ColorUtilities.blackColor),
                                  ),
                                  const SizedBox(height: 2),
                                  buildInformation(
                                      informationIcon: Icons.settings,
                                      informationText:
                                          _memberDetailScreenController
                                              .userDetail!
                                              .data
                                              .personalInfo[0]
                                              .hobby1
                                              .toString()),
                                ],
                              ),
                            ),
                            const SizedBox(height: 20),
                            SizedBox(
                              height: 100,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    'approvalsTitle'.tr,
                                    style: FontStyleUtilities.h18(
                                        fontColor: ColorUtilities.blackColor),
                                  ),
                                  const SizedBox(height: 2),
                                  buildInformation(
                                      informationIcon: Icons.error_outline,
                                      informationText: 'First Identifier'),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Icon(
                                        Icons
                                            .drive_file_rename_outline_outlined,
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Signature",
                                            style: FontStyleUtilities.h14(
                                                fontColor:
                                                    ColorUtilities.blackColor),
                                          ),
                                          Text("(MemberShip Number)",
                                              style: FontStyleUtilities.h14(
                                                  fontColor:
                                                      const Color(0xFF606060)))
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(height: 40),
                            Container(
                              height: 50,
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'contactNowButtonText'.tr,
                                      style: FontStyleUtilities.h18(
                                          fontColor: ColorUtilities.whiteColor),
                                    ),
                                    const SizedBox(width: 10),
                                    const Icon(
                                      Icons.call,
                                      color: ColorUtilities.whiteColor,
                                    )
                                  ],
                                ),
                              ),
                              decoration: BoxDecoration(
                                  color: ColorUtilities.blueColor,
                                  borderRadius: BorderRadius.circular(10)),
                              margin: const EdgeInsets.symmetric(vertical: 15),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }
          }),
    );
  }

  Widget buildInformation(
      {required IconData informationIcon, required String informationText}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          informationIcon,
          size: 20,
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
            child: SizedBox(
                child: Text(
          informationText,
          style: FontStyleUtilities.h14(fontColor: ColorUtilities.blackColor),
        )))
      ],
    );
  }

  Widget buildUserDetailText(
      {required String title,
      required String subTitle,
      IconData? userDetailIcon}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          title,
          style: FontStyleUtilities.h14(fontColor: const Color(0xFF858585)),
        ),
        userDetailIcon == null
            ? Text(subTitle,
                style: FontStyleUtilities.h16(
                    fontColor: ColorUtilities.blackColor))
            : Row(
                children: [
                  Icon(
                    userDetailIcon,
                    color: ColorUtilities.blackColor,
                    size: 22,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    subTitle,
                    style: FontStyleUtilities.h16(
                        fontColor: ColorUtilities.blackColor),
                  ),
                ],
              ),
      ],
    );
  }
}
