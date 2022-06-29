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
  final bool isAdmin;
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
    required this.isAdmin,
  });
}

class AdminProfileModel {
  final String id;
  final String name;
  final String email;
  final String? ismainAdmin;
  final String? imagePath;
  final String? qualification;
  final String? department;
  final String? experience;
  final String? areaOfExpertise;
  final String? opTimeStart;
  final String? opTimeEnd;
  final List<int>? days;
  final String? fee;
  AdminProfileModel({
    required this.id,
    required this.name,
    required this.email,
    this.ismainAdmin,
    required this.imagePath,
    this.qualification,
    this.department,
    this.experience,
    this.areaOfExpertise,
    this.opTimeStart,
    this.opTimeEnd,
    this.days,
    this.fee,
  });
}
