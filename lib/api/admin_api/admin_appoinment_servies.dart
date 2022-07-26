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
        'https://onehealthhospital.online/api/appointment/$link',
        options: Options(headers: {
          'auth-token': token,
        }),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        // print(response.data['appointment'].length);
        List<int> feeCollection = [];
        List<String> dateCollection = [];
        AdminAppointmentsListModel? adminAppointmentsListModel =
            AdminAppointmentsListModel.fromJson(response.data);
        AdminAppointmentsListModel? _adminAppointmentsListModel =
            AdminAppointmentsListModel.fromJson(response.data);

        List<Appointment?> appointment =
            _adminAppointmentsListModel.appointment!;
        int lengthIs = appointment.length;
        for (int i = 0; i < lengthIs; i++) {
          int feeAmount = appointment[i]!.fee!;
          for (int j = i + 1; j < lengthIs; j++) {
            if (appointment[i]!.date.toString().substring(0, 10) ==
                appointment[j]!.date.toString().substring(0, 10)) {
              feeAmount += appointment[j]!.fee!;
              appointment.removeAt(j);
              j--;
              lengthIs--;
            }
          }
          feeCollection.add(feeAmount);
          dateCollection.add(appointment[i]!.date.toString().substring(0, 10));
        }
        print('total fee collection: $feeCollection');
        print('total date collection: $dateCollection');
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

  Future<List<AmountChartModelClass>?> getAllAppoinmentsforChart(
      {required String link}) async {
    List<AmountChartModelClass> amountDataChart = [];
    Dio dio = Dio();
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final token = preferences.getStringList('adminProfile')![1];
    try {
      final response = await dio.get(
        'https://onehealthhospital.online/api/appointment/$link',
        options: Options(headers: {
          'auth-token': token,
        }),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        // print(response.data['appointment'].length);
        List<int> feeCollection = [];
        List<String> dateCollection = [];
        AdminAppointmentsListModel? adminAppointmentsListModel =
            AdminAppointmentsListModel.fromJson(response.data);

        List<Appointment?> appointment =
            adminAppointmentsListModel.appointment!;
        int lengthIs = appointment.length;
        for (int i = 0; i < lengthIs; i++) {
          int feeAmount = appointment[i]!.fee!;
          for (int j = i + 1; j < lengthIs; j++) {
            if (appointment[i]!.date.toString().substring(0, 10) ==
                appointment[j]!.date.toString().substring(0, 10)) {
              feeAmount += appointment[j]!.fee!;
              appointment.removeAt(j);
              j--;
              lengthIs--;
            }
          }
          feeCollection.add(feeAmount);
          dateCollection.add(appointment[i]!.date.toString().substring(0, 10));
          amountDataChart.add(AmountChartModelClass(
            date: dateCollection[i],
            amount: feeCollection[i],
          ));
        }
        print('total fee collection: $feeCollection');
        print('total date collection: $dateCollection');
        return amountDataChart;
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
        'https://onehealthhospital.online/api/appointment/status/$id',
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
        'https://onehealthhospital.online/api/appointment/$id',
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

class AmountChartModelClass {
  final String date;
  final int amount;
  AmountChartModelClass({required this.date, required this.amount});
}
