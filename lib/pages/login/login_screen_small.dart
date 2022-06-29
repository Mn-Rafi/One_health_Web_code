import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:one_health_doctor_and_admin/constants/controller.dart';
import 'package:one_health_doctor_and_admin/constants/styles.dart';
import 'package:one_health_doctor_and_admin/helpers/text_field_validator_mixin.dart';
import 'package:one_health_doctor_and_admin/pages/login/login_screen_large.dart';
import 'package:one_health_doctor_and_admin/pages/login/login_with_otp/login_with_otp.dart';
import 'package:one_health_doctor_and_admin/widgets/custom_image_card.dart';
import 'package:one_health_doctor_and_admin/widgets/custom_submit_button.dart';
import 'package:one_health_doctor_and_admin/widgets/custom_text_formfield.dart';

class LoginScreenSmall extends StatelessWidget with TextFieldValidator {
  LoginScreenSmall({
    Key? key,
    required this.formKey,
  }) : super(key: key);

  IconData hidePass = Icons.visibility_off;
  bool isObscure = true;

  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Text(
                'Hello Again!',
                style: mainHeaderStyle,
              ),
              Text(
                'Before continue, please sign in first',
                textAlign: TextAlign.center,
                style: GoogleFonts.quicksand(
                    fontSize: 20, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 20,
              ),
              const Padding(
                padding: EdgeInsets.all(15.0),
                child: CustomImageCard(
                    imagePath: 'assets/images/signin.jpg', ratio: 1.4),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Obx(
                  () => Text(
                    'Sign In As ${loginPageController.pageTitle}',
                    style: mainHeaderStyle.copyWith(
                        color: Colors.redAccent, fontSize: 16),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: CustomTextFormField(
                    iconData: Icons.email,
                    textController: LoginScreenLarge.emailController,
                    validator: (val) {
                      return isEmailValid(val);
                    },
                    hintText: 'Enter email',
                    keyBoardType: TextInputType.emailAddress),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: CustomTextFormField(
                    suffixAction: () {
                      if (isObscure == true) {
                        isObscure = false;
                        hidePass = Icons.visibility;
                      } else {
                        isObscure = true;
                        hidePass = Icons.visibility_off;
                      }
                    },
                    // sufficiconData: hidePass,
                    nextAction: TextInputAction.done,
                    obscure: isObscure,
                    iconData: Icons.lock,
                    textController: LoginScreenLarge.passwordController,
                    validator: (val) {
                      return isPasswordValid(val);
                    },
                    hintText: 'Password',
                    keyBoardType: TextInputType.text),
              ),
              const SizedBox(
                height: 20,
              ),
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: InkWell(
                  onTap: () {
                    // Get.to(SiteLayout());
                    if (formKey.currentState!.validate()) {
                      if (loginPageController.pageTitle.value == "Doctor") {
                        loginPageController.doctorloginResponse(
                            LoginScreenLarge.emailController.text,
                            LoginScreenLarge.passwordController.text,
                            context);
                      } else {
                        loginPageController.adminloginResponse(
                            LoginScreenLarge.emailController.text,
                            LoginScreenLarge.passwordController.text,
                            context);
                      }
                    }
                  },
                  child: const CustomSubmitButton(
                      buttonWidth: 100,
                      bgColor: Colors.deepPurple,
                      text: 'SIGN IN'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  ' - OR - ',
                  style: mainHeaderStyle.copyWith(fontSize: 12),
                ),
              ),
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: InkWell(
                  onTap: () {
                    Get.to(ScreenSignInwithOtp());
                  },
                  child: const CustomSubmitButton(
                      buttonWidth: 200,
                      bgColor: Colors.orange,
                      text: 'SIGN IN WITH OTP'),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Obx(
                  () => Center(
                    child: loginPageController.registerHereWidget(),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: InkWell(
                  onHover: loginPageController.hoverPageSwitchText,
                  onTap: () {
                    loginPageController.changeLoginTitle();
                  },
                  child: Obx(
                    () => Text(
                      loginPageController.pageSwitchtext.value,
                      textAlign: TextAlign.right,
                      style: GoogleFonts.quicksand(
                          decoration: TextDecoration.underline,
                          color: Colors.blue[900],
                          fontSize: double.parse(loginPageController
                              .changePagefontSize
                              .toString()),
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
