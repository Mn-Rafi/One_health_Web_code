import 'package:one_health_doctor_and_admin/pages/appointments/appointments.dart';
import 'package:one_health_doctor_and_admin/pages/authentication/authentication.dart';
import 'package:one_health_doctor_and_admin/pages/dashboard/dashboard.dart';
import 'package:one_health_doctor_and_admin/pages/doctor/change_password_screen.dart';
import 'package:one_health_doctor_and_admin/pages/doctor/edit_profile.dart';
import 'package:one_health_doctor_and_admin/pages/patient_profile/patient_profile.dart';
import 'package:one_health_doctor_and_admin/pages/patient_profile/prescribe_medicine.dart';
import 'package:one_health_doctor_and_admin/pages/patients/patients.dart';
import 'package:one_health_doctor_and_admin/pages/profile/profile.dart';
import 'package:one_health_doctor_and_admin/routing/routes.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case dashBoardPageView:
      return _getPageRoute(const DashBoard());
    case patientsPageView:
      return _getPageRoute(const PatientsPage());
    case appointmentsPageView:
      return _getPageRoute(const AppointmentsPage());
    case profilePageView:
      return _getPageRoute(const ProfilePage());
    case patientProfilePageView:
      return _getPageRoute(PatientProfilePage(
        map: settings.arguments,
      ));
    case prescribeMedicinePage:
      return _getPageRoute(PrescribeMedicine(
        arguments: settings.arguments,
      ));
    case authenticationPageView:
      return _getPageRoute(const ConfirmLogoutPage());
    case doctorChangePasswordPage:
      return _getPageRoute(const DoctorChangePassword());
    case doctorEditProfile:
      return _getPageRoute(DoctorEditProfile());
    case confirmLogoutPageRoute:
      return _getPageRoute(const ConfirmLogoutPage());
    default:
      return _getPageRoute(const DashBoard());
  }
}

PageRoute _getPageRoute(Widget child) {
  return MaterialPageRoute(builder: (context) => child);
}
