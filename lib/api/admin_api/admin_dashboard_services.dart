import 'package:dio/dio.dart';
import 'package:one_health_doctor_and_admin/pages/admin_pages/admin_dashboard/daily_income_chart.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AdminDashBoardServices {
  Future<DoctorAndUserCardModel?> getDoctorsandUsersCard() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final token = preferences.getStringList('adminProfile')![1];
    Dio dio = Dio();
    final data = {
      "auth-token": token,
    };
    try {
      Response response = await dio.get(
          'https://onehealthhospital.online/api/chart/card',
          options: Options(headers: data));
      if (response.statusCode == 200 || response.statusCode == 201) {
        DoctorAndUserCardModel doctorAndUserCardModel =
            DoctorAndUserCardModel.fromJson(response.data);
        return doctorAndUserCardModel;
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

  AmountandDateChartModel? amountChartmodel;

  Future<List<AmountANdDateSeperate>?> getAmountChartData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final token = preferences.getStringList('adminProfile')![1];
    final List<AmountANdDateSeperate> listOfData = [];
    Dio dio = Dio();
    final data = {
      "auth-token": token,
    };
    try {
      Response response = await dio.get(
          'https://onehealthhospital.online/api/chart/bar',
          options: Options(headers: data));
      if (response.statusCode == 200 || response.statusCode == 201) {
        AmountandDateChartModel amountandDateChartModel =
            AmountandDateChartModel.fromJson(response.data);
        for (int i = 0; i < amountandDateChartModel.amount!.length; i++) {
          AmountANdDateSeperate amountChart = AmountANdDateSeperate(
            amount: amountandDateChartModel.amount![i],
            date: amountandDateChartModel.dates![i].toString(),
          );
          listOfData.add(amountChart);
        }
        return listOfData;
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

  Future<List<AppointmentStatusChartModelData>?>
      getAppointmentsChartData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final token = preferences.getStringList('adminProfile')![1];
    final List<AppointmentStatusChartModelData> listOfData = [];
    Dio dio = Dio();
    final data = {
      "auth-token": token,
    };
    try {
      Response response = await dio.get(
          'https://onehealthhospital.online/api/chart/pie',
          options: Options(headers: data));
      if (response.statusCode == 200 || response.statusCode == 201) {
        AppointmentStatusChartModel appointmentchartmdelList =
            AppointmentStatusChartModel.fromJson(response.data);
        for (int i = 0; i < appointmentchartmdelList.status!.length; i++) {
          AppointmentStatusChartModelData amountChart =
              AppointmentStatusChartModelData(
            status: appointmentchartmdelList.status![i],
            count: appointmentchartmdelList.count![i],
          );
          listOfData.add(amountChart);
        }
        return listOfData;
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

class DoctorAndUserCardModel {
  List<int>? doctor;
  List<int>? user;
  String? message;

  DoctorAndUserCardModel(
      {required this.doctor, required this.user, required this.message});

  DoctorAndUserCardModel.fromJson(Map<String, dynamic> json) {
    doctor = json['doctor'].cast<int>();
    user = json['user'].cast<int>();
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['doctor'] = doctor;
    data['user'] = user;
    data['message'] = message;
    return data;
  }
}

class AmountandDateChartModel {
  List<String>? dates;
  List<int>? amount;
  String? message;

  AmountandDateChartModel(
      {required this.dates, required this.amount, this.message});

  AmountandDateChartModel.fromJson(Map<String, dynamic> json) {
    dates = json['dates'].cast<String>();
    amount = json['amount'].cast<int>();
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['dates'] = dates;
    data['amount'] = amount;
    data['message'] = message;
    return data;
  }
}

class AmountANdDateSeperate {
  String? date;
  int? amount;

  AmountANdDateSeperate({required this.date, required this.amount});
}

class AppointmentStatusChartModel {
  List<String>? status;
  List<int>? count;
  String? message;

  AppointmentStatusChartModel({this.status, this.count, this.message});

  AppointmentStatusChartModel.fromJson(Map<String, dynamic> json) {
    status = json['status'].cast<String>();
    count = json['count'].cast<int>();
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['count'] = count;
    data['message'] = message;
    return data;
  }
}

class AppointmentStatusChartModelData {
  final String status;
  final int count;

  AppointmentStatusChartModelData({required this.status, required this.count});
}
