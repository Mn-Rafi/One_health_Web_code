import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:one_health_doctor_and_admin/constants/controller.dart';
import 'package:one_health_doctor_and_admin/constants/styles.dart';
import 'package:one_health_doctor_and_admin/helpers/text_field_validator_mixin.dart';
import 'package:one_health_doctor_and_admin/pages/login/login_with_otp/login_with_otp.dart';
import 'package:one_health_doctor_and_admin/widgets/custom_image_card.dart';
import 'package:one_health_doctor_and_admin/widgets/custom_submit_button.dart';
import 'package:one_health_doctor_and_admin/widgets/custom_text_formfield.dart';

class LoginScreenLarge extends StatelessWidget with TextFieldValidator {
  const LoginScreenLarge({
    Key? key,
    required this.formKey,
  }) : super(key: key);
  final GlobalKey<FormState> formKey;

  static TextEditingController emailController = TextEditingController();
  static TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          Text(
            'Hello Again!',
            style: mainHeaderStyle.copyWith(color: Colors.redAccent),
          ),
          Text(
            'Before continue, please sign in first',
            textAlign: TextAlign.center,
            style: GoogleFonts.quicksand(
                fontSize: 20, fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.all(80.0),
                  child: SizedBox(
                    width: 500,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Obx(
                          () => Text(
                            'Sign In As ${loginPageController.pageTitle}',
                            style: mainHeaderStyle.copyWith(
                                color: Colors.redAccent),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomTextFormField(
                            iconData: Icons.email,
                            textController: emailController,
                            validator: (val) {
                              return isEmailValid(val);
                            },
                            hintText: 'Enter email',
                            keyBoardType: TextInputType.emailAddress),
                        const SizedBox(
                          height: 30,
                        ),
                        CustomTextFormField(
                            nextAction: TextInputAction.done,
                            obscure: true,
                            iconData: Icons.lock,
                            textController: passwordController,
                            validator: (val) {
                              return isValid(val, 'password');
                            },
                            hintText: 'Password',
                            keyBoardType: TextInputType.text),
                        const SizedBox(
                          height: 30,
                        ),
                        MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            onTap: () {
                              // Get.to(SiteLayout());
                              if (formKey.currentState!.validate()) {
                                if (loginPageController.pageTitle.value ==
                                    "Doctor") {
                                  print(loginPageController.pageTitle.value);
                                  loginPageController.doctorloginResponse(
                                      emailController.text,
                                      passwordController.text, context);
                                } else {
                                  print(loginPageController.pageTitle.value);
                                  print(emailController.text +
                                      passwordController.text);
                                  loginPageController.adminloginResponse(
                                      emailController.text,
                                      passwordController.text);
                                }
                              }
                            },
                            child: const CustomSubmitButton(
                                bgColor: Colors.deepPurple, text: 'SIGN IN'),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            '- OR -',
                            style: mainHeaderStyle.copyWith(color: Colors.blue),
                          ),
                        ),
                        MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            onTap: () {
                              Get.to(ScreenSignInwithOtp());
                            },
                            child: const CustomSubmitButton(
                                bgColor: Colors.orange,
                                text: 'SIGN IN WITH OTP'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 50, right: 50, top: 50, bottom: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const CustomImageCard(
                          imagePath: 'assets/images/signin.jpg', ratio: 1.4),
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
            ],
          ),
          Obx(
            () => Center(
              child: loginPageController.registerHereWidget(),
            ),
          )
        ],
      ),
    );
  }
}
