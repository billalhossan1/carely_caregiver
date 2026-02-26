import 'package:carely_caregiver/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ── Menu Item Model ──────────────────────────────────────
class ProfileMenuItem {
  final IconData icon;
  final String title;
  final VoidCallback? onTap;

  const ProfileMenuItem({required this.icon, required this.title, this.onTap});
}

// ── Controller ───────────────────────────────────────────
class ProfileScreenController extends GetxController {
  // ── User info (wire to your auth/user service later) ──
  final RxString name = 'Sarah Henderson'.obs;
  final RxString avatarUrl =
      'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=400'.obs;
  final RxString memberSince = 'Member since January 2023'.obs;

  // ── Account menu ──
  late final List<ProfileMenuItem> accountItems = [
    ProfileMenuItem(
      icon: Icons.person_outline_rounded,
      title: 'Personal Information',
      onTap: _onPersonalInfo,
    ),
    ProfileMenuItem(
      icon: Icons.favorite_border_rounded,
      title: 'Care Recipients',
      onTap: _onCareRecipients,
    ),
  ];

  // ── Settings menu ──
  late final List<ProfileMenuItem> settingsItems = [
    ProfileMenuItem(
      icon: Icons.notifications_none_rounded,
      title: 'Notifications',
      onTap: _onNotifications,
    ),
    ProfileMenuItem(
      icon: Icons.lock_outline_rounded,
      title: 'Privacy Policy',
      onTap: _onPrivacyPolicy,
    ),
    ProfileMenuItem(
      icon: Icons.description_outlined,
      title: 'Terms of Service',
      onTap: _onTermsOfService,
    ),
  ];

  void _onPersonalInfo() {
    // TODO: navigate to personal info screen
  }

  void _onCareRecipients() {
    // TODO: navigate to care recipients screen
  }

  void _onNotifications() {
    // TODO: navigate to notifications settings
  }

  void _onPrivacyPolicy() {
    // TODO: open privacy policy
  }

  void _onTermsOfService() {
    // TODO: open terms of service
  }

  void logout() {
    Get.offAllNamed(AppRoutes.instance.loginScreen);
  }
}
