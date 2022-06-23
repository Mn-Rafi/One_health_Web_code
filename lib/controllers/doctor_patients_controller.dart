import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:one_health_doctor_and_admin/api/doctor_api/doctor_patients_services.dart';
import 'package:one_health_doctor_and_admin/helpers/doctor_patients_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DoctorPatientsController extends GetxController {
  static DoctorPatientsController instance = Get.find();

  Stream<List<DoctorPatientDetailsModel>?>? doctorPatientsResponse() async* {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    DoctorPatientsServices doctorPatientsServices = DoctorPatientsServices();
    try {
      final response = await doctorPatientsServices.getDoctorPatients(
        id: preferences.getStringList('doctorProfile')![0],
        token: preferences.getStringList('doctorProfile')![1],
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        // print('Data Kitty');
        doctorPatientDetailsModelList.clear();
        for (int i = 0; i < response.data['users'].length; i++) {
          doctorPatientDetailsModelList.add(DoctorPatientDetailsModel(
            name: response.data['users'][i]['firstName'].toString(),
            age: response.data['users'][i]['age'].toString(),
            bloodGroup: response.data['users'][i]['blood'].toString(),
            gender: response.data['users'][i]['gender'].toString(),
            id: response.data['users'][i]['_id'].toString(),
            imagePath: response.data['users'][i]['image'].toString(),
            mobile: response.data['users'][i]['phone'].toString(),
          ));
        }

        yield doctorPatientDetailsModelList;
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
