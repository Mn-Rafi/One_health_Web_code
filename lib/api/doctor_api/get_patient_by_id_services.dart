import 'package:dio/dio.dart';

class GetPatientByIdServices {
  Future<Response> getPatients(
      {required String userId, required String doctorToken}) async {
    Dio dio = Dio();
    final data = {
      "auth-token": doctorToken,
    };

    Response response = await dio.get(
        'https://onehealthhospital.online/api/user/$userId',
        options: Options(headers: data));

    return response;
  }
}
