import 'package:dio/dio.dart';
import 'package:one_health_doctor_and_admin/helpers/doctor_edit_profile_model.dart';

class EditDoctorProfileServise {
  editDoctorProfile(
      {required DoctorEditProfileModel doctorEditProfileModel,
      required String id,
      required String token}) async {
    print('**********************************3');
    Dio dio = Dio();
    String fileName = doctorEditProfileModel.imagePath.path.split('/').last;
    FormData formData = FormData.fromMap({
      "name": doctorEditProfileModel.name,
      "qualification": doctorEditProfileModel.qualification,
      "department": doctorEditProfileModel.department,
      "email": doctorEditProfileModel.email,
      "experience": doctorEditProfileModel.experience,
      "expertise": doctorEditProfileModel.expertise,
      "days": doctorEditProfileModel.days,
      "startTime": doctorEditProfileModel.startingTime,
      "endTime": doctorEditProfileModel.finishingTime,
      "fee": doctorEditProfileModel.feeAmount,
      "admin": doctorEditProfileModel.isAdmin,
      "image": await MultipartFile.fromFile(
          doctorEditProfileModel.imagePath.path,
          filename: fileName),
      // doctorEditProfileModel.imagePath,
      "active": doctorEditProfileModel.isActive ?? true,
      "request": false,
    });
    Response response = await dio
        .put('https://onehealthhospital.online/api/doctor/$id',
            data: formData,
            options: Options(headers: {
              "auth-token": token,
            }))
        .timeout(const Duration(seconds: 10));
    print('**********************************4');
    return response;
  }
}
