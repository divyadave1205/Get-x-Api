import 'package:flutter/material.dart';
import 'package:mbo_admin_pannel/utilities/color_utilities.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  Function() onCustomButtonTap;
  final String title;
  final Color color;
  final Color textColor;
  CustomButton(
      {Key? key,
      required this.onCustomButtonTap,
      required this.title,
      this.color = ColorUtilities.blueColor,
      this.textColor = Colors.white})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onCustomButtonTap,
      child: Container(
        height: 50,
        margin: const EdgeInsets.symmetric(vertical: 20),
        decoration:
            BoxDecoration(color: color, borderRadius: BorderRadius.circular(7)),
        child: Center(
            child: Text(
          title,
          style: TextStyle(
            color: textColor,
            fontSize: 20,
          ),
        )),
      ),
    );
  }
}
