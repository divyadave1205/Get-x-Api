import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:mbo_admin_pannel/src/blog/controller/edit_blog_screen_controller.dart';
import 'package:mbo_admin_pannel/src/blog/model/get_blog_model.dart';
import 'package:mbo_admin_pannel/utilities/font_style_utilities.dart';
import 'package:mbo_admin_pannel/widget/custom_appbar.dart';
import 'package:mbo_admin_pannel/widget/custom_button.dart';
import 'package:mbo_admin_pannel/widget/custom_detaile_textfield.dart';
import 'package:mbo_admin_pannel/widget/custom_textfield.dart';

class EditBlogArgument {
  final Datum memberId;
  EditBlogArgument({required this.memberId});
}

class EditBlogScreen extends StatefulWidget {
  final EditBlogArgument argument;
  const EditBlogScreen({Key? key, required this.argument}) : super(key: key);

  @override
  State<EditBlogScreen> createState() => _EditBlogScreenState();
}

class _EditBlogScreenState extends State<EditBlogScreen> {
  final EditBlogScreenController _editBlogScreenController =
      Get.find(tag: EditBlogScreenController().toString());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: PreferredSize(
            preferredSize: const Size(0, 60),
            child: CustomAppbar(
              title: "editBlogTitleText".tr,
            )),
        body: GetBuilder<EditBlogScreenController>(
          init: _editBlogScreenController,
          builder: (_) => Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  CustomTextField(
                      titleText: widget.argument.memberId.title,
                      controller:
                          _editBlogScreenController.editBlogTitleController),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 45,
                          child: TextField(
                            controller: _editBlogScreenController
                                .editImageNameController,
                            decoration: InputDecoration(
                                fillColor: Colors.transparent,
                                border: const UnderlineInputBorder(
                                    borderSide: BorderSide(
                                  color: Color(0xFFDADADA),
                                )),
                                filled: true,
                                contentPadding: const EdgeInsets.only(top: 10),
                                hintStyle: FontStyleUtilities.h14(
                                    fontColor: Colors.black),
                                hintText:
                                    widget.argument.memberId.featureImage ??
                                        "editImageTitleText".tr),
                          ),
                        ),
                      ),
                      _editBlogScreenController.image == null
                          ? GestureDetector(
                              onTap: () {
                                Get.bottomSheet(Container(
                                  height: 170,
                                  width: Get.width,
                                  child: Center(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            _editBlogScreenController
                                                .getImageFromCamera();
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
                                                  style: const TextStyle(
                                                      fontSize: 18),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            _editBlogScreenController
                                                .getImageFromGallery();
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
                                ));
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
                  const SizedBox(height: 20),
                  CustomDetailTextField(
                    titleText: "contentTitleText".tr,
                    textEditingController:
                        _editBlogScreenController.editBlogContentController,
                    detailTextFieldTitle: widget.argument.memberId.content,
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
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    _editBlogScreenController
                                        .attachmentGetImageFromCamera();
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
                                          style: const TextStyle(fontSize: 18),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    _editBlogScreenController
                                        .attachmentGetImageFromGallery();
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
                                          style: const TextStyle(fontSize: 18),
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
                      );
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
                    height: MediaQuery.of(context).size.height * 0.3,
                  ),
                  CustomButton(
                    title: "saveButtonTitleText".tr,
                    onCustomButtonTap: () {
                      FocusScope.of(context).unfocus();
                      _editBlogScreenController
                          .editBlog(editBlogId: widget.argument.memberId.id)
                          .then((value) => Get.back());
                    },
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  @override
  void initState() {
    _editBlogScreenController.editBlogTitleController.clear();
    _editBlogScreenController.editBlogContentController.clear();
    _editBlogScreenController.editImageNameController.clear();
    // TODO: implement initState
    super.initState();
  }
}
