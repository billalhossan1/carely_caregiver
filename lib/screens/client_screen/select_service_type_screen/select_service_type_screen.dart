import 'package:carely_caregiver/screens/client_screen/select_service_type_screen/controller/selected_service_type_controller.dart';
import 'package:carely_caregiver/widgets/default_background_template.dart';
import 'package:core_kit/core_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constant/app_colors.dart';
import '../../../gen/assets.gen.dart';

class SelectServiceTypeScreen extends StatelessWidget {
  const SelectServiceTypeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SelectedServiceTypeController controller =
        Get.find<SelectedServiceTypeController>();
    return DefaultBackgroundTemplate(
      appBarTitle: 'Select Service Type',
      hideBackButton: true,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: .start,
            children: [
              CommonText(
                text: 'What type of care is needed?',
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
              8.height,
              CommonText(
                textAlign: .start,
                isDescription: true,
                text:
                    "Choose the service that best matches your loved one's requirements.",
                fontSize: 18,
                fontWeight: FontWeight.w500,
                textColor: AppColors.instance.primaryTextColor,
              ),
              10.height,
              Obx(
                () => Column(
                  children: List.generate(controller.serviceTypes.length, (index) {
                    final item = controller.serviceTypes[index];
                    final isSelected = controller.selectedIndex.value == index;
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0,),
                      child: _serviceTypeCard(
                        title: item.title,
                        description: item.description,
                        isSelected: isSelected,
                        onTap: () => controller.selectType(index),
                      ),
                    );
                  }),
                ),
              ),
              20.height,
              
              CommonButton(titleText: 'Continue', onTap: controller.onContinue, buttonWidth: double.infinity),
              10.height,
            ],
          ),
        ),
      ),
    );
  }

  Stack _serviceTypeCard({
    required String title,
    required String description,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return Stack(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: isSelected
                    ? AppColors.instance.primary
                    : AppColors.instance.transparent,
                width: 2,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  CommonImage(
                    src: Assets.icons.medicale,
                    height: 60,
                    width: 60,
                  ),
                  20.height,
                  CommonText(
                    text: title,
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  ),
                  4.height,
                  CommonText(
                    textAlign: .start,
                    text: description,
                    isDescription: true,
                    fontSize: 16,
                    textColor: AppColors.instance.secondaryText,
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: Radio(
            value: isSelected ? 1 : 0,
            groupValue: 1,
            onChanged: (_) => onTap(),
            activeColor: AppColors.instance.primary,
          ),
        ),
      ],
    );
  }
}
