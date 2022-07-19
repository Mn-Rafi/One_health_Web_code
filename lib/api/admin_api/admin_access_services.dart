import 'package:dio/dio.dart';
import 'package:one_health_doctor_and_admin/helpers/doctor_profile_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AdminaccessServices {
  Future<List<AdminProfileModel>?> getAdminaccessDoctors() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final token = preferences.getStringList('adminProfile')![1];
    List<AdminProfileModel>? adminProfileModel = [];
    AdminProfileModel adminProfileModel1;
    Dio dio = Dio();
    final data = {
      "auth-token": token,
    };
    try {
      Response response = await dio.get(
          'https://onehealthhospital.online/api/admin/admins/',
          options: Options(headers: data));
      if (response.statusCode == 200 || response.statusCode == 201) {
        print('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
        print(response.data['admins'].length);
        print('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
        for (int i = 0; i < response.data['admins'].length; i++) {
          adminProfileModel1 = AdminProfileModel(
            imagePath: response.data['admins'][i]['image'],
            id: response.data['admins'][i]['_id'].toString(),
            email: response.data['admins'][i]['email'].toString(),
            name: response.data['admins'][i]['name'].toString(),
            areaOfExpertise: response.data['admins'][i]['expertise'].toString(),
            department: response.data['admins'][i]['department'].toString(),
            experience: response.data['admins'][i]['experience'].toString(),
            opTimeStart: response.data['admins'][i]['startTime'].toString(),
            opTimeEnd: response.data['admins'][i]['endTime'].toString(),
            qualification:
                response.data['admins'][i]['qualification'].toString(),
            days: response.data['admins'][i]['days'],
            fee: response.data['admins'][i]['fee'].toString(),
            phoneNumber: response.data['admins'][i]['phone'].toString(),
          );
          adminProfileModel.add(adminProfileModel1);
        }

        print('===================================');
        print(response.data['admins']);
        print('===================================');
        return adminProfileModel;
      } else {
        throw DioError;
      }
    } catch (e) {
      if (e is DioError) {
        print(e.response!.data['message']);
      }
    }
    return adminProfileModel;
  }
}
