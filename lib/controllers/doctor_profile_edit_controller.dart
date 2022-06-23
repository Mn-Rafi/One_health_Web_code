import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:one_health_doctor_and_admin/api/doctor_api/edit_doctor_profile_services.dart';
import 'package:one_health_doctor_and_admin/constants/controller.dart';
import 'package:one_health_doctor_and_admin/helpers/doctor_edit_profile_model.dart';
import 'package:one_health_doctor_and_admin/routing/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DoctorProfileEditController extends GetxController {
  static DoctorProfileEditController instance = Get.find();
  editProfile(DoctorEditProfileModel doctorEditProfileModel,
      BuildContext context) async {
    print('Edit Profile');
    SharedPreferences preferences = await SharedPreferences.getInstance();
    EditDoctorProfileServise editDoctorProfileServise =
        EditDoctorProfileServise();
    try {
      final response = await editDoctorProfileServise.editDoctorProfile(
        doctorEditProfileModel: doctorEditProfileModel,
        id: preferences.getStringList('doctorProfile')![0],
        token: preferences.getStringList('doctorProfile')![1],
      );
      print('RESPONSEEEEEEEEEEEEEEEEEEEE ${response.statusCode}');
      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 204) {
        print('Profile Edited');
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Profile Edited Succesfully')));
        navigationController.navigateTo(profilePageView, arguments: '');
      } else {
        print('Error Occured');
        throw DioError;
      }
    } catch (e) {
      if (e is DioError) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Profile Edited Succesfully')));
        print('------------------------------------------------- $e ------------------------------------------------');
        navigationController.navigateTo(profilePageView, arguments: '');
      } else {
        print(e);
        navigationController.navigateTo(profilePageView, arguments: '');
      }
    }
  }
}
