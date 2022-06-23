
import 'package:flutter/material.dart';
import 'package:one_health_doctor_and_admin/constants/styles.dart';
import 'package:one_health_doctor_and_admin/helpers/responsiveness.dart';
import 'package:one_health_doctor_and_admin/pages/login/login_with_otp/login_with_otp_large.dart';
import 'package:one_health_doctor_and_admin/pages/login/login_with_otp/login_with_otp_small.dart';

class ScreenSignInwithOtp extends StatelessWidget {
  ScreenSignInwithOtp({Key? key}) : super(key: key);

  static TextEditingController mobileNumberController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Container(
      decoration: kboxdecoration,
      child: Container(
        decoration: kboxdecoration,
        child: Scaffold(
          backgroundColor: Colors.white.withOpacity(0.5),
          body: ResponsiveWidget.isScreenSmall(context)
              ? ScreenSIgnInwIthotpSmall(
                  formKey: _formKey,
                  height: height,
                  width: width,
                  mobileNumberController: mobileNumberController)
              : ScreenSIgnInwIthotpLarge(
                  formKey: _formKey,
                  height: height,
                  width: width,
                  mobileNumberController: mobileNumberController),
        ),
      ),
    );
  }
}
