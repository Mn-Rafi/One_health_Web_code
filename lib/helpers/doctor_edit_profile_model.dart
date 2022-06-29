

class DoctorEditProfileModel {
  final String name;
  final String email;
  final String phoneNumber;
  final String qualification;
  final String department;
  final String experience;
  final String expertise;
  final String startingTime;
  final String finishingTime;
  final List<int> days;
  final int feeAmount;
  final bool isRequested;
  final String imagePath;
  final bool isAdmin;
  // final File? image;
  DoctorEditProfileModel({
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.qualification,
    required this.department,
    required this.experience,
    required this.expertise,
    required this.startingTime,
    required this.finishingTime,
    required this.days,
    required this.feeAmount,
    required this.isRequested,
    required this.imagePath,
    required this.isAdmin,
  });
}
