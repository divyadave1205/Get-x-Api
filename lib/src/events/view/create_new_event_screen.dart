import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mbo_admin_pannel/src/events/controller/create_new_event_screen_controller.dart';
import 'package:mbo_admin_pannel/utilities/font_style_utilities.dart';
import 'package:mbo_admin_pannel/widget/custom_appbar.dart';
import 'package:mbo_admin_pannel/widget/custom_button.dart';
import 'package:mbo_admin_pannel/widget/custom_detaile_textfield.dart';
import 'package:mbo_admin_pannel/widget/custom_textfield.dart';

class CreateNewEventScreen extends StatelessWidget {
  CreateNewEventScreen({Key? key}) : super(key: key);
  final CreateNewEventScreenController _createNewEventScreenController =
      Get.find(tag: CreateNewEventScreenController().toString());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size(0, 60),
          child: CustomAppbar(
            title: "newEventTitleText".tr,
          )),
      body: SizedBox(
        height: Get.height,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: GetBuilder<CreateNewEventScreenController>(
              init: _createNewEventScreenController,
              builder: (_) => Column(
                children: [
                  const SizedBox(height: 10),
                  CustomTextField(
                      titleText: 'eventNameTitleText'.tr,
                      controller:
                          _createNewEventScreenController.eventNameController),
                  const SizedBox(height: 20),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: SizedBox(
                          width: _createNewEventScreenController.image == null
                              ? Get.width * 0.65
                              : Get.width * 0.922,
                          height: 45,
                          child: TextField(
                            controller: _createNewEventScreenController
                                .imageNameController,
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
                                hintText: _createNewEventScreenController
                                        .imageNameController.text.isEmpty
                                    ? 'featureImageTitleText'.tr
                                    : _createNewEventScreenController
                                        .imageNameController.text),
                          ),
                        ),
                      ),
                      _createNewEventScreenController.image == null
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
                                                _createNewEventScreenController
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
                                                      Icons.camera_alt_outlined,
                                                      size: 50,
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
                                                _createNewEventScreenController
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
                                                      size: 50,
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
                  CustomButton(
                      onCustomButtonTap: () {},
                      color: Colors.blue.shade50,
                      textColor: Colors.black,
                      title: 'eventDetailButtonText'.tr),
                  CustomDetailTextField(
                    titleText: 'descriptionTitleText'.tr,
                    textEditingController: _createNewEventScreenController
                        .eventDescriptionController,
                  ),
                  const SizedBox(height: 30),
                  CustomTextField(
                    controller:
                        _createNewEventScreenController.eventDateController,
                    titleText: _createNewEventScreenController
                            .eventDateController.text.isEmpty
                        ? 'selectDateTitleText'.tr
                        : _createNewEventScreenController
                            .eventDateController.text,
                    realOnlyKeyborad: true,
                    onCustomTextFieldTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime
                              .now(), //DateTime.now() - not to allow to choose before today.
                          lastDate: DateTime(2121));

                      if (pickedDate != null) {
                        String formattedDate =
                            DateFormat('dd-MM-yyyy').format(pickedDate);
                        _createNewEventScreenController
                            .eventDateController.text = formattedDate;
                      } else {}
                    },
                  ),
                  CustomTextField(
                    controller: _createNewEventScreenController
                        .eventStartTimeController,
                    realOnlyKeyborad: true,
                    titleText: 'startTimeTitleText'.tr,
                    onCustomTextFieldTap: () async {
                      TimeOfDay? pickedTime = await showTimePicker(
                        initialTime: TimeOfDay.now(),
                        context: context,
                      );

                      if (pickedTime != null) {
                        DateTime parsedTime = DateFormat.jm()
                            .parse(pickedTime.format(context).toString());
                        String eventStartTime =
                            DateFormat('HH:mm:ss').format(parsedTime);
                        _createNewEventScreenController
                            .eventStartTimeController.text = eventStartTime;
                      } else {}
                    },
                  ),
                  CustomTextField(
                    controller:
                        _createNewEventScreenController.eventEndTimeController,
                    titleText: 'endTimeTitleText'.tr,
                    realOnlyKeyborad: true,
                    onCustomTextFieldTap: () async {
                      TimeOfDay? pickedTime = await showTimePicker(
                        initialTime: TimeOfDay.now(),
                        context: context,
                      );

                      if (pickedTime != null) {
                        DateTime parsedTime = DateFormat.jm()
                            .parse(pickedTime.format(context).toString());
                        String eventEndTime =
                            DateFormat('HH:mm:ss').format(parsedTime);
                        _createNewEventScreenController
                            .eventEndTimeController.text = eventEndTime;
                      } else {}
                    },
                  ),
                  CustomTextField(
                    titleText: 'cityTitleText'.tr,
                    controller:
                        _createNewEventScreenController.eventCityController,
                  ),
                  CustomTextField(
                    titleText: 'addressTitleText'.tr,
                    controller:
                        _createNewEventScreenController.eventAddressController,
                  ),
                  const SizedBox(height: 20),
                  CustomDetailTextField(
                    titleText: 'additionalInformationTitleText'.tr,
                    textEditingController: _createNewEventScreenController
                        .eventAdditionalInformationController,
                  ),
                  const SizedBox(height: 100),
                  CustomButton(
                      onCustomButtonTap: () {
                        _createNewEventScreenController
                            .addEvent()
                            .then((value) => Get.back());
                      },
                      title: 'saveButtonTitleText'.tr)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
