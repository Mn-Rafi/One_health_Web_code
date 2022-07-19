import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:one_health_doctor_and_admin/api/doctor_api/doctor_appointments_services.dart';
import 'package:one_health_doctor_and_admin/helpers/doctor_appointments_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DoctorAppointmentsController extends GetxController {
  static DoctorAppointmentsController instance = Get.find();
  Stream<List<DoctorAppointmentDetailsModel>>? doctorPatientsResponse() async* {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    DoctorAppointmetnsServices doctorAppointmetnsServices =
        DoctorAppointmetnsServices();
    List<DoctorAppointmentDetailsModel> doctorAppointmentDetailsModelList = [];
    try {
      final response = await doctorAppointmetnsServices.getDoctorAppointments(
        id: preferences.getStringList('doctorProfile')![0],
        token: preferences.getStringList('doctorProfile')![1],
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        log(response.data['appointment'].toString());
        doctorAppointmentDetailsModelList.clear();
        for (int i = 0; i < response.data['appointment'].length; i++) {
          doctorAppointmentDetailsModelList.add(DoctorAppointmentDetailsModel(
              name: response.data['appointment'][i]['user'].toString(),
              age: response.data['appointment'][i]['age'].toString(),
              bloodGroup: response.data['appointment'][i]['blood'].toString(),
              gender: response.data['appointment'][i]['gender'].toString(),
              id: response.data['appointment'][i]['userId'].toString(),
              mobile: response.data['appointment'][i]['phone'].toString(),
              date: response.data['appointment'][i]['date'].toString(),
              time: response.data['appointment'][i]['time'].toString(),
              status: response.data['appointment'][i]['status'].toString(),
              reason: response.data['appointment'][i]['reason'].toString()));
        }
        print(
            '****************************************************************');
        print(doctorAppointmentDetailsModelList);
        print(
            '****************************************************************');
        yield doctorAppointmentDetailsModelList;
      } else {
        throw DioError;
      }
    } catch (e) {
      if (e is DioError) {
        print(e.response!.data["message"]);
      }
    }
  }
}
