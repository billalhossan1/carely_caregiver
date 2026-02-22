import 'package:carely_caregiver/screens/client_screen/controller/client_home_controller.dart';
import 'package:carely_caregiver/screens/profile_screens/basic_info_screen/controller/basic_info_controller.dart';
import 'package:carely_caregiver/screens/profile_screens/profile_setup_screen/controller/profle_setup_screen_controller.dart';
import 'package:get/get.dart';
import '../../screens/about_us_screen/controller/about_us_screen_controller.dart';
import '../../screens/app_navigation_screen/controller/app_navigation_screen_controller.dart';
import '../../screens/privacy_policy_screen/controller/privacy_policy_screen_controller.dart';
import '../../screens/terms_and_conditions_screen/controller/terms_and_conditions_screen_controller.dart';

class NavigationScreenBinding extends Bindings {
  @override
  dependencies() {
    Get.lazyPut(() => AppNavigationScreenController());
    Get.lazyPut(() => TermsAndConditionsScreenController());
    Get.lazyPut(() => PrivacyPolicyScreenController());
    Get.lazyPut(() => AboutUsScreenController());
    Get.lazyPut(() => BasicInfoController());
    Get.lazyPut(() => ProfileSetupScreenController());
    Get.lazyPut(() => ClientHomeController());
  }
}
