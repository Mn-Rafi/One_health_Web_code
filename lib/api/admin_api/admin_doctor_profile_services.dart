import 'package:dio/dio.dart';
import 'package:one_health_doctor_and_admin/constants/controller.dart';
import 'package:one_health_doctor_and_admin/helpers/doctor_response_profilemodel.dart';
import 'package:one_health_doctor_and_admin/routing/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AdminDoctorProfileServices {
  Future<List<DoctorModel?>?> getAllDoctorsList() async {
    Dio dio = Dio();
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final token = preferences.getStringList('adminProfile')![1];

    try {
      final response = await dio.get(
        'https://onehealthhospital.online/api/doctor/',
        options: Options(headers: {
          'auth-token': token,
        }),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        List<DoctorModel?>? doctorList = [];
        for (int i = 0; i < response.data['doctor'].length; i++) {
          DoctorModel? doctorModel =
              DoctorModel.fromJson(response.data['doctor'][i]);
          doctorList.add(doctorModel);
        }
        print('***************111111*****************');
        print(doctorList.toList().toString());
        print('*****************222222***************');
        return doctorList;
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

  Future<bool> removeDoctor({required String id, dynamic check}) async {
    Dio dio = Dio();
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? token;
    String? doctorToken;

    try {
      token = preferences.getStringList('adminProfile')![1];
      doctorToken = preferences.getStringList('doctorProfile')![1];
    } catch (e) {
      print(e);
    }
    try {
      Response response =
          await dio.delete('https://onehealthhospital.online/api/doctor/$id',
              options: Options(headers: {
                "auth-token": token ?? doctorToken,
              }));
      print(response.statusCode);
      if (response.statusCode == 200 || response.statusCode == 201) {
        print(response.data);
        if (check != null) {
          menuController.changeActiveItemto(adminDoctorsPage);
          navigationController.navigateTo(adminDoctorsPage, arguments: '');
        } else {
          menuController.changeActiveItemto(adminDepartmentsPage);
          navigationController.navigateTo(adminDepartmentsPage, arguments: '');
        }
        return true;
      } else {
        throw DioError;
      }
    } catch (e) {
      if (e is DioError) {
        print(e.response!.data['message']);
      }
      print(e);
    }

    return false;
  }
}
