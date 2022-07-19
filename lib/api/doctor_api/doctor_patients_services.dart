import 'package:dio/dio.dart';

class DoctorPatientsServices {
  Future<Response> getDoctorPatients(
      {required String id, required String token}) async {
    print('Inside DoctorPatientsServices');
    Dio dio = Dio();
    final data = {
      "auth-token": token,
    };

    Response response = await dio.get(
        'https://onehealthhospital.online/api/user/doctor/$id',
        options: Options(headers: data));
    print(response.data);

    return response;
  }
}
