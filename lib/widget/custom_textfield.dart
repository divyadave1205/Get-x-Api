import 'package:flutter/material.dart';
import 'package:mbo_admin_pannel/utilities/font_style_utilities.dart';

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  String titleText;
  TextEditingController controller;
  bool realOnlyKeyborad;
  Function()? onCustomTextFieldTap;
  CustomTextField(
      {Key? key,
      required this.titleText,
      this.onCustomTextFieldTap,
      this.realOnlyKeyborad = false,
      required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: SizedBox(
        height: 45,
        child: TextField(
          controller: controller,
          onTap: onCustomTextFieldTap,
          readOnly: realOnlyKeyborad,
          decoration: InputDecoration(
              fillColor: Colors.transparent,
              border: const UnderlineInputBorder(
                  borderSide: BorderSide(
                color: Color(0xFFDADADA),
              )),
              filled: true,
              contentPadding: const EdgeInsets.only(top: 10),
              hintStyle: FontStyleUtilities.h14(fontColor: Colors.black),
              hintText: titleText),
        ),
      ),
    );
  }
}
