import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mbo_admin_pannel/utilities/color_utilities.dart';
import 'package:mbo_admin_pannel/utilities/font_style_utilities.dart';

enum SnackType {
  error,
  warning,
  success,
}

showMySnackBar({
  required String title,
  required String message,
  SnackType type = SnackType.success,
}) {
  Get.showSnackbar(
    GetSnackBar(
      titleText: Text(
        title,
        style: FontStyleUtilities.h16(
          fontColor: ColorUtilities.whiteColor,
          fontWeight: FWT.bold,
        ),
      ),
      messageText: Text(
        message,
        style: FontStyleUtilities.h12(
          fontColor: ColorUtilities.whiteColor,
        ),
      ),
      duration: const Duration(
        seconds: 3,
      ),
      animationDuration: const Duration(
        milliseconds: 500,
      ),
      barBlur: 5,
      snackPosition: SnackPosition.TOP,
      //dismissDirection: SnackDismissDirection.HORIZONTAL,
      backgroundGradient: LinearGradient(
        colors: type == SnackType.success
            ? [
                ColorUtilities.greenChartColor,
                ColorUtilities.lightGreenChartColor,
              ]
            : type == SnackType.error
                ? [
                    ColorUtilities.redChartColor,
                    ColorUtilities.lightRedChartColor,
                  ]
                : [
                    ColorUtilities.orangeChartColor,
                    ColorUtilities.lightOrangeChartColor,
                  ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    ),
  );
}
