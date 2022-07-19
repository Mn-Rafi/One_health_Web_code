import 'package:dio/dio.dart';
import 'package:one_health_doctor_and_admin/helpers/admin_patients_profile_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AdminPatientServices {
  Future<PatientsProfileModel?> getAllPatients() async {
    Dio dio = Dio();
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final token = preferences.getStringList('adminProfile')![1];
    try {
      final response = await dio.get(
        'https://onehealthhospital.site/api/user',
        options: Options(headers: {
          'auth-token': token,
        }),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        print(response.data['user'].length);
        PatientsProfileModel? patientProfileModel =
            PatientsProfileModel.fromJson(response.data);

        return patientProfileModel;
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

  Future<bool> blockUser({required User user}) async {
    user.access = !(user.access!);
    User userModel = user;
    print(userModel.access);
    Dio dio = Dio();
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final token = preferences.getStringList('adminProfile')![1];
    try {
      final response = await dio.put(
        'https://onehealthhospital.site/api/user/${userModel.sId}',
        data: userModel.toJson(),
        options: Options(headers: {
          'auth-token': token,
        }),
      );
      print(response.data);
      if (response.statusCode == 200 || response.statusCode == 201) {
        print(response.data);
        return true;
      } else {
        throw DioError;
      }
    } catch (e) {
      if (e is DioError) {
        print(e.response!.data["message"]);
      }
    }
    return false;
  }

  Future<bool> removeUser({required String userId}) async {
    Dio dio = Dio();
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final token = preferences.getStringList('adminProfile')![1];
    try {
      final response = await dio.delete(
        'https://onehealthhospital.site/api/user/$userId',
        options: Options(headers: {
          'auth-token': token,
        }),
      );
      print(response.data);
      if (response.statusCode == 200 || response.statusCode == 201) {
        print(response.data);
        return true;
      } else {
        throw DioError;
      }
    } catch (e) {
      if (e is DioError) {
        print(e.response!.data["message"]);
      }
    }
    return false;
  }
}
