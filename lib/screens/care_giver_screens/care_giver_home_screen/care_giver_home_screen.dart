import 'package:carely_caregiver/routes/app_routes.dart';
import 'package:carely_caregiver/screens/care_giver_screens/care_giver_home_screen/controller/care_giver_home_controller.dart';
import 'package:carely_caregiver/widgets/default_background_template.dart';
import 'package:carely_caregiver/widgets/home_widgets.dart';
import 'package:carely_caregiver/widgets/schedule_item_widget.dart';
import 'package:carely_caregiver/widgets/weekly_earnings_card.dart';
import 'package:core_kit/core_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constant/app_colors.dart';

class CareGiverHomeScreen extends StatelessWidget {
  const CareGiverHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Get.find<CareGiverHomeController>();

    return DefaultBackgroundTemplate(
      titleWidget: Row(
        children: [
        // Avatar
        CircleAvatar(
        radius: 22,
        backgroundColor: AppColors.instance.boxBg,
        backgroundImage: c.userAvatarUrl.isNotEmpty
            ? NetworkImage(c.userAvatarUrl)
            : null,
        child: c.userAvatarUrl.isEmpty
            ? Icon(Icons.person, color: AppColors.instance.primary, size: 24)
            : null,
      ),
          10.width,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonText(
                  text: 'Welcome back!',
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  textColor: AppColors.instance.secondaryText,
                  textAlign: TextAlign.start,
                  isDescription: true,
                  preventScaling: true,
                ),
                CommonText(
                  text: 'Sarah Jenkins',
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  textColor: AppColors.instance.textPrimary,
                  textAlign: TextAlign.start,
                  isDescription: true,
                  preventScaling: true,
                ),
              ],
            ),
          ),
          // AppIconButton(icon: Icons.tune_rounded, onTap: (){}),
          // const SizedBox(width: 8),

          // Notification icon

        ]
    ),
      actions: [
        AppIconButton(
          icon: Icons.notifications_outlined,
          hasBadge: true,
        ),
        10.width,
      ],

      hideBackButton: true,
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Header ──────────────────────────────────
            // HomeHeaderWidget(
            //   showFilter: false,
            //   userName: c.userName,
            //   avatarUrl: c.userAvatarUrl,
            //   onNotificationTap: c.onNotificationTap,
            // ),
            // const SizedBox(height: 20),

            // ── Weekly Earnings Card ─────────────────────
            Obx(
              () => WeeklyEarningsCard(
                totalEarnings: c.totalWeeklyEarnings.value,
                bars: c.weeklyBars.toList(),
              ),
            ),
            const SizedBox(height: 28),

            // ── Today's Schedule Header ──────────────────
            _ScheduleSectionHeader(onSeeAll: c.onSeeAllSchedule),
            const SizedBox(height: 12),

            // ── Schedule List ────────────────────────────
            Obx(
              () => ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: c.todaySchedule.length,
                itemBuilder: (_, i) =>
                    ScheduleItemWidget(item: c.todaySchedule[i]),
              ),
            ),

            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

// ── Section header ────────────────────────────────────────
class _ScheduleSectionHeader extends StatelessWidget {
  final VoidCallback? onSeeAll;
  const _ScheduleSectionHeader({this.onSeeAll});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        HomeSectionHeader(title: "Today's Schedule", actionLabel: null),
        GestureDetector(
          onTap: onSeeAll,
          child: Text(
            'See All',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: AppColors.instance.primary,
            ),
          ),
        ),
      ],
    );
  }
}
