import 'package:dio/dio.dart';
import 'package:one_health_doctor_and_admin/api/api_utilities.dart';

class DoctorLoginSerices {
  Future<Response> getUserResponseData(
      {required String email, required String password}) async {
    Dio dio = Dio();
    final data = {
      "email": email,
      "password": password,
    };
    Response response = await dio
        .post('https://onehealthhospital.site/api/doctor/login', data: data);

    return response;
  }

  Future requestOtp({required String number}) async {
    Dio dio = Dio();
    Response response = await dio.post(
        ApiUtilities.baseUrl + ApiUtilities.doctorRequestOtp,
        data: {"phone": "+91$number"});
    return response;
  }

  Future<Response> verifyOtp(
      {required String mobileNumber, required int otp}) async {
    Dio dio = Dio();
    final data = {"phone": '+91$mobileNumber', "otpVerify": otp};
    Response response = await dio
        .post(ApiUtilities.baseUrl + ApiUtilities.doctorVerifyOtp, data: data);
    return response;
  }
}
