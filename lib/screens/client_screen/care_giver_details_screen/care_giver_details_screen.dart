import 'package:carely_caregiver/constant/app_colors.dart';
import 'package:carely_caregiver/constant/app_constant.dart';
import 'package:carely_caregiver/widgets/default_background_template.dart';
import 'package:carely_caregiver/widgets/profile_avatar/profile_avatar.dart';
import 'package:core_kit/core_kit.dart';
import 'package:flutter/material.dart';

import '../../../gen/assets.gen.dart';

class CareGiverDetailsScreen extends StatelessWidget {
  const CareGiverDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultBackgroundTemplate(
      appBarTitle: 'Caregiver Profile',
      child: Column(
        crossAxisAlignment: .center,
        children: [
          ProfileAvatar(
            size: 160.w,
            imageUrl:
                "https://media.istockphoto.com/id/1468678624/photo/nurse-hospital-employee-and-portrait-of-black-man-in-a-healthcare-wellness-and-clinic-feeling.jpg?s=612x612&w=0&k=20&c=AGQPyeEitUPVm3ud_h5_yVX4NKY9mVyXbFf50ZIEtQI=",
            borderColor: AppColors.instance.secondaryColor,
            badgeIcon: Assets.icons.verify,
            badgeSize: 40.w,
          ),
          12.height,
          CommonText(
            text: 'Sarah Jenkins, RN',
            fontSize: 28,
            fontWeight: FontWeight.w700,
          ),
          8.height,
          Row(
            mainAxisAlignment: .center,
            children: [
              CommonImage(src: Assets.icons.starIcon, height: 20, width: 20),
              4.width,
              RichText(
                text: TextSpan(
                  text: '4.9 ',
                  style: TextStyle(
                    fontSize: 18.h,
                    fontWeight: FontWeight.w700,
                    color: AppColors.instance.primaryTextColor,
                    fontFamily: AppConstant.instance.font,
                  ),
                  children: [
                    TextSpan(
                      text: '(120 reviews)',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: AppColors.instance.subTextColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          8.height,
          Row(
            mainAxisAlignment: .center,
            children: [
              CommonImage(src: Assets.icons.location, height: 20, width: 20),
              4.width,
              CommonText(
                text: 'New York, NY',
                fontSize: 16,
                fontWeight: FontWeight.w500,
                textColor: AppColors.instance.subTextColor,
              ),
            ],
          ),
          24.height,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _caregiverCard(title: 'Jobs', value: '150+'),
              _caregiverCard(title: 'EXP.', value: '8 Yrs'),
              _caregiverCard(title: 'RESPONSE', value: '<10m'),
            ],
          ),
        ],
      ),
    );
  }

  Container _caregiverCard({required String title, required String value}) {
    return Container(
      height: 86.h,
      width: 112.w,
      decoration: BoxDecoration(
        color: AppColors.instance.boxBg,
        border: Border.all(color: AppColors.instance.secondaryColor, width: 2),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 26),
        child: Column(
          children: [
            CommonText(
              text: title,
              fontWeight: FontWeight.w500,
              fontSize: 16,
              textColor: AppColors.instance.secondaryText,
            ),
            10.height,
            CommonText(
              text: value,
              fontWeight: FontWeight.w700,
              fontSize: 24,
              textColor: AppColors.instance.primaryTextColor,
            ),
          ],
        ),
      ),
    );
  }
}
