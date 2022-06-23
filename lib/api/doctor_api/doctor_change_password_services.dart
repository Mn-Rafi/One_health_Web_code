import 'package:dio/dio.dart';

class DoctorChangePasswordServices {
  Future<Response> changePassword(String oldPassword, String newPassword,
      String id, String authToken) async {
    Dio dio = Dio();
    var formData = {
      "oldPassword": oldPassword,
      "newPassword": newPassword,
      "cPassword": newPassword,
    };
    Response reponse = await dio.put(
        'https://onehealthhospital.site/api/doctor/changepassword/$id',
        data: formData,
        options: Options(headers: {
          "auth-token": authToken,
        }));
    print(reponse.data["message"]);
    return reponse;
  }
}
