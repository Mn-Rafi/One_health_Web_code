class DoctorProfileModel {
  final String name;
  final String email;
  final String qualification;
  final String department;
  final String experience;
  final String areaOfExpertise;
  final String opTimeStart;
  final String opTimeEnd;
  final String imagePath;
  final String? phoneNumber;
  final String? fee;
  final List days;
  DoctorProfileModel({
    required this.name,
    required this.email,
    required this.qualification,
    required this.department,
    required this.experience,
    required this.areaOfExpertise,
    required this.opTimeStart,
    required this.opTimeEnd,
    required this.imagePath,
    required this.phoneNumber,
    required this.fee,
    required this.days,
  });
}

DoctorProfileModel? doctorProfileModel;
