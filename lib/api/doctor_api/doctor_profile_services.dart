import 'package:dio/dio.dart';

class DoctorProfileServices {
  Future<Response> getDoctorProfile(
      {required String id, required String token}) async {
    Dio dio = Dio();
    final data = {
      "auth-token": token,
    };

    Response response = await dio.get(
        'https://onehealthhospital.site/api/doctor/$id',
        options: Options(headers: data));

    return response;
  }
}

class AdminProfileServices {
  Future<Response> getAdminProfile({required String token}) async {
    Dio dio = Dio();
    final data = {
      "auth-token": token,
    };

    Response response = await dio.get(
        'https://onehealthhospital.site/api/admin/',
        options: Options(headers: data));

    return response;
  }
  Future<Response> getDoctorasAdminProfile({required String token, required String id}) async {
    Dio dio = Dio();
    final data = {
      "auth-token": token,
    };

    Response response = await dio.get(
        'https://onehealthhospital.site/api/doctor/$id',
        options: Options(headers: data));

    return response;
  }
}
