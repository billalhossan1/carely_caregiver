import 'package:carely_caregiver/constant/app_colors.dart';
import 'package:core_kit/app_bar/common_app_bar.dart';
import 'package:flutter/material.dart';

class DefaultBackgroundTemplate extends StatelessWidget {
  final Widget child;
  final bool? hideBackButton;
  final Color? appBarBackgroundColor;
  final Color? bodyBackgroundColor;
  final String? appBarTitle;
  final VoidCallback? onBackPress;
  final List<Widget>? actions;
  const DefaultBackgroundTemplate({super.key, required this.child, this.hideBackButton, this.appBarBackgroundColor, this.appBarTitle, this.actions, this.onBackPress, this.bodyBackgroundColor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bodyBackgroundColor??AppColors.instance.screenBg,
      appBar: CommonAppBar(
        isCenterTitle: false,
        hideBack: hideBackButton??false,
        backgroundColor: appBarBackgroundColor,
        title: appBarTitle,
        actions: actions,onBackPress: onBackPress,
      ),
      body: SafeArea(child: child),
    );
  }
}
