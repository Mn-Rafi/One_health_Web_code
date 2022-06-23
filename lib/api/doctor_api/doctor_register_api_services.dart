import 'package:dio/dio.dart';
import 'package:one_health_doctor_and_admin/api/api_utilities.dart';
import 'package:one_health_doctor_and_admin/helpers/doctor_register_model.dart';

class DoctorRegisterServices {
  Future<Response> registerUserResponse(
      {required DoctorRegisterModel doctorRegisterModel}) async {
    Dio dio = Dio();
    String fileName = doctorRegisterModel.image.path.split('/').last;

    var formData = {
      "name": doctorRegisterModel.name,
      "email": doctorRegisterModel.email,
      "phone": doctorRegisterModel.phoneNumber,
      "qualification": doctorRegisterModel.qualification,
      "department": doctorRegisterModel.department,
      "experience": doctorRegisterModel.experience,
      "expertise": doctorRegisterModel.expertise,
      "password": doctorRegisterModel.password,
      "startingTime": doctorRegisterModel.startingTime,
      "finishingTime": doctorRegisterModel.finishingTime,
      "days": doctorRegisterModel.days,
      "fee": doctorRegisterModel.feeAmount,
      "request": true,
      "image": fileName,
    };
    Response response = await dio.post(
        ApiUtilities.baseUrl + ApiUtilities.doctorRegisterPath,
        data: formData);

    return response;
  }
}
