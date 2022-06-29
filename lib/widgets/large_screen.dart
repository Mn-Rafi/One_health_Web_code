

import 'package:flutter/material.dart';
import 'package:one_health_doctor_and_admin/constants/controller.dart';
import 'package:one_health_doctor_and_admin/helpers/local_navigator.dart';
import 'package:one_health_doctor_and_admin/widgets/side_menu.dart';
import 'package:one_health_doctor_and_admin/widgets/side_menu_admin.dart';

class LargeScreen extends StatelessWidget {
  const LargeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
              child: loginPageController.pageTitle.value == "Doctor"
                  ? SideMenu()
                  : SideMenuAdmin()),
          Expanded(flex: 5, child: localNavigator())
        ],
      ),
    );
  }
}
