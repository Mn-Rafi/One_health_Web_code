import 'package:dio/dio.dart';
import 'package:one_health_doctor_and_admin/api/api_utilities.dart'; 

class AdminLoginSerices {
  Future<Response> getUserResponseData(
        {required String email, required String password}) async {
    Dio dio = Dio();
    final data = {
      "email": email,
      "password": password,
    };
    Response response = await dio
        .post(ApiUtilities.baseUrl + ApiUtilities.adminLoginPath, data: data);

    return response;
  }
}
