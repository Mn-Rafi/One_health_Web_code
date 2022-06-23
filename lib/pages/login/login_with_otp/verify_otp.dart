
import 'package:flutter/material.dart';
import 'package:one_health_doctor_and_admin/constants/styles.dart';
import 'package:one_health_doctor_and_admin/helpers/responsiveness.dart';
import 'package:one_health_doctor_and_admin/pages/login/login_with_otp/screen_verify_otp_large.dart';
import 'package:one_health_doctor_and_admin/pages/login/login_with_otp/screen_verify_otp_small.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class ScreenVerifyOTP extends StatelessWidget {
  ScreenVerifyOTP({Key? key}) : super(key: key);
  TextEditingController newTextEditingController = TextEditingController();
  static TextEditingController otpTextController = TextEditingController();
  FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: kboxdecoration,
      child: Scaffold(
        body: ResponsiveWidget.isScreenSmall(context)
            ? ScreenVerifyOtpSmall(
                otpTextController: otpTextController,
                newTextEditingController: newTextEditingController)
            : ScreenVerifyOtpLarge(
                otpTextController: otpTextController,
                newTextEditingController: newTextEditingController),
      ),
    );
  }
}

class CustomPinInputField extends StatelessWidget {
  const CustomPinInputField({
    Key? key,
    required this.otpTextController,
    required this.newTextEditingController,
  }) : super(key: key);

  final TextEditingController otpTextController;
  final TextEditingController newTextEditingController;
  static TextEditingController otpTextController2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 50),
      child: PinCodeTextField(
        keyboardType: TextInputType.number,
        onChanged: (val) {
          otpTextController.text = '';
        },
        appContext: context,
        length: 6,
        obscureText: false,
        animationType: AnimationType.fade,
        pinTheme: PinTheme(
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(5),
          fieldHeight: 40,
          fieldWidth: 50,
          activeFillColor: Colors.white,
        ),
        animationDuration: const Duration(milliseconds: 300),
        controller: newTextEditingController,
        onCompleted: (value) {
          otpTextController2.text = value;
          otpTextController.text = value;
          print(otpTextController2.text);
        },
      ),
    );
  }
}
