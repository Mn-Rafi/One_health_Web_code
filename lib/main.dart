import 'package:one_health_doctor_and_admin/controllers/doctor_appointments_controller.dart';
import 'package:one_health_doctor_and_admin/controllers/doctor_password_change_controller.dart';
import 'package:one_health_doctor_and_admin/controllers/doctor_patients_controller.dart';
import 'package:one_health_doctor_and_admin/controllers/doctor_profile_edit_controller.dart';
import 'package:one_health_doctor_and_admin/controllers/get_patient_by_id_controller.dart';
import 'package:one_health_doctor_and_admin/controllers/login_controllers.dart';
import 'package:one_health_doctor_and_admin/controllers/menu_controllers.dart';
import 'package:one_health_doctor_and_admin/controllers/navigation_controller.dart';
import 'package:one_health_doctor_and_admin/controllers/prescribe_medicine_controller.dart';
import 'package:one_health_doctor_and_admin/controllers/profile_controller.dart';
import 'package:one_health_doctor_and_admin/controllers/time_controller.dart';
import 'package:one_health_doctor_and_admin/pages/login/loginpage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  Get.put(MenuController());
  Get.put(NavigationController());
  Get.put(LoginPageController());
  Get.put(TimeController());
  Get.put(ProfileController());
  Get.put(DoctorPatientsController());
  Get.put(DoctorAppointmentsController());
  Get.put(PasswordChangeController());
  Get.put(DoctorProfileEditController());
  Get.put(GetPatientByIDController());
  Get.put(PrescribeMedicineController());
  runApp(const MyApp());
}

String webpageTitle = 'Doctor';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: webpageTitle,
        theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            textTheme:
                GoogleFonts.mulishTextTheme(Theme.of(context).textTheme).apply(
              bodyColor: Colors.black,
            ),
            pageTransitionsTheme: const PageTransitionsTheme(builders: {
              TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
              TargetPlatform.android: FadeUpwardsPageTransitionsBuilder()
            }),
            primaryColor: Colors.blue),
        home: LoginPage());
  }
}
