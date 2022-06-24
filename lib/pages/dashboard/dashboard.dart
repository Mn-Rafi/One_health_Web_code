import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:one_health_doctor_and_admin/constants/constant_lists.dart';
import 'package:one_health_doctor_and_admin/constants/controller.dart';
import 'package:one_health_doctor_and_admin/constants/styles.dart';
import 'package:one_health_doctor_and_admin/controllers/time_controller.dart';
import 'package:one_health_doctor_and_admin/helpers/doctor_profile_model.dart';
import 'package:one_health_doctor_and_admin/routing/routes.dart';

class DashBoard extends StatelessWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: FutureBuilder<DoctorProfileModel?>(
          future: profileController.doctorProfileResponse(),
          builder: (context, AsyncSnapshot<DoctorProfileModel?> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return Center(
                  child: Text(
                    '${snapshot.error.toString()} occurred',
                    style: TextStyle(fontSize: 18),
                  ),
                );
              }
              return Column(
                children: [
                  Text(
                    'Dash Board',
                    style: mainHeaderStyle,
                  ),
                  Card(
                    color: lightGreyTwo,
                    margin: const EdgeInsets.all(30),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GetBuilder<TimeController>(builder: (context) {
                            return Flexible(
                              child: Column(
                                children: [
                                  Text(
                                    timeController.gettimeNow(),
                                    style: mainHeaderStyle,
                                  ),
                                  Text(
                                    timeController.getdayNow(),
                                    style: mainHeaderStyle.copyWith(fontSize: 18),
                                  ),
                                  Text(
                                    timeController.getDateNow(),
                                    style: mainHeaderStyle.copyWith(fontSize: 18),
                                  ),
                                ],
                              ),
                            );
                          }),
                          Flexible(
                            child: Text(
                              'Welcome ${snapshot.data!.name}!\nHave a great day',
                              textAlign: TextAlign.center,
                              style: mainHeaderStyle.copyWith(fontSize: 18),
                            ),
                          ),
                          Flexible(
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.network(
                                  snapshot.data!.imagePath,
                                  width: 100,
                                )),
                          )
                        ],
                      ),
                    ),
                  ),
                  // Card(
                  //   color: lightGreyTwo,
                  //   margin: const EdgeInsets.all(30),
                  //   child: Padding(
                  //     padding: const EdgeInsets.all(20.0),
                  //     child: ExpansionTile(
                  //       title: Text('Pending Prescriptions', style: mainHeaderStyle),
                  //       backgroundColor: light,
                  //       collapsedBackgroundColor: lightGreyTwo,
                  //       children: [
                  //         ListView.separated(
                  //             separatorBuilder: (context, index) => const Divider(),
                  //             itemCount: 5,
                  //             shrinkWrap: true,
                  //             itemBuilder: (context, index) {
                  //               return ListTile(
                  //                 title: Text('Name of the patient',
                  //                     style: mainHeaderStyle),
                  //                 subtitle: Text('Time', style: normalTextStyle),
                  //                 trailing:
                  //                     const CustomButtonOne(text: 'Prescribe Now'),
                  //               );
                  //             }),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  GridView.builder(
                    shrinkWrap: true,
                    itemCount: doctorPages.length,
                    itemBuilder: (context, index) {
                      return TextButton(
                        onPressed: () {
                          menuController
                              .changeActiveItemto(sideMenuitems[index + 1]);
                          navigationController.navigateTo(
                              sideMenuitems[index + 1], arguments: '');
                        },
                        child: Card(
                          color: lightGreyTwo,
                          margin: const EdgeInsets.all(30),
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Center(
                                child: Text(doctorPages[index],
                                    style: mainHeaderStyle)),
                          ),
                        ),
                      );
                    },
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 1.6,
                            mainAxisExtent: 150),
                  )
                ],
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
