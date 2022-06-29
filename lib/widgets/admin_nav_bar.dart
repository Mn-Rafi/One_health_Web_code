import 'package:one_health_doctor_and_admin/constants/controller.dart';
import 'package:one_health_doctor_and_admin/constants/styles.dart';
import 'package:one_health_doctor_and_admin/helpers/doctor_profile_model.dart';
import 'package:one_health_doctor_and_admin/helpers/responsiveness.dart';
import 'package:one_health_doctor_and_admin/widgets/custom_text.dart';
import 'package:flutter/material.dart';

AppBar adminTopNavBar(BuildContext context, GlobalKey<ScaffoldState> key) =>
    AppBar(
      elevation: 0,
      leading: !ResponsiveWidget.isScreenSmall(context)
          ? Row(
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 14),
                  child: Image.asset(
                    "assets/icons/one_health_logo.png",
                    width: 28,
                  ),
                )
              ],
            )
          : IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                key.currentState!.openDrawer();
              },
            ),
      title: FutureBuilder<AdminProfileModel?>(
          future: profileController.adminProfileResponse(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return Center(
                  child: Text(
                    '${snapshot.error.toString()} occurred',
                    style: const TextStyle(fontSize: 18),
                  ),
                );
              }
              return Row(
                children: [
                  Visibility(
                      visible: !ResponsiveWidget.isScreenSmall(context),
                      child: const CustomText(
                        text: 'One Health Hospital',
                        fontColor: lightGrey,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      )),
                  Expanded(child: Container()),
                  Container(
                    width: 1,
                    height: 22,
                    color: lightGrey,
                  ),
                  const SizedBox(
                    width: 24,
                  ),
                  CustomText(
                    text: snapshot.data!.name,
                    fontColor: lightGrey,
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                ],
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }),
      iconTheme: const IconThemeData(color: dark),
      backgroundColor: light,
    );
