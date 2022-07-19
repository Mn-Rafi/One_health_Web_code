import 'package:dio/dio.dart';

class DoctorAppointmetnsServices {
  Future<Response> getDoctorAppointments(
      {required String id, required String token}) async {
    print('Inside DoctorAppointmetn');
    Dio dio = Dio();
    final data = {
      "auth-token": token,
    };

    Response response = await dio.get(
        'https://onehealthhospital.online/api/appointment/doctor/$id',
        options: Options(headers: data));
    print(response.data);

    return response;
  }
}
