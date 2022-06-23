import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:one_health_doctor_and_admin/api/doctor_api/get_patient_by_id_services.dart';
import 'package:one_health_doctor_and_admin/helpers/patient_profile_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetPatientByIDController extends GetxController {
  static GetPatientByIDController instance = Get.find();
  Future<PatientProfileModel?> getPatientProfileResponse(
      String userId, BuildContext context) async {
    PatientProfileModel patientProfileModel;
    GetPatientByIdServices getPatientByIdServices = GetPatientByIdServices();
    SharedPreferences preferences = await SharedPreferences.getInstance();
    try {
      print('INSIDE ________________________________');
      final response = await getPatientByIdServices.getPatients(
          userId: userId,
          doctorToken: preferences.getStringList('doctorProfile')![1]);
      if (response.statusCode == 200) {
        print(response.data);
        patientProfileModel = PatientProfileModel(
          age: response.data["user"]["age"].toString(),
          bloodGroup: response.data["user"]["blood"].toString(),
          gender: response.data["user"]["gender"].toString(),
          id: response.data["user"]["_id"].toString(),
          imagePath: response.data["user"]["image"].toString(),
          mobile: response.data["user"]["phone"].toString(),
          firstName: response.data["user"]["firstName"].toString(),
          secondName: response.data["user"]["secondName"].toString(),
          email: response.data["user"]["email"].toString(),
        );
      } else {
        throw DioError;
      }
      return patientProfileModel;
    } catch (e) {
      if (e is DioError) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: e.response!.data["message"]));
      }
    }
    return null;
  }
}
