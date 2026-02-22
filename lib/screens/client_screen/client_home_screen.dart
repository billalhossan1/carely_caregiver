import 'package:carely_caregiver/constant/app_colors.dart';
import 'package:carely_caregiver/screens/client_screen/controller/client_home_controller.dart';
import 'package:carely_caregiver/widgets/home_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ClientHomeScreen extends StatelessWidget {
  const ClientHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ClientHomeController>();

    return Scaffold(
      backgroundColor: AppColors.instance.screenBg,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ── Header ──
              HomeHeaderWidget(
                userName: controller.userName,
                avatarUrl: controller.userAvatarUrl,
                onFilterTap: controller.onFilterTap,
                onNotificationTap: controller.onNotificationTap,
              ),
              const SizedBox(height: 16),

              // ── Search Bar ──
              HomeSearchBar(onChanged: controller.onSearchChanged),
              const SizedBox(height: 20),

              // ── Hero Banner ──
              HomeBannerCard(onButtonTap: controller.onLearnMore),
              const SizedBox(height: 24),

              // ── Upcoming Booking ──
              HomeSectionHeader(
                title: 'Upcoming Booking',
                onActionTap: controller.onSeeAllBookings,
              ),
              const SizedBox(height: 12),
              Obx(
                () => UpcomingBookingCard(
                  booking: controller.upcomingBooking.value,
                  onViewDetails: controller.onViewDetails,
                  onChat: () {},
                ),
              ),
              const SizedBox(height: 24),

              // ── Recent Activity ──
              HomeSectionHeader(title: 'Recent Activity', actionLabel: null),
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.instance.white,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: AppColors.instance.border),
                ),
                child: Obx(
                  () => Column(
                    children: controller.recentActivities
                        .map(
                          (activity) => ActivityItemWidget(activity: activity),
                        )
                        .toList(),
                  ),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
