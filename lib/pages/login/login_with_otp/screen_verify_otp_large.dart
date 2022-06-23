
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:one_health_doctor_and_admin/constants/controller.dart';
import 'package:one_health_doctor_and_admin/constants/styles.dart';
import 'package:one_health_doctor_and_admin/helpers/text_field_validator_mixin.dart';
import 'package:one_health_doctor_and_admin/pages/login/login_with_otp/login_with_otp.dart';
import 'package:one_health_doctor_and_admin/pages/login/login_with_otp/verify_otp.dart';
import 'package:one_health_doctor_and_admin/widgets/custom_image_card.dart';
import 'package:one_health_doctor_and_admin/widgets/custom_submit_button.dart';

class ScreenVerifyOtpLarge extends StatelessWidget with TextFieldValidator {
  const ScreenVerifyOtpLarge({
    Key? key,
    required this.otpTextController,
    required this.newTextEditingController,
  }) : super(key: key);

  final TextEditingController otpTextController;
  final TextEditingController newTextEditingController;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: SingleChildScrollView(
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(50.0),
                child: Column(
                  children: [
                    CustomPinInputField(
                        otpTextController: otpTextController,
                        newTextEditingController: newTextEditingController),
                    GestureDetector(
                      onTap: () {
                        if (otpTextController.text.isNotEmpty) {
                          loginPageController.doctorVerifyOtp(
                              ScreenSignInwithOtp.mobileNumberController.text,
                              int.parse(
                                  CustomPinInputField.otpTextController2.text));
                        }
                      },
                      child: const Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                        child: CustomSubmitButton(
                            text: 'VERIFY OTP', bgColor: Colors.deepPurple),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  SizedBox(
                    height: height * 0.05,
                    width: width,
                  ),
                  Text(
                    'Hello Again!',
                    style: mainHeaderStyle,
                  ),
                  Text(
                    'Type the verification code we have sent to \n+91 ${ScreenSignInwithOtp.mobileNumberController.text}',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.quicksand(
                        fontSize: 13, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: height * 0.05,
                    width: width,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                    child: const CustomImageCard(
                      imagePath: 'images/sign_with_otp.jpg',
                      ratio: 1.5,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
