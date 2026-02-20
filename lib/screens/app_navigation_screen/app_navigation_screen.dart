import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app_all_enum/app_login_status.dart';
import 'controller/app_navigation_screen_controller.dart';

class AppNavigationScreen extends StatelessWidget {
  const AppNavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: AppNavigationScreenController(),
      builder: (controller) {
        return Scaffold(
          extendBody: true,
          body: IndexedStack(index: controller.selectedIndex.value, children: selectedAppUserType == AppUserType.user ? [] : []),

          bottomNavigationBar: BottomNavigationBar(onTap: controller.changeIndex, items: selectedAppUserType == AppUserType.user ? [] : []),
        );
      },
    );
  }
}
