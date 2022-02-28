import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:intl/intl.dart';
import 'package:mbo_admin_pannel/src/events/controller/edit_event_screen_controller.dart';
import 'package:mbo_admin_pannel/src/events/model/event_model.dart';
import 'package:mbo_admin_pannel/utilities/font_style_utilities.dart';
import 'package:mbo_admin_pannel/widget/custom_appbar.dart';
import 'package:mbo_admin_pannel/widget/custom_button.dart';
import 'package:mbo_admin_pannel/widget/custom_detaile_textfield.dart';
import 'package:mbo_admin_pannel/widget/custom_textfield.dart';

class EditEventArgument {
  final Datum member;
  EditEventArgument({required this.member});
}

class EditEventScreen extends StatefulWidget {
  final EditEventArgument argument;
  const EditEventScreen({Key? key, required this.argument}) : super(key: key);

  @override
  State<EditEventScreen> createState() => _EditEventScreenState();
}

class _EditEventScreenState extends State<EditEventScreen> {
  final EditEventScreenController _editEventScreenController =
      Get.find(tag: EditEventScreenController().toString());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size(0, 60),
          child: CustomAppbar(
            title: "editEventTitleText".tr,
          )),
      body: SizedBox(
        height: Get.height,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: GetBuilder<EditEventScreenController>(
              init: _editEventScreenController,
              builder: (_) => Column(
                children: [
                  const SizedBox(height: 10),
                  CustomTextField(
                      titleText: widget.argument.member.eventName,
                      controller:
                          _editEventScreenController.editEventNameController),
                  const SizedBox(height: 20),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 45,
                          child: TextField(
                            controller: _editEventScreenController
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
                                hintText: _editEventScreenController
                                            .editImageNameController.text ==
                                        null
                                    ? widget.argument.member.eventImage
                                    : _editEventScreenController
                                        .editImageNameController.text),
                          ),
                        ),
                      ),
                      _editEventScreenController.image == null
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
                                                _editEventScreenController
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
                                                _editEventScreenController
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
                  const SizedBox(height: 40),
                  CustomDetailTextField(
                    titleText: "descriptionTitleText".tr,
                    textEditingController: _editEventScreenController
                        .editEventDescriptionController,
                    detailTextFieldTitle: widget.argument.member.description,
                  ),
                  const SizedBox(height: 30),
                  CustomTextField(
                    controller:
                        _editEventScreenController.editEventDateController,
                    titleText: _editEventScreenController
                            .editEventDateController.text.isEmpty
                        ? widget.argument.member.date
                        : _editEventScreenController
                            .editEventDateController.text,
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
                        _editEventScreenController
                            .editEventDateController.text = formattedDate;
                      }
                    },
                  ),
                  CustomTextField(
                    controller:
                        _editEventScreenController.editEventStartTimeController,
                    realOnlyKeyborad: true,
                    titleText: widget.argument.member.startTime,
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
                        _editEventScreenController
                            .editEventStartTimeController.text = eventStartTime;
                      }
                    },
                  ),
                  CustomTextField(
                    controller:
                        _editEventScreenController.editEventEndTimeController,
                    titleText: widget.argument.member.endTime,
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
                        _editEventScreenController
                            .editEventEndTimeController.text = eventEndTime;
                      }
                    },
                  ),
                  CustomTextField(
                    titleText: widget.argument.member.city,
                    controller:
                        _editEventScreenController.editEventCityController,
                  ),
                  CustomTextField(
                    titleText: widget.argument.member.address,
                    controller:
                        _editEventScreenController.editEventAddressController,
                  ),
                  const SizedBox(height: 20),
                  CustomDetailTextField(
                    titleText: 'additionalInformationTitleText'.tr,
                    textEditingController: _editEventScreenController
                        .editEventAdditionalInformationController,
                    detailTextFieldTitle:
                        widget.argument.member.additionalInformation,
                  ),
                  const SizedBox(height: 100),
                  CustomButton(
                    title: 'saveButtonTitleText'.tr,
                    onCustomButtonTap: () {
                      _editEventScreenController
                          .editEvent(editEventId: widget.argument.member.id)
                          .then((value) => Get.back());
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    _editEventScreenController.editEventAdditionalInformationController.clear();
    _editEventScreenController.editEventAddressController.clear();
    _editEventScreenController.editEventCityController.clear();
    _editEventScreenController.editEventEndTimeController.clear();
    _editEventScreenController.editEventStartTimeController.clear();
    _editEventScreenController.editEventDateController.clear();
    _editEventScreenController.editEventDescriptionController.clear();
    _editEventScreenController.editEventNameController.clear();
    _editEventScreenController.editImageNameController.clear();
    // TODO: implement initState
    super.initState();
  }
}
