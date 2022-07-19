import 'package:dio/dio.dart';

class PrescribeMedicineServices {
  Future<Response> getPrescriptionList(
      {required String id, required String token}) async {
    Dio dio = Dio();

    var formData = {
      "auth-token": token,
    };
    Response response = await dio.get(
        'https://onehealthhospital.site/api/prescription/$id',
        options: Options(headers: formData));
    print(response.data);
    return response;
  }

  Future<Response> postNewPrescription({
    required String doctorId,
    required String userId,
    required String userName,
    required String doctorName,
    required List<String> medicines,
    required List<String> dosage,
    required List<String> prescribedFor,
    required String token,
  }) async {
    print('again trying here');
    Dio dio = Dio();
    final date = DateTime.now();
    var formData = {
      "doctorId": doctorId,
      "userId": userId,
      "user": userName,
      "doctor": doctorName,
      "medicine": medicines,
      "dosage": dosage,
      "prescribedFor": prescribedFor,
      "date": date.toString(),
    };

    print('again trying here 1');
    var header = {"auth-token": token};
    final response = await dio.post(
        'https://onehealthhospital.site/api/prescription',
        data: formData,
        options: Options(headers: header));
    print('again trying here returned');
    print(response.data);
    return response;
  }
}
