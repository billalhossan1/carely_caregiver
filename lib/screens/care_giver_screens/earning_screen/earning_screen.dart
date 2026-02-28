import 'package:carely_caregiver/screens/care_giver_screens/earning_screen/controller/earning_screen_controller.dart';
import 'package:carely_caregiver/screens/care_giver_screens/earning_screen/earning_widgets.dart';
import 'package:carely_caregiver/widgets/default_background_template.dart';
import 'package:carely_caregiver/widgets/home_widgets.dart';
import 'package:carely_caregiver/widgets/weekly_earnings_card.dart';
import 'package:core_kit/core_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EarningScreen extends StatelessWidget {
  const EarningScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Get.find<EarningScreenController>();

    return DefaultBackgroundTemplate(
      appBarTitle: 'Wallet & Earnings',
      hideBackButton: true,
      actions: [
        AppIconButton(
          icon: Icons.notifications_outlined,
          hasBadge: true,
        ),
        10.width,
      ],
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 20, 16, 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Weekly Earnings Card ─────────────────────
            Obx(
              () => WeeklyEarningsCard(
                totalEarnings: c.totalWeeklyEarnings.value,
                bars: c.weeklyBars.toList(),
              ),
            ),
            20.height,

            // ── Pending + Payout Row ─────────────────────
            Obx(
              () => EarningsSummaryRow(
                pendingEarnings: c.pendingEarnings.value,
                payoutMethod: c.payoutMethod,
              ),
            ),
            28.height,

            // ── Recent Transactions ──────────────────────
            HomeSectionHeader(
              title: 'Recent Transactions',
              actionLabel: 'See All',
              onActionTap: () {},
            ),
            16.height,

            ...c.transactions.map((t) => TransactionItem(transaction: t)),
          ],
        ),
      ),
    );
  }
}
