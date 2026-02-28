import 'package:get/get.dart';

// ── Models ─────────────────────────────────────────────
class WeeklyBarData {
  final String day;
  final double value;
  final bool isToday;
  const WeeklyBarData({
    required this.day,
    required this.value,
    this.isToday = false,
  });
}

class TodayScheduleItem {
  final String startTime;
  final String clientName;
  final String address;
  final List<String> tags;
  const TodayScheduleItem({
    required this.startTime,
    required this.clientName,
    required this.address,
    required this.tags,
  });
}

// ── Controller ─────────────────────────────────────────
class CareGiverHomeController extends GetxController {
  // User info
  final String userName = 'Sarah Jenkins';
  final String userAvatarUrl =
      'https://media.istockphoto.com/id/1468678624/photo/nurse-hospital-employee-and-portrait-of-black-man-in-a-healthcare-wellness-and-clinic-feeling.jpg?s=612x612&w=0&k=20&c=AGQPyeEitUPVm3ud_h5_yVX4NKY9mVyXbFf50ZIEtQI=';
  void onNotificationTap() {}
  void onSeeAllSchedule() {}

  // Weekly earnings
  final RxDouble totalWeeklyEarnings = 1248.50.obs;
  final RxList<WeeklyBarData> weeklyBars = <WeeklyBarData>[].obs;

  // Today's schedule
  final RxList<TodayScheduleItem> todaySchedule = <TodayScheduleItem>[].obs;

  @override
  void onInit() {
    super.onInit();
    _loadWeeklyData();
    _loadSchedule();
  }

  void _loadWeeklyData() {
    weeklyBars.assignAll([
      const WeeklyBarData(day: 'Mon', value: 0.45),
      const WeeklyBarData(day: 'Tue', value: 0.55),
      const WeeklyBarData(day: 'Wed', value: 0.35),
      const WeeklyBarData(day: 'Thu', value: 0.60),
      const WeeklyBarData(day: 'Fri', value: 0.50),
      const WeeklyBarData(day: 'Sat', value: 0.65),
      const WeeklyBarData(day: 'Sun', value: 0.90, isToday: true),
    ]);
  }

  void _loadSchedule() {
    todaySchedule.assignAll([
      const TodayScheduleItem(
        startTime: '14:00',
        clientName: 'David Chen',
        address: '456 Oak Avenue, Apt 4B',
        tags: ['Rehab', 'Vital Signs'],
      ),
      const TodayScheduleItem(
        startTime: '14:00',
        clientName: 'Emily Watson',
        address: '122 Maple Street, Suite 2',
        tags: ['Meal Prep', 'Mobility Support'],
      ),
      const TodayScheduleItem(
        startTime: '17:00',
        clientName: 'James Miller',
        address: '89 Pine Road, Apt 7C',
        tags: ['Dementia Care', 'Vital Signs'],
      ),
    ]);
  }
}
