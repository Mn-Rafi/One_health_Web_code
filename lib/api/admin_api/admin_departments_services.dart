import 'package:dio/dio.dart';
import 'package:one_health_doctor_and_admin/helpers/admin_department_response_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AdminDepartmetnServices {
  Future<DepartmentResponseModel?> getDepartmentList() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final token = preferences.getStringList('adminProfile')![1];
    // final doctorToken = preferences.getStringList('doctorProfile')![1];
    List<String>? departmentList = [];
    List<List<DoctorProfileModel>>? doctorProfileModelList = [];
    Dio dio = Dio();
    final data = {
      "auth-token": token,
    };

    try {
      final response = await dio.get(
        'https://onehealthhospital.online/api/department/',
        options: Options(headers: data),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        for (int i = 0; i < response.data['department'].length; i++) {
          departmentList.add(response.data['department'][i]['name']);
          // doctorsList.add(response.data['department'][i]['doctors']);
          List<DoctorProfileModel>? doctorsList = [];
          for (int j = 0;
              j < response.data['department'][i]['doctors'].length;
              j++) {
            DoctorProfileModel? doctorProfileModel;
            print('================================');
            print(
                'https://onehealthhospital.online/api/doctor/${response.data['department'][i]['doctors'][j]}');
            print('================================');
            try {
              final doctorResponse = await dio.get(
                'https://onehealthhospital.online/api/doctor/${response.data['department'][i]['doctors'][j]}',
                options: Options(headers: data),
              );
              if (doctorResponse.statusCode == 200 ||
                  doctorResponse.statusCode == 201) {
                print('Starteddddddddddddddd');
                print(response.data['name']);
                doctorProfileModel =
                    DoctorProfileModel.fromJson(doctorResponse.data);
                doctorsList.add(doctorProfileModel);
                print('endddddddddddddddd');
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
        // response.data['department'][i]['doctors'].toString().split(',')
        print('*******************************');
        print(doctorProfileModelList);
        print('*******************************');
        // try{

        // }
        return DepartmentResponseModel(
            departmentList: departmentList, doctorsList: doctorProfileModelList
            // doctorsList.map((e) => e.toString().split(',')).toList(),
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
}
