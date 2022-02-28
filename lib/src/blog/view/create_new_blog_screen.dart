import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mbo_admin_pannel/src/blog/controller/create_new_blog_screen_controller.dart';
import 'package:mbo_admin_pannel/utilities/font_style_utilities.dart';
import 'package:mbo_admin_pannel/utilities/route_utilities.dart';
import 'package:mbo_admin_pannel/widget/custom_appbar.dart';
import 'package:mbo_admin_pannel/widget/custom_button.dart';
import 'package:mbo_admin_pannel/widget/custom_detaile_textfield.dart';
import 'package:mbo_admin_pannel/widget/custom_textfield.dart';

class CreateNewBlogScreen extends StatelessWidget {
  CreateNewBlogScreen({Key? key}) : super(key: key);
  final _createNewBlogScreenController =
      Get.put(CreateNewBlogScreenController());
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return await Get.toNamed(RouteUtilities.blogScreen);
      },
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: PreferredSize(
              preferredSize: const Size(0, 60),
              child: CustomAppbar(
                title: "newBlogTitleText".tr,
              )),
          body: GetBuilder<CreateNewBlogScreenController>(
            builder: (_) => Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    CustomTextField(
                        titleText: "titleText".tr,
                        controller:
                            _createNewBlogScreenController.blogTitleController),
                    const SizedBox(height: 20),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 45,
                            child: TextField(
                              controller: _createNewBlogScreenController
                                  .imageNameController,
                              decoration: InputDecoration(
                                  fillColor: Colors.transparent,
                                  border: const UnderlineInputBorder(
                                      borderSide: BorderSide(
                                    color: Color(0xFFDADADA),
                                  )),
                                  filled: true,
                                  contentPadding:
                                      const EdgeInsets.only(top: 10),
                                  hintStyle: FontStyleUtilities.h14(
                                      fontColor: Colors.black),
                                  hintText: _createNewBlogScreenController
                                          .imageNameController.text.isEmpty
                                      ? 'featureImageTitleText'.tr
                                      : _createNewBlogScreenController
                                          .imageNameController.text),
                            ),
                          ),
                        ),
                        _createNewBlogScreenController.image == null
                            ? GestureDetector(
                                onTap: () {
                                  Get.bottomSheet(
                                      Container(
                                        height: 170,
                                        width: Get.width,
                                        child: Center(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  _createNewBlogScreenController
                                                      .getImageFromCamera();
                                                  Get.back();
                                                },
                                                child: SizedBox(
                                                  height: 140,
                                                  width: 100,
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      const Icon(
                                                        Icons.camera,
                                                        size: 70,
                                                      ),
                                                      Text(
                                                        'cameraTitleText'.tr,
                                                        style: const TextStyle(
                                                            fontSize: 18),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  _createNewBlogScreenController
                                                      .getImageFromGallery();
                                                  Get.back();
                                                },
                                                child: SizedBox(
                                                  height: 140,
                                                  width: 100,
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      const Icon(
                                                        Icons.image,
                                                        size: 70,
                                                      ),
                                                      Text(
                                                        'galleryTitleText'.tr,
                                                        style: const TextStyle(
                                                            fontSize: 18),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        color: Colors.white,
                                      ),
                                      isDismissible: true,
                                      isScrollControlled: false);
                                },
                                child: Container(
                                  height: 30,
                                  width: 70,
                                  decoration: BoxDecoration(
                                      color: const Color(0xff115990),
                                      borderRadius: BorderRadius.circular(7)),
                                  child: Center(
                                      child: Text(
                                    'selectButtomText'.tr,
                                    style: const TextStyle(color: Colors.white),
                                  )),
                                ),
                              )
                            : Container()
                      ],
                    ),
                    const SizedBox(height: 55),
                    CustomDetailTextField(
                      titleText: 'contentTitleText'.tr,
                      textEditingController:
                          _createNewBlogScreenController.blogContentController,
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        Get.bottomSheet(
                            Container(
                              height: 170,
                              width: Get.width,
                              child: Center(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        _createNewBlogScreenController
                                            .attachmentGetImageFromCamera();
                                        Get.back();
                                      },
                                      child: SizedBox(
                                        height: 140,
                                        width: 100,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            const Icon(
                                              Icons.camera,
                                              size: 70,
                                            ),
                                            Text(
                                              'cameraTitleText'.tr,
                                              style:
                                                  const TextStyle(fontSize: 18),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        _createNewBlogScreenController
                                            .attachmentGetImageFromGallery();
                                        Get.back();
                                      },
                                      child: SizedBox(
                                        height: 140,
                                        width: 100,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            const Icon(
                                              Icons.image,
                                              size: 70,
                                            ),
                                            Text(
                                              'galleryTitleText'.tr,
                                              style:
                                                  const TextStyle(fontSize: 18),
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              color: Colors.white,
                            ),
                            isDismissible: true,
                            isScrollControlled: false);
                      },
                      child: Row(
                        children: [
                          const Icon(Icons.image),
                          const SizedBox(
                            width: 15,
                          ),
                          Text('attechmentTitleText'.tr)
                        ],
                      ),
                    ),
                    SizedBox(
                      height: Get.height * 0.07,
                    ),
                    CustomButton(
                      title: "saveButtonTitleText".tr,
                      onCustomButtonTap: () {
                        _createNewBlogScreenController.addBlog().then(
                            (value) => Get.toNamed(RouteUtilities.blogScreen));
                      },
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
