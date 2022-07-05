import 'package:flutter/material.dart';
import 'package:one_health_doctor_and_admin/api/admin_api/admin_patients_services.dart';
import 'package:one_health_doctor_and_admin/constants/controller.dart';

import 'package:one_health_doctor_and_admin/constants/styles.dart';
import 'package:one_health_doctor_and_admin/routing/routes.dart';
import 'package:one_health_doctor_and_admin/widgets/custom_botton_one.dart';

class PatientProfileAdminSide extends StatelessWidget {
  final dynamic patient;
  PatientProfileAdminSide({
    Key? key,
    required this.patient,
  }) : super(key: key);

  final AdminPatientServices _adminPatientsProfileServices =
      AdminPatientServices();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(50),
          child: SizedBox(
            width: 600,
            child: Card(
                color: lightGreyTwo,
                child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.network(
                              patient.image,
                              width: 200,
                            ),
                          ),
                          Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            'Name : ',
                                            style: mainHeaderStyle.copyWith(
                                                fontSize: 14),
                                          ),
                                        ),
                                        Text(
                                          patient.firstName.toString(),
                                          style: normalTextStyle,
                                        )
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            'ID : ',
                                            style: mainHeaderStyle.copyWith(
                                                fontSize: 14),
                                          ),
                                        ),
                                        Text(
                                          patient.sId.toString(),
                                          style: normalTextStyle,
                                        )
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            'Email : ',
                                            style: mainHeaderStyle.copyWith(
                                                fontSize: 14),
                                          ),
                                        ),
                                        Text(
                                          patient.email.toString(),
                                          style: normalTextStyle,
                                        )
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                'Age : ',
                                                style: mainHeaderStyle.copyWith(
                                                    fontSize: 14),
                                              ),
                                            ),
                                            Text(
                                              patient.age.toString(),
                                              style: normalTextStyle,
                                            )
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                'Gender : ',
                                                style: mainHeaderStyle.copyWith(
                                                    fontSize: 14),
                                              ),
                                            ),
                                            Text(
                                              patient.gender.toString(),
                                              style: normalTextStyle,
                                            )
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                'Mobile : ',
                                                style: mainHeaderStyle.copyWith(
                                                    fontSize: 14),
                                              ),
                                            ),
                                            Text(
                                              patient.phone.toString(),
                                              style: normalTextStyle,
                                            )
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                'Blood Group : ',
                                                style: mainHeaderStyle.copyWith(
                                                    fontSize: 14),
                                              ),
                                            ),
                                            Text(
                                              patient.blood.toString(),
                                              style: normalTextStyle,
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ])),
                        ],
                      ),
                      Column(
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CustomButtonOne(
                                  onPressed: () {
                                    print('Appointments');
                                  },
                                  text: 'Appointments'),
                              CustomButtonOne(
                                color: patient.access ? null : Colors.grey,
                                onPressed: () async {
                                  _adminPatientsProfileServices
                                      .blockUser(user: patient)
                                      .then((value) {
                                    if (value) {
                                      print(patient.access);
                                      if (patient.access == false) {
                                        ScaffoldMessenger.of(context)
                                            .removeCurrentSnackBar();
                                        showSnackBar(
                                            context: context,
                                            message: 'User Blocked');
                                        print('User Blocked');
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .removeCurrentSnackBar();
                                        showSnackBar(
                                            context: context,
                                            message: 'User Unblocked');
                                        print('User UnBlocked');
                                      }
                                      navigationController.navigateTo(
                                          adminPatientsPage,
                                          arguments: '');
                                    }
                                  });
                                  print('Set Inactive');
                                },
                                text: patient.access
                                    ? 'Block User'
                                    : 'Unblock User',
                              ),
                              CustomButtonOne(
                                  onPressed: () {
                                    _adminPatientsProfileServices
                                        .removeUser(userId: patient.sId)
                                        .then((value) {
                                      if (value) {
                                        ScaffoldMessenger.of(context)
                                            .removeCurrentSnackBar();
                                        showSnackBar(
                                            context: context,
                                            message:
                                                'User Removed Successfully');
                                        print('User Removed');

                                        navigationController.navigateTo(
                                            adminPatientsPage,
                                            arguments: '');
                                      }
                                    });
                                    print('Remove User');
                                  },
                                  text: 'Remove'),
                            ],
                          ),
                        ],
                      ),
                    ]))),
          ),
        ),
        CustomButtonOne(
            onPressed: () {
              navigationController.navigateTo(adminPatientsPage, arguments: '');
            },
            text: 'Go Back'),
      ],
    );
  }
}
