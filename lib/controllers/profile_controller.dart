import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:one_health_doctor_and_admin/api/doctor_api/doctor_profile_services.dart';
import 'package:one_health_doctor_and_admin/helpers/doctor_profile_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileController extends GetxController {
  static ProfileController instance = Get.find();
  Stream<DoctorProfileModel?> doctorProfileResponse() async* {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    DoctorProfileServices doctorProfileServices = DoctorProfileServices();
    try {
      final response = await doctorProfileServices.getDoctorProfile(
        id: preferences.getStringList('doctorProfile')![0],
        token: preferences.getStringList('doctorProfile')![1],
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        doctorProfileModel = DoctorProfileModel(
            name: response.data['doctor']['name'],
            email: response.data['doctor']['email'],
            qualification: response.data['doctor']['qualification'],
            department: response.data['doctor']['department'],
            experience: response.data['doctor']['experience'],
            areaOfExpertise: response.data['doctor']['expertise'],
            opTimeStart: response.data['doctor']['startTime'],
            opTimeEnd: response.data['doctor']['endTime'],
            imagePath: response.data['doctor']['image'],
            phoneNumber: response.data['doctor']['phone'].toString(),
            fee: response.data['doctor']['fee'].toString(),
            days: response.data['doctor']['days']
            );
        yield doctorProfileModel;
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
