import 'package:dio/dio.dart';
import 'package:one_health_doctor_and_admin/helpers/doctor_profile_model.dart';

class DoctorProfileServices {
  Future<Response> getDoctorProfile(
      {required String id, required String token}) async {
    // print('Inside DoctorProfileServices');
    Dio dio = Dio();
    final data = {
      "auth-token": token,
    };

    Response response = await dio.get(
        'https://onehealthhospital.site/api/doctor/$id',
        options: Options(headers: data));
    // print(response.data);
    print('XXXXXXXXXXXXXXXXXXXXXXXXXXXXxx');
    print(response.data['doctor']['days']);
    print('XXXXXXXXXXXXXXXXXXXXXXXXXXXXxx');
   

    return response;
  }
}
