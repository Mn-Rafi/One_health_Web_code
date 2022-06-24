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

MenuController menuController = MenuController.instance;

NavigationController navigationController = NavigationController.instance;

LoginPageController loginPageController = LoginPageController.instance;

TimeController timeController = TimeController.instance;

ProfileController profileController = ProfileController.instance;

DoctorPatientsController doctorPatientsController =
    DoctorPatientsController.instance;

DoctorAppointmentsController doctorAppointmentsController =
    DoctorAppointmentsController.instance;

PasswordChangeController passwordChangeController =
    PasswordChangeController.instance;

DoctorProfileEditController doctorProfileEditController =
    DoctorProfileEditController.instance;

GetPatientByIDController getPatientByIDController =
    GetPatientByIDController.instance;

