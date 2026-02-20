import 'package:carely_caregiver/constant/app_colors.dart';
import 'package:carely_caregiver/widgets/phone_number_text_filed.dart';
import '../../../routes/app_routes.dart';
import 'entity/auth_entity.dart';
import 'package:carely_caregiver/widgets/default_background_template.dart';
import 'package:carely_caregiver/widgets/text/primary_text.dart';
import 'package:core_kit/core_kit.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:carely_caregiver/gen/assets.gen.dart';

import '../../../utils/app_size.dart';
import 'controller/login_screen_controller.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AppSize.size = MediaQuery.of(context).size;

    return GetBuilder<LoginScreenController>(
      init: LoginScreenController(),
      builder: (controller) {
        return DefaultBackgroundTemplate(
          hideBackButton: true,
          child: FormBuilder(
            entity: AuthEntity(),
            builder: (context, formKey, entity) {
              return Padding(
                padding: EdgeInsets.all(20.0),
                child: Center(
                  child: Column(
                    crossAxisAlignment: .start,
                    children: [
                      Obx(
                        () => Center(
                          child: Column(
                            children: [
                              CommonImage(
                                src: Assets.logo.appLogoPng.path,
                                height: 70,
                                width: 124,
                              ),
                              16.height,
                              AppPrimaryText(
                                text: controller.isSignInPage.value
                                    ? "Welcome Back!"
                                    : "Create Caregiver Account",
                              ),
                              8.height,
                              AppSecondaryText(
                                text: controller.isSignInPage.value
                                    ? "Access your dashboard and care plans."
                                    : "Join our community of healthcare professionals and start providing quality care.",
                              ),
                            ],
                          ),
                        ),
                      ),
                      38.height,
                      Column(
                        crossAxisAlignment: .start,
                        children: [
                          Obx(
                            () => controller.isSignInPage.value
                                ? SizedBox()
                                : Column(
                                    crossAxisAlignment: .start,
                                    children: [
                                      AppContentHeader(text: 'Full Name'),
                                      12.height,
                                      CommonTextField(
                                        validationType:
                                            ValidationType.validateEmail,
                                        hintText: 'Enter your Full Name',
                                      ),
                                      16.height,
                                    ],
                                  ),
                          ),

                          AppContentHeader(text: 'Email'),
                          12.height,
                          CommonTextField(
                            validationType: ValidationType.validateEmail,
                            hintText: 'Enter your email',
                          ),
                          16.height,
                          Obx(
                            () => controller.isSignInPage.value
                                ? SizedBox()
                                : Column(
                              crossAxisAlignment: .start,
                                    children: [
                                      AppContentHeader(text: 'Phone Number'),
                                      12.height,
                                      PhoneTextField(),
                                      16.height,
                                    ],
                                  ),
                          ),
                          AppContentHeader(text: 'Password'),
                          12.height,
                          CommonTextField(
                            validationType: ValidationType.validatePassword,
                            hintText: 'Enter your Password',
                          ),
                          8.height,
                        Obx(()=>  controller.isSignInPage.value?Align(
                          alignment: Alignment.centerRight,
                          child: CommonText(
                            text: 'Forgot Password?',
                            textColor: AppColors.instance.error,
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ):SizedBox(),),
                          32.height,
                          Obx(()=>CommonButton(
                            titleText: controller.isSignInPage.value?'Login':'Continue',
                            buttonWidth: double.infinity,
                          ),),
                          Obx(
                            () => controller.isSignInPage.value
                                ? _googleSignIn()
                                : SizedBox(),
                          ),
                          48.height,
                          Obx(
                            () => Align(
                              alignment: Alignment.center,
                              child: RichText(
                                text: TextSpan(
                                  text: controller.isSignInPage.value
                                      ? "Don't have an account?"
                                      : "Already have an account?",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: AppColors.instance.textPrimary,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: controller.isSignInPage.value
                                          ? ' Sign Up'
                                          : ' Login',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: AppColors.instance.primary,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          controller.isSignInPage.value =
                                              !controller.isSignInPage.value;
                                        },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }

  Column _googleSignIn() {
    return Column(
      children: [
        32.height,
        Row(
          children: [
            Expanded(child: Divider()),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16),
              child: CommonText(text: 'Or'),
            ),
            Expanded(child: Divider()),
          ],
        ),
        32.height,
        CommonButton(
          buttonColor: AppColors.instance.white,
          titleText: 'Continue with Google',
          titleColor: AppColors.instance.textPrimary,
          prefix: CommonImage(src: Assets.icons.google),
          buttonWidth: double.infinity,
        ),
      ],
    );
  }
}
