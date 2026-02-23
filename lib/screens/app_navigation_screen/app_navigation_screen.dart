import 'package:carely_caregiver/screens/app_navigation_screen/widget/custom_nav_bar.dart';
import 'package:carely_caregiver/screens/client_screen/care_giver_details_screen/care_giver_details_screen.dart';
import 'package:carely_caregiver/screens/client_screen/client_home_screen.dart';
import 'package:carely_caregiver/screens/client_screen/find_caregiver_screen/find_caregiver_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../app_all_enum/app_login_status.dart';
import 'controller/app_navigation_screen_controller.dart';

class AppNavigationScreen extends StatelessWidget {
  const AppNavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppNavigationScreenController>(
      init: AppNavigationScreenController(),
      builder: (controller) {
        final screens = selectedAppUserType == AppUserType.client
            ? _getClientScreens()
            : _getCareGiverScreens();

        return Scaffold(
          body: IndexedStack(
            index: controller.selectedIndex,
            children: screens,
          ),
          bottomNavigationBar: CustomBottomNavBar(
            currentIndex: controller.selectedIndex,
            onTap: controller.changeIndex,
          ),
        );
      },
    );
  }

  List<Widget> _getCareGiverScreens() {
    // TODO: Add user screens here
    return [
      const ClientHomeScreen(),
      const FindCaregiverScreen(),
      const CareGiverDetailsScreen(),
      const ClientHomeScreen(),
      const ClientHomeScreen(),

    ];
  }

  List<Widget> _getClientScreens() {
    // TODO: Add business screens here
    return [
      const ClientHomeScreen(),
      const ClientHomeScreen(),
      const ClientHomeScreen(),
      const ClientHomeScreen(),
      const ClientHomeScreen(),

    ];
  }
}
