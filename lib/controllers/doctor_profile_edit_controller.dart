import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:one_health_doctor_and_admin/api/doctor_api/edit_doctor_profile_services.dart';
import 'package:one_health_doctor_and_admin/constants/controller.dart';
import 'package:one_health_doctor_and_admin/constants/styles.dart';
import 'package:one_health_doctor_and_admin/helpers/doctor_edit_profile_model.dart';
import 'package:one_health_doctor_and_admin/routing/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DoctorProfileEditController extends GetxController {
  static DoctorProfileEditController instance = Get.find();
  editProfile(DoctorEditProfileModel doctorEditProfileModel,
      BuildContext context, bool isAdmin) async {
    print('**********************************1');
    SharedPreferences preferences = await SharedPreferences.getInstance();
    EditDoctorProfileServise editDoctorProfileServise =
        EditDoctorProfileServise();
    try {
      print('**********************************2');
      final response = await editDoctorProfileServise.editDoctorProfile(
        doctorEditProfileModel: doctorEditProfileModel,
        id: doctorEditProfileModel.id,
        token: preferences.getStringList('adminProfile')![1],
      );
      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 204) {
        print('**********************************7');
        menuController.changeActiveItemto(adminProfilePage);
        navigationController.navigateTo(adminProfilePage, arguments: '');
      } else {
        throw DioError;
      }
    } catch (e) {
      if (e is DioError) {
        showSnackBar(context: context, message: 'Profile Edited Succesfully');
        navigationController.navigateTo(profilePageView, arguments: '');
      } else {
        print(e);
        navigationController.navigateTo(profilePageView, arguments: '');
      }
    }
  }
}
