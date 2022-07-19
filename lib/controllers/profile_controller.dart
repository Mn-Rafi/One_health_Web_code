import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:one_health_doctor_and_admin/api/doctor_api/doctor_profile_services.dart';
import 'package:one_health_doctor_and_admin/helpers/doctor_profile_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

String? doctorName;

class ProfileController extends GetxController {
  static ProfileController instance = Get.find();
  DoctorProfileModel? doctorProfileModel;
  Future<DoctorProfileModel?> doctorProfileResponse() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    DoctorProfileServices doctorProfileServices = DoctorProfileServices();

    try {
      final response = await doctorProfileServices.getDoctorProfile(
        id: preferences.getStringList('doctorProfile')![0],
        token: preferences.getStringList('doctorProfile')![1],
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        doctorName = response.data['doctor']['name'];
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
          days: response.data['doctor']['days'],
          isAdmin: response.data['doctor']['admin'],
        );
        print('**********************************');
        print(response.data['doctor']['admin']);
        print('**********************************');
        return doctorProfileModel;
      } else {
        throw DioError;
      }
    } catch (e) {
      if (e is DioError) {
        print(e.response!.data["message"]);
      }
    }
    return null;
  }

  Future<AdminProfileModel?>? adminProfileResponse() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    AdminProfileServices adminProfileServices = AdminProfileServices();
    AdminProfileModel? adminProfileModel;
    try {
      final response = await adminProfileServices.getAdminProfile(
        token: preferences.getStringList('adminProfile')![1],
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        adminProfileModel = AdminProfileModel(
          imagePath: response.data['admin']['image'],
          id: response.data['admin']['_id'].toString(),
          email: response.data['admin']['email'].toString(),
          name: response.data['admin']['name'].toString(),
          ismainAdmin: response.data['admin']['mainAdmin'].toString(),
        );
        return adminProfileModel;
      }
    } catch (e) {
      try {
        final response = await adminProfileServices.getDoctorasAdminProfile(
            token: preferences.getStringList('adminProfile')![1],
            id: preferences.getStringList('adminProfile')![0]);
        if (response.statusCode == 200 || response.statusCode == 201) {
          adminProfileModel = AdminProfileModel(
            imagePath: response.data['doctor']['image'],
            id: response.data['doctor']['_id'].toString(),
            email: response.data['doctor']['email'].toString(),
            name: response.data['doctor']['name'].toString(),
            areaOfExpertise: response.data['doctor']['expertise'].toString(),
            department: response.data['doctor']['department'].toString(),
            experience: response.data['doctor']['experience'].toString(),
            opTimeStart: response.data['doctor']['startTime'].toString(),
            opTimeEnd: response.data['doctor']['endTime'].toString(),
            qualification: response.data['doctor']['qualification'].toString(),
          );
          return adminProfileModel;
        } else {
          throw DioError;
        }
      } catch (e) {
        if (e is DioError) {
          print(e.response!.data["message"]);
        }
      }
    }
    return null;
  }
}
