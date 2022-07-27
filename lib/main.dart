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
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyDJIYo19K2YtDiQaYaJVGpDX_7GZbEjLOg",
        authDomain: "one-health-ced00.firebaseapp.com",
        projectId: "one-health-ced00",
        storageBucket: "one-health-ced00.appspot.com",
        messagingSenderId: "880415117031",
        appId: "1:880415117031:web:2b5f33863a7f5cadcb1c42"),
  );
  runApp(const MyApp());
}

String webpageTitle = 'One Health Hospital';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'One Health Hospital',
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
