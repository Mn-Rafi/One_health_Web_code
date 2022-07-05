class PatientsProfileModel {
  List<User>? user;
  String? message;

  PatientsProfileModel({this.user, this.message});

  PatientsProfileModel.fromJson(Map<String, dynamic> json) {
    if (json['user'] != null) {
      user = <User>[];
      json['user'].forEach((v) {
        user!.add(User.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (user != null) {
      data['user'] = user!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    return data;
  }
}

class User {
  String? sId;
  String? firstName;
  String? secondName;
  int? age;
  String? gender;
  String? email;
  String? phone;
  String? blood;
  String? password;
  String? image;
  bool? access;
  String? createdAt;
  String? updatedAt;
  int? iV;

  User(
      {this.sId,
      this.firstName,
      this.secondName,
      this.age,
      this.gender,
      this.email,
      this.phone,
      this.blood,
      this.password,
      this.image,
      this.access,
      this.createdAt,
      this.updatedAt,
      this.iV});

  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    firstName = json['firstName'];
    secondName = json['secondName'];
    age = json['age'];
    gender = json['gender'];
    email = json['email'];
    phone = json['phone'];
    blood = json['blood'];
    password = json['password'];
    image = json['image'];
    access = json['access'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['firstName'] = firstName;
    data['secondName'] = secondName;
    data['age'] = age;
    data['gender'] = gender;
    data['email'] = email;
    data['phone'] = phone;
    data['blood'] = blood;
    data['password'] = password;
    data['image'] = image;
    data['access'] = access;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
  }
}
