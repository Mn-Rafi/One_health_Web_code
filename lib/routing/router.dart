import 'package:one_health_doctor_and_admin/helpers/admin_department_response_model.dart';
import 'package:one_health_doctor_and_admin/pages/admin_appoinments/admin_appoinments.dart';
import 'package:one_health_doctor_and_admin/pages/admin_pages/admin_ambulance/admin_ambulance.dart';
import 'package:one_health_doctor_and_admin/pages/admin_pages/admin_dashboard/admin_dashboard.dart';
import 'package:one_health_doctor_and_admin/pages/admin_pages/admin_departments/admin_departments.dart';
import 'package:one_health_doctor_and_admin/pages/admin_pages/admin_doctors/admin_doctors.dart';
import 'package:one_health_doctor_and_admin/pages/admin_pages/admin_doctors/doctors_profile.dart';
import 'package:one_health_doctor_and_admin/pages/admin_pages/admin_patients/admin_patients.dart';
import 'package:one_health_doctor_and_admin/pages/admin_pages/admin_patients/admin_patients_profile.dart';
import 'package:one_health_doctor_and_admin/pages/admin_pages/admin_profile/admin_profile.dart';
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
    case adminDashBoardPage:
      return _getPageRoute(AdminDashboard());
    case adminAppointmentsPage:
      return _getPageRoute(AdminAppoinments(
        link: settings.arguments,
      ));
    case adminPatientsPage:
      return _getPageRoute(AdminPatientsPage());
    case adminDoctorsPage:
      return _getPageRoute(AdminDoctorsPage());
    case adminDepartmentsPage:
      return _getPageRoute(AdminDepartment());
    case adminProfilePage:
      return _getPageRoute(AdminProfile());
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
    case adminAmbulance:
      return _getPageRoute(const AdminAmbulance());
    case adminDoctorProfileViewPage:
      return _getPageRoute(DoctorProfileAdminSide(doctor: settings.arguments));
    case adminPatientProfileViewPage:
      return _getPageRoute(PatientProfileAdminSide(
        patient: settings.arguments,
      ));
    case prescribeMedicinePage:
      return _getPageRoute(PrescribeMedicine(
        arguments: settings.arguments,
      ));
    case authenticationPageView:
      return _getPageRoute(const ConfirmLogoutPage());
    case doctorChangePasswordPage:
      return _getPageRoute(DoctorChangePassword(
        map: settings.arguments,
      ));
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
