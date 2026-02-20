import 'package:carely_caregiver/constant/app_colors.dart';
import 'package:core_kit/core_kit.dart';
import 'package:flutter/material.dart';

class AppPrimaryText extends StatelessWidget {
  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  const AppPrimaryText({
    super.key,
    required this.text,
    this.fontSize,
    this.fontWeight,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return CommonText(
      text: text,
      isDescription: true,
      fontSize: fontSize ?? 28,
      fontWeight: fontWeight ?? FontWeight.w700,
      textColor: color??AppColors.instance.textPrimary,
    );
  }
}

class AppSecondaryText extends StatelessWidget {
  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  const AppSecondaryText({
    super.key,
    required this.text,
    this.fontSize,
    this.fontWeight,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return CommonText(
      isDescription: true,
      text: text,
      fontSize: fontSize ?? 18,
      fontWeight: fontWeight ?? FontWeight.w400,
      textColor:color?? AppColors.instance.secondaryText,
    );
  }
}

class AppContentHeader extends StatelessWidget {
  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  const AppContentHeader({
    super.key,
    required this.text,
    this.fontSize,
    this.fontWeight,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return CommonText(
      text: text,
      fontSize: fontSize ?? 18,
      fontWeight: fontWeight ?? FontWeight.w700,
      textColor:color?? AppColors.instance.textPrimary,
    );
  }
}
