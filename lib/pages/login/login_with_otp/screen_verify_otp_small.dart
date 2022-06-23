
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:one_health_doctor_and_admin/constants/controller.dart';
import 'package:one_health_doctor_and_admin/constants/styles.dart';
import 'package:one_health_doctor_and_admin/pages/login/login_with_otp/login_with_otp.dart';
import 'package:one_health_doctor_and_admin/pages/login/login_with_otp/verify_otp.dart';
import 'package:one_health_doctor_and_admin/widgets/custom_image_card.dart';
import 'package:one_health_doctor_and_admin/widgets/custom_submit_button.dart';

class ScreenVerifyOtpSmall extends StatelessWidget {
  const ScreenVerifyOtpSmall({
    Key? key,
    required this.otpTextController,
    required this.newTextEditingController,
  }) : super(key: key);

  final TextEditingController otpTextController;
  final TextEditingController newTextEditingController;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
              width: 100,
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
            const SizedBox(
              height: 50,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 50),
              child: CustomImageCard(
                imagePath: 'images/sign_with_otp.jpg',
                ratio: 1.5,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            CustomPinInputField(
                otpTextController: otpTextController,
                newTextEditingController: newTextEditingController),
            GestureDetector(
              onTap: () {
                if (otpTextController.text.isNotEmpty) {
                  loginPageController.doctorVerifyOtp(
                      ScreenSignInwithOtp.mobileNumberController.text,
                      int.parse(CustomPinInputField.otpTextController2.text));
                }
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                child: CustomSubmitButton(
                    text: 'VERIFY OTP', bgColor: Colors.deepPurple),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
