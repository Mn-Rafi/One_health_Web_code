import 'package:one_health_doctor_and_admin/constants/controller.dart';
import 'package:one_health_doctor_and_admin/constants/styles.dart';
import 'package:one_health_doctor_and_admin/helpers/doctor_profile_model.dart';
import 'package:one_health_doctor_and_admin/helpers/responsiveness.dart';
import 'package:one_health_doctor_and_admin/widgets/custom_text.dart';
import 'package:flutter/material.dart';

AppBar topNavBar(BuildContext context, GlobalKey<ScaffoldState> key) => AppBar(
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
      title: FutureBuilder<DoctorProfileModel?>(
          future: profileController.doctorProfileResponse(),
          builder: (context, AsyncSnapshot<DoctorProfileModel?> snapshot) {
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
                    text: 'Dr. ${snapshot.data!.name}',
                    fontColor: lightGrey,
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white),
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      margin: const EdgeInsets.all(2),
                      child: CircleAvatar(
                          backgroundColor: light,
                          child: Image.network(snapshot.data!.imagePath)),
                    ),
                  )
                ],
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }),
      iconTheme: const IconThemeData(color: dark),
      backgroundColor: light,
    );
