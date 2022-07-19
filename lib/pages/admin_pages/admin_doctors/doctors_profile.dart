import 'package:flutter/material.dart';
import 'package:one_health_doctor_and_admin/api/admin_api/admin_doctor_profile_services.dart';
import 'package:one_health_doctor_and_admin/constants/controller.dart';

import 'package:one_health_doctor_and_admin/constants/styles.dart';
import 'package:one_health_doctor_and_admin/helpers/doctor_edit_profile_model.dart';
import 'package:one_health_doctor_and_admin/routing/routes.dart';
import 'package:one_health_doctor_and_admin/widgets/custom_botton_one.dart';

class DoctorProfileAdminSide extends StatelessWidget {
  final dynamic doctor;
  DoctorProfileAdminSide({
    Key? key,
    required this.doctor,
  }) : super(key: key);

  final AdminDoctorProfileServices _adminDoctorProfileServices =
      AdminDoctorProfileServices();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 50),
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
                              doctor.image,
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
                                          doctor.name,
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
                                          doctor.sId,
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
                                          doctor.email,
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
                                                'Qualification : ',
                                                style: mainHeaderStyle.copyWith(
                                                    fontSize: 14),
                                              ),
                                            ),
                                            Text(
                                              doctor.qualification,
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
                                                'Experience : ',
                                                style: mainHeaderStyle.copyWith(
                                                    fontSize: 14),
                                              ),
                                            ),
                                            Text(
                                              doctor.experience,
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
                                                'Department : ',
                                                style: mainHeaderStyle.copyWith(
                                                    fontSize: 14),
                                              ),
                                            ),
                                            Text(
                                              doctor.department,
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
                                                'Area of expertise : ',
                                                style: mainHeaderStyle.copyWith(
                                                    fontSize: 14),
                                              ),
                                            ),
                                            Text(
                                              doctor.expertise,
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
                                                'OP Time : ',
                                                style: mainHeaderStyle.copyWith(
                                                    fontSize: 14),
                                              ),
                                            ),
                                            Text(
                                              '${doctor.startTime} to ${doctor.endTime}',
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
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              CustomButtonOne(
                                  onPressed: () {
                                    print('Appointments');
                                    navigationController.navigateTo(
                                        adminAppointmentsPage,
                                        arguments: '/doctor/${doctor.sId}');
                                  },
                                  text: 'Appointments'),
                              CustomButtonOne(
                                color: doctor.active ? null : Colors.grey,
                                onPressed: () async {
                                  await doctorProfileEditController.editProfile(
                                    DoctorEditProfileModel(
                                      isActive: !(doctor.active),
                                      id: doctor.sId,
                                      isAdmin: doctor.admin,
                                      name: doctor.name,
                                      email: doctor.email,
                                      phoneNumber: doctor.phone!,
                                      qualification: doctor.qualification!,
                                      department: doctor.department!,
                                      experience: doctor.experience!,
                                      expertise: doctor.expertise!,
                                      startingTime: doctor.startTime!,
                                      finishingTime: doctor.endTime!,
                                      days: doctor.days!.cast<int>(),
                                      feeAmount:
                                          int.parse(doctor.fee!.toString()),
                                      isRequested: true,
                                      imagePath: doctor.image!,
                                    ),
                                    context,
                                    true,
                                  );

                                  if (doctor.isDoctorSession == null) {
                                    menuController.changeActiveItemto(
                                        adminDepartmentsPage);
                                    navigationController.navigateTo(
                                        adminDepartmentsPage,
                                        arguments: '');
                                  } else {
                                    menuController
                                        .changeActiveItemto(adminDoctorsPage);
                                    navigationController.navigateTo(
                                        adminDoctorsPage,
                                        arguments: '');
                                  }
                                  print('Set Inactive');
                                },
                                text: doctor.active
                                    ? 'Set Inactive'
                                    : 'Set Active',
                              ),
                              CustomButtonOne(
                                  color: doctor.admin ? Colors.red : null,
                                  onPressed: () {
                                    print('Remove Admin Access');
                                    doctorProfileEditController.editProfile(
                                      DoctorEditProfileModel(
                                        isActive: doctor.active,
                                        id: doctor.sId,
                                        isAdmin: doctor.admin ? false : true,
                                        name: doctor.name,
                                        email: doctor.email,
                                        phoneNumber: doctor.phone!,
                                        qualification: doctor.qualification!,
                                        department: doctor.department!,
                                        experience: doctor.experience!,
                                        expertise: doctor.expertise!,
                                        startingTime: doctor.startTime!,
                                        finishingTime: doctor.endTime!,
                                        days: doctor.days!.cast<int>(),
                                        feeAmount:
                                            int.parse(doctor.fee!.toString()),
                                        isRequested: true,
                                        imagePath: doctor.image!,
                                      ),
                                      context,
                                      true,
                                    );
                                    if (doctor.isDoctorSession == null) {
                                      menuController.changeActiveItemto(
                                          adminDepartmentsPage);
                                      navigationController.navigateTo(
                                          adminDepartmentsPage,
                                          arguments: '');
                                    } else {
                                      menuController
                                          .changeActiveItemto(adminDoctorsPage);
                                      navigationController.navigateTo(
                                          adminDoctorsPage,
                                          arguments: '');
                                    }
                                  },
                                  text: doctor.admin
                                      ? 'Remove Admin Access'
                                      : 'Make Admin'),
                              CustomButtonOne(
                                  onPressed: () {
                                    _adminDoctorProfileServices
                                        .removeDoctor(
                                            id: doctor.sId,
                                            check: doctor.isDoctorSession)
                                        .then((value) {
                                      if (value) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(const SnackBar(
                                                content: Text(
                                                    'Doctor Removed Successfully')));
                                      }
                                    });
                                    print('Remove Doctor');
                                  },
                                  text: 'Remove Doctor'),
                            ],
                          ),
                        ],
                      ),
                    ]))),
          ),
          CustomButtonOne(
              onPressed: () {
                print('Go Back');
                if (doctor.isDoctorSession != null) {
                  navigationController.navigateTo(adminDoctorsPage,
                      arguments: '');
                } else {
                  navigationController.navigateTo(adminDepartmentsPage,
                      arguments: '');
                }
              },
              text: 'Go Back'),
        ],
      ),
    );
  }
}
