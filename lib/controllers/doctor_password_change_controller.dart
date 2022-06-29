import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:one_health_doctor_and_admin/api/doctor_api/doctor_change_password_services.dart';
import 'package:one_health_doctor_and_admin/constants/controller.dart';
import 'package:one_health_doctor_and_admin/routing/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PasswordChangeController extends GetxController {
  static PasswordChangeController instance = Get.find();
  doctorChangePassword(
      String oldPassword, String newPassword, BuildContext context) async {
    DoctorChangePasswordServices doctorChangePasswordServices =
        DoctorChangePasswordServices();

    SharedPreferences prefs = await SharedPreferences.getInstance();
    final String id = prefs.getStringList('doctorProfile')![0];
    final String token = prefs.getStringList('doctorProfile')![1];

    try {
      final response = await doctorChangePasswordServices.changePassword(
          oldPassword, newPassword, id, token);
      if (response.statusCode == 200 || response.statusCode == 201) {
        print('Password Changed');
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Password Changed Succesfully')));
        navigationController.navigateTo(profilePageView, arguments: '');
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

  adminChangePassword(
      String oldPassword, String newPassword, BuildContext context) async {
    DoctorChangePasswordServices doctorChangePasswordServices =
        DoctorChangePasswordServices();

    SharedPreferences prefs = await SharedPreferences.getInstance();
    final String id = prefs.getStringList('adminProfile')![0];
    final String token = prefs.getStringList('adminProfile')![1];

    try {
      final response = await doctorChangePasswordServices.changeAdminPassword(
          oldPassword, newPassword, id, token);
      if (response.statusCode == 200 || response.statusCode == 201) {
        print('Password Changed');
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Password Changed Succesfully')));
        navigationController.navigateTo(adminProfilePage, arguments: '');
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
}
