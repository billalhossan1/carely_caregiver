import 'package:carely_caregiver/constant/app_colors.dart';
import 'package:carely_caregiver/screens/client_screen/book_caregiver_screen/book_caregiver_screen.dart';
import 'package:carely_caregiver/screens/client_screen/book_caregiver_screen/controller/book_caregiver_controller.dart';
import 'package:carely_caregiver/screens/client_screen/review_booking_screen/review_booking_widgets.dart';
import 'package:carely_caregiver/widgets/default_background_template.dart';
import 'package:carely_caregiver/widgets/text/primary_text.dart';
import 'package:core_kit/core_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../gen/assets.gen.dart';

class ReviewBookingScreen extends StatelessWidget {
  const ReviewBookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final BookCaregiverController controller =
        Get.find<BookCaregiverController>();
    final colors = AppColors.instance;

    return DefaultBackgroundTemplate(
      appBarTitle: 'Review Booking',
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ── Caregiver header ──
                  CaregiverInfoCard(colors: colors, isHoursShow: false),
                  20.height,

                  // ── Booking Details ──
                  AppContentHeader(text: 'Booking Details', fontSize: 20,fontWeight: FontWeight.w500,),
                  12.height,
                  BookingDetailRow(
                    icon: Assets.icons.medicale,
                    label: 'SERVICE',
                    value: 'Companion Care',
                    colors: colors,
                  ),
                  8.height,
                  Obx(
                    () => BookingDetailRow(
                      icon: Assets.icons.calender,
                      label: 'DATE & TIME',
                      value: controller.selectedScheduleText,
                      colors: colors,
                    ),
                  ),
                  20.height,

                  // ── Estimated Cost ──
                  EstimatedCostCard(colors: colors),
                  20.height,

                  // ── Additional Instructions ──
                  AppContentHeader(
                    text: 'Additional Instructions',
                    fontSize: 20,
                  ),
                  12.height,
                  _InstructionsField(colors: colors),
                  20.height,
                ],
              ),
            ),
          ),
          
          // ── Bottom CTA ──
          _BottomBar(colors: colors, onTap: controller.confirmSchedule),
        ],
      ),
    );
  }
}

// ── Instructions text field ──────────────────────────────
class _InstructionsField extends StatelessWidget {
  final AppColors colors;
  const _InstructionsField({required this.colors});

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: 4,
      style: TextStyle(fontSize: 14, color: colors.textPrimary),
      decoration: InputDecoration(
        hintText:
            'e.g., Please enter through the side door, the doorbell is loud ...',
        hintStyle: TextStyle(fontSize: 13, color: colors.hintText),
        filled: true,
        fillColor: colors.white,
        contentPadding: const EdgeInsets.all(16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: colors.border),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: colors.border),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: colors.primary, width: 1.5),
        ),
      ),
    );
  }
}

// ── Bottom bar ───────────────────────────────────────────
class _BottomBar extends StatelessWidget {
  final AppColors colors;
  final VoidCallback onTap;
  const _BottomBar({required this.colors, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
      decoration: BoxDecoration(
        color: colors.white,
        border: Border(top: BorderSide(color: colors.border)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CommonButton(
            titleText: 'Send Booking Request',
            onTap: onTap,
            buttonWidth: double.infinity,
          ),
          10.height,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.lock_outline, size: 12, color: colors.secondaryText),
              4.width,
              CommonText(
                text: 'SECURE SSL ENCRYPTED TRANSACTION',
                fontSize: 10,
                fontWeight: FontWeight.w500,
                textColor: colors.secondaryText,
                isDescription: true,
                preventScaling: true,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
