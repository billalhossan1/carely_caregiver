import 'package:carely_caregiver/constant/app_colors.dart';
import 'package:carely_caregiver/routes/app_routes.dart';
import 'package:carely_caregiver/screens/client_screen/find_caregiver_screen/controller/find_caregiver_controller.dart';
import 'package:carely_caregiver/widgets/default_background_template.dart';
import 'package:carely_caregiver/widgets/home_widgets.dart';
import 'package:carely_caregiver/widgets/text/primary_text.dart';
import 'package:core_kit/core_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FindCaregiverScreen extends StatelessWidget {
  const FindCaregiverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<FindCaregiverController>();

    return DefaultBackgroundTemplate(
      appBarTitle: 'Find Caregivers',
      hideBackButton: true,
      actions: [
        AppIconButton(icon: Icons.tune_rounded, onTap: controller.onFilterTap),
        const SizedBox(width: 12),
      ],
      child: Obx(() {
        final caregivers = controller.filteredCaregivers;

        // ── Header (search + filters + count) ──
        final header = Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              HomeSearchBar(onChanged: controller.onSearchChanged),
              16.height,
              _CaregiverFilterRow(
                categories: controller.filterCategories,
                selected: controller.selectedFilter.value,
                onSelected: controller.onFilterSelected,
              ),
              20.height,
              AppPrimaryText(
                text: '${caregivers.length} caregivers nearby',
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
              12.height,
            ],
          ),
        );

        if (caregivers.isEmpty) {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [header, _EmptyState()],
            ),
          );
        }
        return SmartListLoader(
          // ── SmartListLoader (handles vertical scroll)
          itemCount: caregivers.length,
          appbar: header,
          onColapsAppbar: Container(
            padding: EdgeInsets.symmetric(vertical: 12),
            decoration: BoxDecoration(
              color: AppColors.instance.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withAlpha(8),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: _CaregiverFilterRow(
              categories: controller.filterCategories,
              selected: controller.selectedFilter.value,
              onSelected: controller.onFilterSelected,
            ),
          ),
          padding: EdgeInsets.zero,
          itemBuilder: (_, index) => Padding(
            padding: EdgeInsets.only(
              bottom: index < caregivers.length - 1 ? 12 : 0,
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0,right: 10),
              child: CaregiverCard(
                caregiver: caregivers[index],
              ),
            ),
          ),
        );
      }),
    );
  }
}

// ═══════════════════════════════════════════════════════
//  Filter Chip Row
// ═══════════════════════════════════════════════════════
class _CaregiverFilterRow extends StatelessWidget {
  final List<String> categories;
  final String selected;
  final ValueChanged<String> onSelected;

  const _CaregiverFilterRow({
    required this.categories,
    required this.selected,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: categories
            .map(
              (cat) => Padding(
                padding: const EdgeInsets.only(right: 8),
                child: _FilterChip(
                  label: cat,
                  isSelected: cat == selected,
                  onTap: () => onSelected(cat),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}

class _FilterChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _FilterChip({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colors = AppColors.instance;
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 9),
        decoration: BoxDecoration(
          color: isSelected ? colors.primary : colors.white,
          borderRadius: BorderRadius.circular(50),
          border: Border.all(
            color: isSelected ? colors.primary : colors.border,
          ),
        ),
        child: CommonText(
          text: label,
          fontSize: 13,
          fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
          textColor: isSelected ? colors.white : colors.textPrimary,
          isDescription: true,
          preventScaling: true,
        ),
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════
//  Caregiver Card
// ═══════════════════════════════════════════════════════
class CaregiverCard extends StatelessWidget {
  final CaregiverModel caregiver;

  const CaregiverCard({super.key, required this.caregiver,});

  @override
  Widget build(BuildContext context) {
    final colors = AppColors.instance;
    return GestureDetector(
      onTap: (){
        Get.toNamed(AppRoutes.instance.careGiverDetailsScreen);
      },
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: colors.white,
          borderRadius: BorderRadius.circular(16),
          // boxShadow: [
          //   BoxShadow(
          //     color: Colors.black.withAlpha(8),
          //     blurRadius: 8,
          //     offset: const Offset(0, 2),
          //   ),
          // ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Top Row: Avatar + Info + Rating ──
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Avatar
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: caregiver.avatarUrl.isNotEmpty
                      ? CommonImage(
                          src:caregiver.avatarUrl,
                          width: 72,
                          height: 90,
                          fill: BoxFit.cover,
                        )
                      : Container(
                          width: 72,
                          height: 90,
                          color: colors.boxBg,
                          child: Icon(
                            Icons.person,
                            color: colors.primary,
                            size: 36,
                          ),
                        ),
                ),
                const SizedBox(width: 12),

                // Name + specialty + description
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Name
                          Expanded(
                            child: CommonText(
                              text: '${caregiver.name}, ${caregiver.role}',
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              textColor: colors.textPrimary,
                              textAlign: TextAlign.start,
                              isDescription: true,
                              preventScaling: true,
                            ),
                          ),
                          const SizedBox(width: 6),
                          // Rating badge
                          _RatingBadge(rating: caregiver.rating),
                        ],
                      ),
                      const SizedBox(height: 4),
                      // Specialty
                      CommonText(
                        text: caregiver.specialty,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        textColor: colors.secondaryColor,
                        textAlign: TextAlign.start,
                        isDescription: true,
                        preventScaling: true,
                      ),
                      const SizedBox(height: 4),
                      // Description
                      CommonText(
                        text: caregiver.description,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        textColor: colors.secondaryText,
                        textAlign: TextAlign.start,
                        isDescription: true,
                        preventScaling: true,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            24.height,

            // const Padding(
            //   padding: EdgeInsets.symmetric(vertical: 12),
            //   child: Divider(height: 1),
            // ),

            // ── Bottom Row: Price + Book Now ──
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Price
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonText(
                      text: 'Starting at',
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      textColor: colors.secondaryText,
                      isDescription: true,
                      preventScaling: true,
                    ),
                    const SizedBox(height: 2),
                    CommonText(
                      text: '\$${caregiver.hourlyRate.toStringAsFixed(0)}/hr',
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      textColor: colors.primary,
                      isDescription: true,
                      preventScaling: true,
                    ),
                  ],
                ),
                const Spacer(),
                // Book Now
                CommonButton(
                  buttonWidth: 116.w,
                  titleText: 'Book Now',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ── Rating Badge ──────────────────────────────────────
class _RatingBadge extends StatelessWidget {
  final double rating;
  const _RatingBadge({required this.rating});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.star_rounded, size: 14, color: AppColors.instance.start),
        const SizedBox(width: 3),
        CommonText(
          text: rating.toStringAsFixed(1),
          fontSize: 13,
          fontWeight: FontWeight.w600,
          textColor: AppColors.instance.textPrimary,
          isDescription: true,
          preventScaling: true,
        ),
      ],
    );
  }
}

// ── Empty State ───────────────────────────────────────
class _EmptyState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 48),
      child: Center(
        child: Column(
          children: [
            Icon(
              Icons.search_off_rounded,
              size: 56,
              color: AppColors.instance.border,
            ),
            const SizedBox(height: 12),
            CommonText(
              text: 'No caregivers found',
              fontSize: 16,
              fontWeight: FontWeight.w600,
              textColor: AppColors.instance.secondaryText,
              isDescription: true,
              preventScaling: true,
            ),
            const SizedBox(height: 4),
            CommonText(
              text: 'Try a different search or filter',
              fontSize: 13,
              fontWeight: FontWeight.w400,
              textColor: AppColors.instance.textGrey,
              isDescription: true,
              preventScaling: true,
            ),
          ],
        ),
      ),
    );
  }
}
