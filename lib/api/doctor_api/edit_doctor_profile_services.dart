import 'package:dio/dio.dart';
import 'package:one_health_doctor_and_admin/helpers/doctor_edit_profile_model.dart';
import 'package:one_health_doctor_and_admin/helpers/doctor_profile_model.dart';

class EditDoctorProfileServise {
  editDoctorProfile(
      {required DoctorEditProfileModel doctorEditProfileModel,
      required String id,
      required String token}) async {
    Dio dio = Dio();
    var formData = {
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
      "image":
          'https://res.cloudinary.com/dkj6u28th/image/upload/v1652852989/Profile/sxgyrh6qsm2zmzmbmokn.webp',
    };
    print('AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA');
    print(doctorProfileModel!.imagePath);
    print('AAAAAAAAAAAAAAAAAAAAAAAAAAAAAaaaaaa');
    print(formData);
    print('AAAAAAAAAAAAAAAAAAAAAAAAAAAAAaaaaaa');
    print(id);
    print('AAAAAAAAAAAAAAAAAAAAAAAAAAAAAaaaaaa');
    print(token);
    print('AAAAAAAAAAAAAAAAAAAAAAAAAAAAAaaaaaa');
    Response response =
        await dio.put('https://onehealthhospital.site/api/doctor/$id',
            data: formData,
            options: Options(headers: {
              "auth-token": token,
              "Access-Control-Allow-Origin":
                  "*", // Required for CORS support to work
              "Access-Control-Allow-Credentials":
                  true, // Required for cookies, authorization headers with HTTPS
              "Access-Control-Allow-Headers":
                  "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
              "Access-Control-Allow-Methods": "PUT, OPTIONS"
            }));
    print(response.data);
    return response;
  }
}
