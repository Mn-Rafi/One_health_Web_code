
import 'package:flutter/material.dart';
import 'package:one_health_doctor_and_admin/constants/styles.dart';
import 'package:one_health_doctor_and_admin/helpers/responsiveness.dart';
import 'package:one_health_doctor_and_admin/pages/login/login_screen_large.dart';
import 'package:one_health_doctor_and_admin/pages/login/login_screen_small.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) :  super(key: key);

  
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: kboxdecoration,
      child: Form(
        key: _formKey,
        child: Scaffold(
          backgroundColor: Colors.white.withOpacity(0.5),
          body: ResponsiveWidget.isScreenSmall(context)
              ? LoginScreenSmall(formKey: _formKey,)
              : LoginScreenLarge(formKey: _formKey),
        ),
      ),
    );
  }
}
