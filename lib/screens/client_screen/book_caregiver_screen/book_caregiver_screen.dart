import 'package:carely_caregiver/constant/app_colors.dart';
import 'package:carely_caregiver/screens/client_screen/book_caregiver_screen/controller/book_caregiver_controller.dart';
import 'package:carely_caregiver/utils/error_log.dart';
import 'package:carely_caregiver/widgets/app_calendar.dart';
import 'package:carely_caregiver/widgets/default_background_template.dart';
import 'package:carely_caregiver/widgets/profile_avatar/profile_avatar.dart';
import 'package:core_kit/core_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../gen/assets.gen.dart';

class BookCaregiverScreen extends StatelessWidget {
  const BookCaregiverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final BookCaregiverController controller =
        Get.find<BookCaregiverController>();
    final colors = AppColors.instance;

    return DefaultBackgroundTemplate(
      appBarTitle: 'Book Caregiver',
      child: Column(
        children: [
          // ── Scrollable body ──────────────────────────────
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ── Caregiver info card ────────────────
                  CaregiverInfoCard(colors: colors),
                  20.height,

                  // ── Calendar ──────────────────────────
                  Obx((){
                    errorLog('test', "${controller.rebuild.value}");
                    return  AppCalendar(controller: controller);
                  }),
                  24.height,

                  // ── Select Time ───────────────────────
                  CommonText(
                    text: 'Select Time',
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    textColor: colors.textPrimary,
                  ),
                  16.height,

                  Obx(
                    () => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Morning
                        _TimeGroupLabel(
                          icon: '☀️',
                          label: 'MORNING',
                          colors: colors,
                        ),
                        12.height,
                        Wrap(
                          spacing: 10,
                          runSpacing: 10,
                          children: controller.morningSlots
                              .map(
                                (slot) => _TimeChip(
                                  slot: slot,
                                  isSelected: controller.isSlotSelected(slot),
                                  onTap: () => controller.selectSlot(slot),
                                  colors: colors,
                                ),
                              )
                              .toList(),
                        ),
                        20.height,

                        // Afternoon
                        _TimeGroupLabel(
                          icon: '🌤️',
                          label: 'AFTERNOON',
                          colors: colors,
                        ),
                        12.height,
                        Wrap(
                          spacing: 10,
                          runSpacing: 10,
                          children: controller.afternoonSlots
                              .map(
                                (slot) => _TimeChip(
                                  slot: slot,
                                  isSelected: controller.isSlotSelected(slot),
                                  onTap: () => controller.selectSlot(slot),
                                  colors: colors,
                                ),
                              )
                              .toList(),
                        ),
                      ],
                    ),
                  ),
                  24.height,
                ],
              ),
            ),
          ),

          // ── Bottom bar ─────────────────────────────────
          Container(
            padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
            decoration: BoxDecoration(
              color: colors.white,
              border: Border(top: BorderSide(color: colors.border, width: 1)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    CommonText(
                      text: 'Selected Schedule:  ',
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      textColor: colors.secondaryText,
                      isDescription: true,
                    ),
                    Obx(
                      () => CommonText(
                        text: controller.selectedScheduleText,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        textColor: colors.primary,
                        isDescription: true,
                      ),
                    ),
                  ],
                ),
                12.height,
                CommonButton(
                  titleText: 'Confirm Schedule',
                  onTap: controller.confirmSchedule,
                  buttonWidth: double.infinity,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════
//  Caregiver Info Card
// ═══════════════════════════════════════════════════════
class CaregiverInfoCard extends StatelessWidget {
  final AppColors colors;
  final bool isHoursShow;
  const CaregiverInfoCard({super.key, required this.colors,  this.isHoursShow = true});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          ProfileAvatar(
            size: 68,
            imageUrl:
                'https://thumbs.dreamstime.com/b/young-male-doctor-close-up-happy-looking-camera-56751540.jpg',
            borderColor: colors.secondaryColor,
            badgeIcon: Assets.icons.verify,
          ),
          16.width,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonText(
                  text: 'Sarah Jenkins, RN',
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  textColor: colors.textPrimary,
                ),
                4.height,
                CommonText(
                  text: 'Certified Pediatric Caregiver',
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  textColor: colors.secondaryColor,
                  isDescription: true,
                ),
                6.height,
                Row(
                  children: [
                    Icon(Icons.star_rounded, size: 16, color: colors.start),
                    4.width,
                    CommonText(
                      text: '4.9 (120 reviews)',
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      textColor: colors.textPrimary,
                      isDescription: true,
                      preventScaling: true,
                    ),
                  ],
                ),
              ],
            ),
          ),
         isHoursShow? Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              CommonText(
                text: '\$25/hr',
                fontSize: 20,
                fontWeight: FontWeight.w700,
                textColor: colors.primary,
              ),
              CommonText(
                text: 'per hour',
                fontSize: 12,
                fontWeight: FontWeight.w400,
                textColor: colors.secondaryText,
                isDescription: true,
                preventScaling: true,
              ),
            ],
          ):SizedBox(),
        ],
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════
//  Time Group Label
// ═══════════════════════════════════════════════════════
class _TimeGroupLabel extends StatelessWidget {
  final String icon;
  final String label;
  final AppColors colors;

  const _TimeGroupLabel({
    required this.icon,
    required this.label,
    required this.colors,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(icon, style: const TextStyle(fontSize: 18)),
        8.width,
        CommonText(
          text: label,
          fontSize: 13,
          fontWeight: FontWeight.w600,
          textColor: colors.secondaryText,
          isDescription: true,
          preventScaling: true,
        ),
      ],
    );
  }
}

// ═══════════════════════════════════════════════════════
//  Time Chip
// ═══════════════════════════════════════════════════════
class _TimeChip extends StatelessWidget {
  final TimeSlot slot;
  final bool isSelected;
  final VoidCallback onTap;
  final AppColors colors;

  const _TimeChip({
    required this.slot,
    required this.isSelected,
    required this.onTap,
    required this.colors,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? colors.primary.withAlpha(15) : colors.white,
          borderRadius: BorderRadius.circular(50),
          border: Border.all(
            color: isSelected ? colors.primary : colors.border,
            width: isSelected ? 1.5 : 1,
          ),
        ),
        child: CommonText(
          text: slot.label,
          fontSize: 14,
          fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
          textColor: isSelected ? colors.primary : colors.textPrimary,
          isDescription: true,
          preventScaling: true,
        ),
      ),
    );
  }
}
