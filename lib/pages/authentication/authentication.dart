import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:one_health_doctor_and_admin/constants/controller.dart';
import 'package:one_health_doctor_and_admin/constants/styles.dart';
import 'package:one_health_doctor_and_admin/pages/login/loginpage.dart';
import 'package:one_health_doctor_and_admin/routing/routes.dart';

class ConfirmLogoutPage extends StatelessWidget {
  const ConfirmLogoutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SizedBox(
      width: 500,
      height: 200,
      child: Card(
          margin: const EdgeInsets.all(30),
          color: lightGreyTwo,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Flexible(
                  child: Text(
                    'Do You Really Want to Logout?',
                    style: mainHeaderStyle.copyWith(
                        color: Colors.black, fontSize: 25),
                  ),
                ),
                Flexible(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 50.0, vertical: 10),
                        child: ElevatedButton(
                            onPressed: () {
                              if (loginPageController.pageTitle.value ==
                                  'Doctor') {
                                menuController
                                    .changeActiveItemto(dashBoardPageView);
                                navigationController.navigateUntil(
                                    dashBoardPageView,
                                    arguments: '');
                              } else {
                                menuController
                                    .changeActiveItemto(adminDashBoardPage);
                                navigationController.navigateUntil(
                                    adminDashBoardPage,
                                    arguments: '');
                              }
                            },
                            child: Text('CANCEL',
                                style: normalTextStyle.copyWith(
                                    color: Colors.white))),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 50.0, vertical: 10),
                        child: ElevatedButton(
                            style:
                                ElevatedButton.styleFrom(primary: Colors.red),
                            onPressed: () {
                              menuController
                                  .changeActiveItemto(dashBoardPageView);
                              navigationController.navigateUntil(
                                  dashBoardPageView,
                                  arguments: '');
                              Get.offAll(LoginPage());
                            },
                            child: Text('LOGOUT',
                                style: normalTextStyle.copyWith(
                                    color: Colors.white))),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )),
    ));
  }
}
