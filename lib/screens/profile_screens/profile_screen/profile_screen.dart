import 'package:carely_caregiver/constant/app_colors.dart';
import 'package:carely_caregiver/screens/profile_screens/profile_screen/controller/profile_screen_controller.dart';
import 'package:carely_caregiver/widgets/default_background_template.dart';
import 'package:core_kit/core_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ProfileScreenController controller =
        Get.find<ProfileScreenController>();
    final colors = AppColors.instance;

    return DefaultBackgroundTemplate(
      appBarTitle: 'Profile',
      hideBackButton: true,
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Avatar + Name ──
            _ProfileHeader(controller: controller, colors: colors),
            32.height,

            // ── Account group ──
            _SectionLabel(label: 'Account', colors: colors),
            8.height,
            _MenuGroup(items: controller.accountItems, colors: colors),
            24.height,

            // ── Settings group ──
            _SectionLabel(label: 'Settings', colors: colors),
            8.height,
            _MenuGroup(items: controller.settingsItems, colors: colors),
            32.height,

            // ── Logout ──
            _LogoutButton(colors: colors, onTap: controller.logout),
          ],
        ),
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════
//  Profile Header
// ═══════════════════════════════════════════════════════
class _ProfileHeader extends StatelessWidget {
  final ProfileScreenController controller;
  final AppColors colors;
  const _ProfileHeader({required this.controller, required this.colors});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Center(
        child: Column(
          children: [
            // Avatar
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: colors.border, width: 3),
              ),
              child: ClipOval(
                child: CommonImage(
                  src: controller.avatarUrl.value,
                  fill: BoxFit.cover,
                ),
              ),
            ),
            16.height,
            CommonText(
              text: controller.name.value,
              fontSize: 22,
              fontWeight: FontWeight.w700,
              textColor: colors.textPrimary,
            ),
            4.height,
            CommonText(
              text: controller.memberSince.value,
              fontSize: 14,
              fontWeight: FontWeight.w400,
              textColor: colors.secondaryText,
              isDescription: true,
            ),
          ],
        ),
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════
//  Section Label
// ═══════════════════════════════════════════════════════
class _SectionLabel extends StatelessWidget {
  final String label;
  final AppColors colors;
  const _SectionLabel({required this.label, required this.colors});

  @override
  Widget build(BuildContext context) {
    return CommonText(
      text: label,
      fontSize: 16,
      fontWeight: FontWeight.w600,
      textColor: colors.secondaryText,
      isDescription: true,
    );
  }
}

// ═══════════════════════════════════════════════════════
//  Menu Group Card
// ═══════════════════════════════════════════════════════
class _MenuGroup extends StatelessWidget {
  final List<ProfileMenuItem> items;
  final AppColors colors;
  const _MenuGroup({required this.items, required this.colors});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: List.generate(items.length, (i) {
          final item = items[i];
          final isLast = i == items.length - 1;
          return Column(
            children: [
              _MenuTile(item: item, colors: colors),
              if (!isLast) Divider(height: 1, indent: 56, color: colors.border),
            ],
          );
        }),
      ),
    );
  }
}

// ── Single menu tile ─────────────────────────────────────
class _MenuTile extends StatelessWidget {
  final ProfileMenuItem item;
  final AppColors colors;
  const _MenuTile({required this.item, required this.colors});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: item.onTap,
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: colors.secondaryColor.withAlpha(50),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(item.icon, size: 20, color: colors.secondaryColor),
            ),
            14.width,
            Expanded(
              child: CommonText(
                text: item.title,
                fontSize: 15,
                fontWeight: FontWeight.w500,
                textColor: colors.textPrimary,
                isDescription: true,
              ),
            ),
            Icon(
              Icons.chevron_right_rounded,
              size: 20,
              color: colors.secondaryText,
            ),
          ],
        ),
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════
//  Logout Button
// ═══════════════════════════════════════════════════════
class _LogoutButton extends StatelessWidget {
  final AppColors colors;
  final VoidCallback onTap;
  const _LogoutButton({required this.colors, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          color: colors.error.withAlpha(15),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: colors.error.withAlpha(40)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.logout_rounded, size: 18, color: colors.error),
            8.width,
            CommonText(
              text: 'Log Out',
              fontSize: 15,
              fontWeight: FontWeight.w600,
              textColor: colors.error,
              isDescription: true,
              preventScaling: true,
            ),
          ],
        ),
      ),
    );
  }
}
