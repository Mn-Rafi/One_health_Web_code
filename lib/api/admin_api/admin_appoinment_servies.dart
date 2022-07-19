import 'package:dio/dio.dart';
import 'package:one_health_doctor_and_admin/helpers/admin_appoinments_list_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AdminAppoinmentServices {
  Future<AdminAppointmentsListModel?> getAllAppoinments(
      {required String link}) async {
    Dio dio = Dio();
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final token = preferences.getStringList('adminProfile')![1];
    try {
      final response = await dio.get(
        'https://onehealthhospital.site/api/appointment/$link',
        options: Options(headers: {
          'auth-token': token,
        }),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        // print(response.data['appointment'].length);
        AdminAppointmentsListModel? adminAppointmentsListModel =
            AdminAppointmentsListModel.fromJson(response.data);

        return adminAppointmentsListModel;
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

  Future<bool> markAppointmentAsComplete(
      {required String id, required String status}) async {
    Dio dio = Dio();
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final token = preferences.getStringList('adminProfile')![1];
    try {
      final response = await dio.put(
        'https://onehealthhospital.site/api/appointment/status/$id',
        data: {
          'status': status,
        },
        options: Options(headers: {
          'auth-token': token,
        }),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        print(response.data.toString());
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

  Future<bool> deleteAppointment({required String id}) async {
    Dio dio = Dio();
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final token = preferences.getStringList('adminProfile')![1];
    try {
      final response = await dio.delete(
        'https://onehealthhospital.site/api/appointment/$id',
        options: Options(headers: {
          'auth-token': token,
        }),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        print(response.data.toString());
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
