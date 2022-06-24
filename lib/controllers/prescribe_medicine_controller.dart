import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:one_health_doctor_and_admin/api/doctor_api/prescribe_medicine_services.dart';
import 'package:one_health_doctor_and_admin/helpers/prescription_list_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrescribeMedicineController {
  Future<List<List<PrescriptionListModel>?>?> getPatientPrescriptionList(
      String id, BuildContext context) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    PrescribeMedicineServices prescribeMedicineServices =
        PrescribeMedicineServices();
    final List<List<PrescriptionListModel>> presList = [];
    final token = preferences.getStringList('doctorProfile')![1];
    try {
      final response = await prescribeMedicineServices.getPrescriptionList(
          id: id, token: token);
      print(response.data);
      if (response.statusCode == 201) {
        for (int j = 0; j < response.data["prescription"].length; j++) {
          final List<PrescriptionListModel> prescriptionList = [];
          for (int i = 0;
              i < response.data["prescription"][j]["medicine"].length;
              i++) {
            prescriptionList.add(PrescriptionListModel(
              date: response.data["prescription"][j]["date"].toString(),
              dosage: response.data["prescription"][j]["dosage"][i].toString(),
              medicine:
                  response.data["prescription"][j]["medicine"][i].toString(),
              prescribedFor: response.data["prescription"][j]["prescribedFor"]
                      [i]
                  .toString(),
            ));
          }
          presList.add(prescriptionList);
        }
        // print(
        // '-----------------------------------${prescriptionList[0].date}-------------------');
        return presList;
      } else {
        throw DioError;
      }
    } catch (e) {
      if (e is DioError) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(e.response!.data["message"])));
      }
    }
  }

  Future<bool> postPrescription(
      {required String userId,
      required String userName,
      required String doctorName,
      required List<String> medicines,
      required List<String> dosage,
      required List<String> prescribedFor,
      required BuildContext context}) async {
    print('started ');
    SharedPreferences preferences = await SharedPreferences.getInstance();
    PrescribeMedicineServices prescribeMedicineServices =
        PrescribeMedicineServices();
    final doctorId = preferences.getStringList('doctorProfile')![0].toString();
    final token = preferences.getStringList('doctorProfile')![1].toString();
    try {
      print('I am trying');
      final response = await prescribeMedicineServices.postNewPrescription(
        doctorId: doctorId,
        userId: userId,
        userName: userName,
        doctorName: doctorName,
        medicines: medicines,
        dosage: dosage,
        prescribedFor: prescribedFor,
        token: token,
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        print('successssssssssssssss');
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Prescription Added Succesfully')));
        return true;
      } else {
        throw DioError;
      }
    } catch (e) {
      if (e is DioError) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(e.response!.data["message"])));
      }
    }
    return false;
  }
}
