import 'package:one_health_doctor_and_admin/helpers/local_navigator.dart';
import 'package:one_health_doctor_and_admin/widgets/side_menu.dart';
import 'package:flutter/material.dart';

class LargeScreen extends StatelessWidget {
  const LargeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          const Expanded(child: SideMenu()),
          Expanded(flex: 5, child: localNavigator())
        ],
      ),
    );
  }
}
