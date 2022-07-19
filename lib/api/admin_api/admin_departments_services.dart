import 'package:dio/dio.dart';
import 'package:one_health_doctor_and_admin/helpers/admin_department_response_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AdminDepartmetnServices {
  final List<String> departmentsIdList = [];
  Future<DepartmentResponseModel?> getDepartmentList() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? token;
    String? doctorToken;

    try {
      token = preferences.getStringList('adminProfile')![1];
      doctorToken = preferences.getStringList('doctorProfile')![1];
    } catch (e) {
      print(e);
    }
    List<String>? departmentList = [];
    List<List<DoctorProfileModel>>? doctorProfileModelList = [];
    Dio dio = Dio();
    final data = {
      "auth-token": token ?? doctorToken,
    };

    try {
      final response = await dio.get(
        'https://onehealthhospital.site/api/department/',
        options: Options(headers: data),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        for (int i = 0; i < response.data['department'].length; i++) {
          departmentsIdList.add(response.data['department'][i]['_id']);
          departmentList.add(response.data['department'][i]['name']);
          List<DoctorProfileModel>? doctorsList = [];
          for (int j = 0;
              j < response.data['department'][i]['doctors'].length;
              j++) {
            DoctorProfileModel? doctorProfileModel;
            try {
              final doctorResponse = await dio.get(
                'https://onehealthhospital.site/api/doctor/${response.data['department'][i]['doctors'][j]}',
                options: Options(headers: data),
              );
              if (doctorResponse.statusCode == 200 ||
                  doctorResponse.statusCode == 201) {
                doctorProfileModel =
                    DoctorProfileModel.fromJson(doctorResponse.data);
                doctorsList.add(doctorProfileModel);
              } else {
                throw DioError;
              }
            } catch (e) {
              if (e is DioError) {
                print(e.response!.data["message"]);
              }
            }
          }
          doctorProfileModelList.add(doctorsList);
        }
        return DepartmentResponseModel(
          departmentList: departmentList,
          doctorsList: doctorProfileModelList,
        );
      } else {
        throw DioError;
      }
    } catch (e) {
      if (e is DioError) {
        print(e.response!.data['message']);
      }
    }
    return null;
  }

  Future<bool> addDepartment(String departmentName) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? token;
    String? doctorToken;

    try {
      token = preferences.getStringList('adminProfile')![1];
      doctorToken = preferences.getStringList('doctorProfile')![1];
    } catch (e) {
      print(e);
    }

    Dio dio = Dio();
    final data = {
      "auth-token": token ?? doctorToken,
    };

    try {
      final response = await dio.post(
        'https://onehealthhospital.site/api/department/',
        options: Options(headers: data),
        data: {
          "name": departmentName,
        },
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        print(response.data);
        return true;
      } else {
        throw DioError;
      }
    } catch (e) {
      if (e is DioError) {
        print(e.response!.data['message']);
      }
    }
    return false;
  }

  Future<bool> deleteDepartment(String departmentId) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? token;
    String? doctorToken;

    try {
      token = preferences.getStringList('adminProfile')![1];
      doctorToken = preferences.getStringList('doctorProfile')![1];
    } catch (e) {
      print(e);
    }

    Dio dio = Dio();
    final data = {
      "auth-token": token ?? doctorToken,
    };
    try {
      final response = await dio.delete(
        'https://onehealthhospital.site/api/department/$departmentId',
        options: Options(headers: data),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        print(response.data);
        return true;
      } else {
        throw DioError;
      }
    } catch (e) {
      if (e is DioError) {
        print(e.response!.data['message']);
      }
    }
    return false;
  }

  Future<bool> editDepartment(
      String departmentId, String departmentName) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? token;
    String? doctorToken;

    try {
      token = preferences.getStringList('adminProfile')![1];
      doctorToken = preferences.getStringList('doctorProfile')![1];
    } catch (e) {
      print(e);
    }

    Dio dio = Dio();
    final data = {
      "auth-token": token ?? doctorToken,
    };
    try {
      final response = await dio.put(
        'https://onehealthhospital.site/api/department/$departmentId',
        data: {"name": departmentName},
        options: Options(headers: data),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        print('HELOOOOOOOOOOOOOOOOOOOOO');
        print(response.data);
        print('HELOOOOOOOOOOOOOOOOOOOOO');

        return true;
      } else {
        throw DioError;
      }
    } catch (e) {
      if (e is DioError) {
        print(e.response!.data['message']);
      }
    }
    return false;
  }
}
