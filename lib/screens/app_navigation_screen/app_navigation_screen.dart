import 'package:carely_caregiver/screens/app_navigation_screen/widget/custom_nav_bar.dart';
import 'package:carely_caregiver/screens/care_giver_screens/booking_request_screen/booking_request_screen.dart';
import 'package:carely_caregiver/screens/chat_list_screen/chat_list_screen.dart';
import 'package:carely_caregiver/screens/client_screen/care_giver_details_screen/care_giver_details_screen.dart';
import 'package:carely_caregiver/screens/client_screen/client_home_screen.dart';
import 'package:carely_caregiver/screens/client_screen/find_caregiver_screen/find_caregiver_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../app_all_enum/app_login_status.dart';
import '../care_giver_screens/care_giver_home_screen/care_giver_home_screen.dart';
import '../client_screen/book_caregiver_screen/book_caregiver_screen.dart';
import '../client_screen/review_booking_screen/review_booking_screen.dart';
import '../client_screen/select_service_type_screen/select_service_type_screen.dart';
import '../profile_screens/profile_screen/profile_screen.dart';
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
          body: _AnimatedIndexedStack(
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
      const CareGiverHomeScreen(),
      const BookingRequestScreen(),
      const CareGiverDetailsScreen(),
      const ClientHomeScreen(),
      const ProfileScreen(),
    ];
  }

  List<Widget> _getClientScreens() {
    // TODO: Add business screens here
    return [
      const ClientHomeScreen(),
      const FindCaregiverScreen(),
      const SelectServiceTypeScreen(),
      const ChatListScreen(),
      // const ReviewBookingScreen(),
      const ProfileScreen(),
    ];
  }
}

// ─────────────────────────────────────────────────────────────────────────────
//  Animated Indexed Stack
//  • Keeps all screens alive (Offstage + TickerMode, same as IndexedStack)
//  • Fades + slides the incoming screen upward on index change
// ─────────────────────────────────────────────────────────────────────────────
class _AnimatedIndexedStack extends StatefulWidget {
  final int index;
  final List<Widget> children;

  const _AnimatedIndexedStack({required this.index, required this.children});

  @override
  State<_AnimatedIndexedStack> createState() => _AnimatedIndexedStackState();
}

class _AnimatedIndexedStackState extends State<_AnimatedIndexedStack>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fade;
  late Animation<Offset> _slide;
  late int _current;

  @override
  void initState() {
    super.initState();
    _current = widget.index;
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 280),
    );
    _fade = CurvedAnimation(parent: _controller, curve: Curves.easeOut);
    _slide = Tween<Offset>(
      begin: const Offset(0, 0.04),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
    _controller.forward();
  }

  @override
  void didUpdateWidget(_AnimatedIndexedStack old) {
    super.didUpdateWidget(old);
    if (old.index != widget.index) {
      setState(() => _current = widget.index);
      _controller.forward(from: 0);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: widget.children.asMap().entries.map((e) {
        final isActive = e.key == _current;
        return Offstage(
          offstage: !isActive,
          child: TickerMode(
            enabled: isActive,
            child: isActive
                ? FadeTransition(
                    opacity: _fade,
                    child: SlideTransition(position: _slide, child: e.value),
                  )
                : e.value,
          ),
        );
      }).toList(),
    );
  }
}
