import 'package:core_kit/core_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Custom Snackbar Function
void showCustomSnackbar({
   String? title,
  required String message,
  Color? backgroundColor,
  Color? titleColor,
  Color? messageColor,
  Widget? icon,
  Duration duration = const Duration(seconds: 3),
  SnackPosition position = SnackPosition.BOTTOM,
  bool isDismissible = true,
}) {
  Get.snackbar(
    title??'', // Title of Snackbar
    message, // Message of Snackbar
    backgroundColor: backgroundColor ?? Colors.black,
    titleText: CommonText(
     text:  title??'',

        textColor: titleColor ?? Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 16,
    ),
    messageText: CommonText(
     text:  message,
        textColor: messageColor ?? Colors.white70,
        fontSize: 14,
    ),
    icon: icon, // Optionally add an icon
    snackPosition: position,
    duration: duration,
    isDismissible: isDismissible,
    margin: const EdgeInsets.all(10),
    borderRadius: 10,
    animationDuration: const Duration(milliseconds: 300),
    forwardAnimationCurve: Curves.easeOut,
    reverseAnimationCurve: Curves.easeIn,
  );
}
