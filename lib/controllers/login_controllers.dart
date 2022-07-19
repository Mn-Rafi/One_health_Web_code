import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:one_health_doctor_and_admin/api/admin_api/admin_login_api_services.dart';
import 'package:one_health_doctor_and_admin/api/doctor_api/doctor_login_api_services.dart';
import 'package:one_health_doctor_and_admin/constants/controller.dart';
import 'package:one_health_doctor_and_admin/constants/styles.dart';
import 'package:one_health_doctor_and_admin/main.dart';
import 'package:one_health_doctor_and_admin/pages/login/login_with_otp/verify_otp.dart';
import 'package:one_health_doctor_and_admin/pages/register/screen_register.dart';
import 'package:one_health_doctor_and_admin/site_layout.dart';
import 'package:one_health_doctor_and_admin/widgets/custom_text.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPageController extends GetxController {
  static LoginPageController instance = Get.find();
  var pageTitle = "Doctor".obs;
  var pageSwitchtext = "-Go to Admin Sign In".obs;
  RxInt clickHerefontSize = 14.obs;
  RxInt changePagefontSize = 16.obs;

  changeLoginTitle() {
    if (pageTitle.value == "Doctor") {
      webpageTitle = 'Admin';
      pageTitle.value = "Admin";
      pageSwitchtext.value = "-Go to Doctor Sign In";
    } else {
      webpageTitle = 'Doctor';
      pageTitle.value = "Doctor";
      pageSwitchtext.value = "-Go to Admin Sign In";
    }
  }

  hoverPageSwitchText(value) {
    if (value) {
      changePagefontSize.value = 20;
    } else {
      changePagefontSize.value = 14;
    }
  }

  doctorloginResponse(
      String email, String password, BuildContext context) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    DoctorLoginSerices doctorLoginSerices = DoctorLoginSerices();
    try {
      final response = await doctorLoginSerices.getUserResponseData(
          email: email, password: password);
      if (response.statusCode == 200) {
        print('Logged In Succesfully');
        log(response.data.toString());
        // Get.showSnackbar(GetSnackBar(title: "Logged In Succesfully"));
        print(['${response.data['doctorId']}', '${response.data['token']}']);
        await preferences.clear();
        await preferences.setStringList('doctorProfile', [
          '${response.data['doctorId']}',
          '${response.data['token']}',
        ]).then((value) async {
          await profileController.doctorProfileResponse();
          Get.offAll(SiteLayout());
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('Logged In Succesfully')));
        });
      } else {
        throw DioError;
      }
    } catch (e) {
      if (e is DioError) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(e.response!.data["message"])));
        print(e.response!.data["message"]);
      }
    }
  }

  adminloginResponse(
      String email, String password, BuildContext context) async {
    print('Admin Login Called');
    SharedPreferences preferences = await SharedPreferences.getInstance();
    AdminLoginSerices adminLoginSerices = AdminLoginSerices();
    try {
      final response = await adminLoginSerices.getUserResponseData(
          email: email, password: password);
      if (response.statusCode == 200) {
        print('Logged In Succesfully');
        await preferences.clear();
        await preferences.setStringList('adminProfile', [
          '${response.data['adminId']}',
          '${response.data['token']}',
          '${response.data['adminName']}'
        ]).then((value) {
          Get.offAll(SiteLayout());
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Logged In Succesfully')));
        });
        print('********************************8');
        print([
          '${response.data['adminId']}',
          '${response.data['token']}',
          '${response.data['adminName']}'
        ]);
        print('***************************');
        print(response.data);
      } else {
        print(response.statusCode);
        throw DioError;
      }
    } catch (e) {
      if (e is DioError) {
        showSnackBar(context: context, message: e.response!.data["message"]);
      }
    }
  }

  doctorVerifyOtp(String mobileNumber, int otp) async {
    print(otp);
    DoctorLoginSerices doctorLoginSerices = DoctorLoginSerices();
    try {
      final response = await doctorLoginSerices.verifyOtp(
          mobileNumber: mobileNumber, otp: otp);
      if (response.statusCode == 200) {
        print('Number Verified Login Succesfully');

        Get.to(SiteLayout());
      } else {
        print(response.data["message"]);
        throw DioError;
      }
    } catch (e) {
      if (e is DioError) {
        print(e.response!.data["message"]);
      }
    }
  }

  doctorRequestOtp(String number) async {
    DoctorLoginSerices doctorLoginSerices = DoctorLoginSerices();
    try {
      final response = await doctorLoginSerices.requestOtp(number: number);
      if (response.statusCode == 200) {
        print('Number Verified');
        // Get.showSnackbar(GetSnackBar(title: "Logged In Succesfully"));

        Get.to(ScreenVerifyOTP());
      } else {
        throw DioError;
      }
    } catch (e) {
      if (e is DioError) {
        print(e.response!.data["message"]);
      }
    }
  }

  Widget registerHereWidget() {
    if (pageTitle.value == "Doctor") {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Flexible(
            child: CustomText(text: "Don't have an account ? "),
          ),
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: InkWell(
              onHover: (value) {
                if (value) {
                  clickHerefontSize.value = 20;
                } else {
                  clickHerefontSize.value = 14;
                }
              },
              onTap: () {
                Get.to(const ScreenRegister());
              },
              child: CustomText(
                text: "Click here ",
                fontSize: double.parse(clickHerefontSize.value.toString()),
                fontColor: Colors.blue[900],
              ),
            ),
          ),
          const CustomText(text: "to register"),
        ],
      );
    }
    return const SizedBox();
  }
}
