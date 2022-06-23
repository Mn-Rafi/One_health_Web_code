import 'dart:io';

class DoctorRegisterModel {
  final String name;
  final String email;
  final String phoneNumber;
  final String qualification;
  final String department;
  final String experience;
  final String expertise;
  final String password;
  final String startingTime;
  final String finishingTime;
  final List<int> days;
  final double feeAmount;
  final bool isRequested;
  final File image;
  DoctorRegisterModel({
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.qualification,
    required this.department,
    required this.experience,
    required this.expertise,
    required this.password,
    required this.startingTime,
    required this.finishingTime,
    required this.days,
    required this.feeAmount,
    required this.isRequested,
    required this.image,
  });
}
