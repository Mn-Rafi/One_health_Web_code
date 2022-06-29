import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:one_health_doctor_and_admin/constants/styles.dart';
import 'package:one_health_doctor_and_admin/routing/routes.dart';

class MenuController extends GetxController {
  static MenuController instance = Get.find();
  var acttiveItem = dashBoardPageView.obs;
  var hoverItem = "".obs;
  changeActiveItemto(String itemName) {
    acttiveItem.value = itemName;
  }

  onHover(String itemName) {
    if (!isActive(itemName)) hoverItem.value = itemName;
  }

  isActive(String itemName) => acttiveItem.value == itemName;
  isHovering(String itemName) => hoverItem.value == itemName;

  Widget returnIconFor(String itemName) {
    switch (itemName) {
      case dashBoardPageView:
        return _customIcon(Icons.trending_up, itemName);
      case adminDashBoardPage:
        return _customIcon(Icons.trending_up, itemName);
      case patientsPageView:
        return _customIcon(Icons.people, itemName);
      case adminPatientsPage:
        return _customIcon(Icons.people, itemName);
      case appointmentsPageView:
        return _customIcon(Icons.calendar_month, itemName);
      case adminAppointmentsPage:
        return _customIcon(Icons.calendar_month, itemName);
      case profilePageView:
        return _customIcon(Icons.person, itemName);
      case authenticationPageView:
        return _customIcon(Icons.exit_to_app, itemName);
      case adminDoctorsPage:
        return _customIcon(Icons.medical_services_outlined, itemName);
      case adminDepartmentsPage:
        return _customIcon(Icons.category, itemName);
      case adminProfilePage:
        return _customIcon(Icons.admin_panel_settings_outlined, itemName);
      default:
        return _customIcon(Icons.exit_to_app, itemName);
    }
  }

  Widget _customIcon(IconData icon, String itemName) {
    if (isActive(itemName)) {
      return Icon(
        icon,
        size: 22,
        color: dark,
      );
    }
    return Icon(
      icon,
      color: isHovering(itemName) ? dark : lightGrey,
    );
  }
}
