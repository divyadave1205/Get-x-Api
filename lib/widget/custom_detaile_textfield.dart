import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:mbo_admin_pannel/utilities/font_style_utilities.dart';

// ignore: must_be_immutable
class CustomDetailTextField extends StatelessWidget {
  String titleText;
  String? detailTextFieldTitle;
  TextEditingController textEditingController;
  CustomDetailTextField(
      {Key? key,
      required this.titleText,
      required this.textEditingController,
      this.detailTextFieldTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          titleText,
          style: FontStyleUtilities.h14(fontColor: Colors.black),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: TextField(
            controller: textEditingController,
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(top: 10),
                fillColor: Colors.transparent,
                border: const UnderlineInputBorder(
                    borderSide: BorderSide(
                  color: Color(0xFFDADADA),
                )),
                hintText: detailTextFieldTitle ?? "typingTitleText".tr),
          ),
        ),
      ],
    );
  }
}
