import 'package:one_health_doctor_and_admin/constants/controller.dart';
import 'package:one_health_doctor_and_admin/constants/styles.dart';
import 'package:one_health_doctor_and_admin/helpers/responsiveness.dart';
import 'package:one_health_doctor_and_admin/routing/routes.dart';
import 'package:one_health_doctor_and_admin/widgets/custom_text.dart';
import 'package:one_health_doctor_and_admin/widgets/side_menu_items.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SideMenuAdmin extends StatelessWidget {
  const SideMenuAdmin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      color: light,
      child: ListView(
        children: [
          if (ResponsiveWidget.isScreenSmall(context))
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  height: 40,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: width / 48,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: Image.asset(
                        'assets/icons/one_health_logo.png',
                        width: 100,
                        height: 100,
                      ),
                    ),
                    const Flexible(
                        child: CustomText(
                      text: "Dash Board",
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontColor: active,
                    )),
                    const SizedBox(
                      height: 40,
                    ),
                  ],
                ),
              ],
            ),
          const SizedBox(
            height: 40,
          ),
          Divider(
            color: lightGrey.withOpacity(0.1),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: sideMenuitemsAdmin
                .map((item) => SideMenuItem(
                    itemName: item,
                    onTap: () {
                      if (!menuController.isActive(item)) {
                        menuController.changeActiveItemto(item);

                        if (ResponsiveWidget.isScreenSmall(context)) Get.back();
                        navigationController.navigateTo(item, arguments: '');
                      }
                    }))
                .toList(),
          )
        ],
      ),
    );
  }
}
