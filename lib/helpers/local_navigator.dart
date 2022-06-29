import 'package:flutter/material.dart';
import 'package:one_health_doctor_and_admin/constants/controller.dart';
import 'package:one_health_doctor_and_admin/routing/router.dart';
import 'package:one_health_doctor_and_admin/routing/routes.dart';

Navigator localNavigator() {
  if (loginPageController.pageTitle.value != "Doctor") {
    menuController.changeActiveItemto(adminDashBoardPage);
  }
  return Navigator(
    key: navigationController.navigatorKey,
    onGenerateRoute: generateRoute,
    initialRoute: loginPageController.pageTitle.value == "Doctor"
        ? dashBoardPageView
        : adminDashBoardPage,
  );
}
