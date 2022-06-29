
class DepartmentResponseModel {
  final List<String>? departmentList;
  final List<List<DoctorProfileModel>>? doctorsList;
  DepartmentResponseModel({
    this.departmentList,
    this.doctorsList,
  });
}

class DoctorProfileModel {
  Doctor? doctor;
  String? message;

  DoctorProfileModel({this.doctor, this.message});

  DoctorProfileModel.fromJson(Map<String, dynamic> json) {
    doctor =
        json['doctor'] != null ? new Doctor.fromJson(json['doctor']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (doctor != null) {
      data['doctor'] = doctor!.toJson();
    }
    data['message'] = message;
    return data;
  }
}

class Doctor {
  String? sId;
  String? name;
  String? email;
  String? department;
  String? phone;
  String? qualification;
  String? expertise;
  String? experience;
  List<int>? days;
  String? startTime;
  String? endTime;
  int? fee;
  String? password;
  String? image;
  bool? admin;
  bool? active;
  bool? request;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Doctor(
      {this.sId,
      this.name,
      this.email,
      this.department,
      this.phone,
      this.qualification,
      this.expertise,
      this.experience,
      this.days,
      this.startTime,
      this.endTime,
      this.fee,
      this.password,
      this.image,
      this.admin,
      this.active,
      this.request,
      this.createdAt,
      this.updatedAt,
      this.iV});

  Doctor.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    email = json['email'];
    department = json['department'];
    phone = json['phone'];
    qualification = json['qualification'];
    expertise = json['expertise'];
    experience = json['experience'];
    days = json['days'].cast<int>();
    startTime = json['startTime'];
    endTime = json['endTime'];
    fee = json['fee'];
    password = json['password'];
    image = json['image'];
    admin = json['admin'];
    active = json['active'];
    request = json['request'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    data['email'] = email;
    data['department'] = department;
    data['phone'] = phone;
    data['qualification'] = qualification;
    data['expertise'] = expertise;
    data['experience'] = experience;
    data['days'] = days;
    data['startTime'] = startTime;
    data['endTime'] = endTime;
    data['fee'] = fee;
    data['password'] = password;
    data['image'] = image;
    data['admin'] = admin;
    data['active'] = active;
    data['request'] = request;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
  }
}
