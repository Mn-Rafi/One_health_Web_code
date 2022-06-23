import 'package:one_health_doctor_and_admin/helpers/responsiveness.dart';
import 'package:one_health_doctor_and_admin/widgets/large_screen.dart';
import 'package:one_health_doctor_and_admin/widgets/side_menu.dart';
import 'package:one_health_doctor_and_admin/widgets/small_screen.dart';
import 'package:one_health_doctor_and_admin/widgets/top_nav_bar.dart';
import 'package:flutter/material.dart';

class SiteLayout extends StatelessWidget {
  SiteLayout({Key? key}) : super(key: key);

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: const Drawer(
        child: SideMenu(),
      ),
      appBar: topNavBar(context, scaffoldKey),
      body: const ResponsiveWidget(
          largeScreen: LargeScreen(), smallScreen: SmallScreen()),
    );
  }
}
