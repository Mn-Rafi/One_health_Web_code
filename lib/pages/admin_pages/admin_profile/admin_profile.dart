import 'package:flutter/material.dart';
import 'package:one_health_doctor_and_admin/api/admin_api/admin_access_services.dart';
import 'package:one_health_doctor_and_admin/constants/controller.dart';
import 'package:one_health_doctor_and_admin/constants/styles.dart';
import 'package:one_health_doctor_and_admin/helpers/doctor_edit_profile_model.dart';
import 'package:one_health_doctor_and_admin/helpers/doctor_profile_model.dart';
import 'package:one_health_doctor_and_admin/routing/routes.dart';
import 'package:one_health_doctor_and_admin/widgets/custom_botton_one.dart';

class AdminProfile extends StatelessWidget {
  AdminProfile({Key? key}) : super(key: key);

  AdminaccessServices adminaccessServices = AdminaccessServices();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<AdminProfileModel?>(
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
            } else if (snapshot.hasData) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Text(
                      'Profile',
                      style: mainHeaderStyle,
                    ),
                    SizedBox(
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
                                        snapshot.data!.imagePath != null
                                            ? snapshot.data!.imagePath
                                                .toString()
                                            : 'https://static.vecteezy.com/system/resources/thumbnails/006/017/842/small_2x/customer-service-icon-user-with-laptop-computer-and-headphone-illustration-free-vector.jpg',
                                        width: 200,
                                      ),
                                    ),
                                    Padding(
                                        padding: const EdgeInsets.all(20.0),
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Row(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Text(
                                                      'Name : ',
                                                      style: mainHeaderStyle
                                                          .copyWith(
                                                              fontSize: 14),
                                                    ),
                                                  ),
                                                  Text(
                                                    snapshot.data!.name,
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
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Text(
                                                      'ID : ',
                                                      style: mainHeaderStyle
                                                          .copyWith(
                                                              fontSize: 14),
                                                    ),
                                                  ),
                                                  Text(
                                                    snapshot.data!.id,
                                                    style: normalTextStyle,
                                                  )
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Text(
                                                      'Email : ',
                                                      style: mainHeaderStyle
                                                          .copyWith(
                                                              fontSize: 14),
                                                    ),
                                                  ),
                                                  Text(
                                                    snapshot.data!.email,
                                                    style: normalTextStyle,
                                                  )
                                                ],
                                              ),
                                              if (snapshot.data!.department !=
                                                  null)
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: Text(
                                                            'Qualification : ',
                                                            style:
                                                                mainHeaderStyle
                                                                    .copyWith(
                                                                        fontSize:
                                                                            14),
                                                          ),
                                                        ),
                                                        Text(
                                                          snapshot.data!
                                                              .qualification!,
                                                          style:
                                                              normalTextStyle,
                                                        )
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: Text(
                                                            'Experience : ',
                                                            style:
                                                                mainHeaderStyle
                                                                    .copyWith(
                                                                        fontSize:
                                                                            14),
                                                          ),
                                                        ),
                                                        Text(
                                                          snapshot.data!
                                                              .experience!,
                                                          style:
                                                              normalTextStyle,
                                                        )
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: Text(
                                                            'Department : ',
                                                            style:
                                                                mainHeaderStyle
                                                                    .copyWith(
                                                                        fontSize:
                                                                            14),
                                                          ),
                                                        ),
                                                        Text(
                                                          snapshot.data!
                                                              .department!,
                                                          style:
                                                              normalTextStyle,
                                                        )
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: Text(
                                                            'Area of expertise : ',
                                                            style:
                                                                mainHeaderStyle
                                                                    .copyWith(
                                                                        fontSize:
                                                                            14),
                                                          ),
                                                        ),
                                                        Text(
                                                          snapshot.data!
                                                              .areaOfExpertise!,
                                                          style:
                                                              normalTextStyle,
                                                        )
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: Text(
                                                            'OP Time : ',
                                                            style:
                                                                mainHeaderStyle
                                                                    .copyWith(
                                                                        fontSize:
                                                                            14),
                                                          ),
                                                        ),
                                                        Text(
                                                          '${snapshot.data!.opTimeStart!} to ${snapshot.data!.opTimeEnd!}',
                                                          style:
                                                              normalTextStyle,
                                                        )
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              if (snapshot.data!.department ==
                                                  null)
                                                Column(
                                                  children: [
                                                    const SizedBox(
                                                      height: 20,
                                                    ),
                                                    CustomButtonOne(
                                                        onPressed: () {
                                                          print(
                                                              'Change Password');
                                                          navigationController
                                                              .navigateTo(
                                                                  doctorChangePasswordPage,
                                                                  arguments:
                                                                      'admin');
                                                        },
                                                        text:
                                                            'Change Password'),
                                                  ],
                                                ),
                                            ])),
                                  ],
                                )
                              ]))),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    if (snapshot.data!.department == null)
                      Column(
                        children: [
                          Text(
                            'Admin Access',
                            style:
                                mainHeaderStyle.copyWith(color: Colors.black45),
                          ),
                          FutureBuilder<List<AdminProfileModel>?>(
                            future: adminaccessServices.getAdminaccessDoctors(),
                            builder: (context, snapshot) {
                              print('NEW PRINTTTTTTTT');
                              if (snapshot.connectionState ==
                                  ConnectionState.done) {
                                if (snapshot.hasError) {
                                  return Center(
                                    child: Text(
                                      '${snapshot.error.toString()} occurred',
                                      style: const TextStyle(fontSize: 18),
                                    ),
                                  );
                                } else if (snapshot.hasData) {
                                  print(snapshot.data!.length);
                                  return ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: snapshot.data!.length,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 100.0, vertical: 10),
                                        child: Card(
                                            color: lightGreyTwo,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(20.0),
                                              child: Row(
                                                children: [
                                                  ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    child: Image.network(
                                                      snapshot.data![index]
                                                          .imagePath!,
                                                      height: 100,
                                                      width: 100,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 20,
                                                  ),
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Text(
                                                          snapshot.data![index]
                                                              .name,
                                                          style: normalTextStyle
                                                              .copyWith(
                                                                  fontSize: 24),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Text(
                                                          snapshot.data![index]
                                                              .department!,
                                                          style:
                                                              normalTextStyle,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Text(
                                                          snapshot.data![index]
                                                              .qualification!,
                                                          style:
                                                              normalTextStyle,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Spacer(),
                                                  CustomButtonOne(
                                                      onPressed: () {
                                                        print(
                                                            'Delete Admin');
                                                        doctorProfileEditController
                                                            .editProfile(
                                                          DoctorEditProfileModel(
                                                            id: snapshot
                                                                .data![index]
                                                                .id,
                                                            isAdmin: false,
                                                            name: snapshot
                                                                .data![index]
                                                                .name,
                                                            email: snapshot
                                                                .data![index]
                                                                .email,
                                                            phoneNumber: snapshot
                                                                .data![index]
                                                                .phoneNumber!,
                                                            qualification: snapshot
                                                                .data![index]
                                                                .qualification!,
                                                            department: snapshot
                                                                .data![index]
                                                                .department!,
                                                            experience: snapshot
                                                                .data![index]
                                                                .experience!,
                                                            expertise: snapshot
                                                                .data![index]
                                                                .areaOfExpertise!,
                                                            startingTime: snapshot
                                                                .data![index]
                                                                .opTimeStart!,
                                                            finishingTime:
                                                                snapshot
                                                                    .data![
                                                                        index]
                                                                    .opTimeEnd!,
                                                            days: snapshot
                                                                .data![index]
                                                                .days!
                                                                .cast<int>(),
                                                            feeAmount: int
                                                                .parse(snapshot
                                                                    .data![
                                                                        index]
                                                                    .fee!
                                                                    .toString()),
                                                            isRequested: true,
                                                            imagePath: snapshot
                                                                .data![index]
                                                                .imagePath!,
                                                          ),
                                                          context,
                                                          true,
                                                        );
                                                      },
                                                      text:
                                                          'REMOVE ADMIN ACCESS')
                                                ],
                                              ),
                                            )),
                                      );
                                    },
                                  );
                                }
                              }
                              return Column(
                                children: const [
                                  SizedBox(
                                    height: 100,
                                  ),
                                  CircularProgressIndicator()
                                ],
                              );
                            },
                          )
                        ],
                      ),
                  ],
                ),
              );
            }
          }
          return Column(
            children: const [
              SizedBox(
                height: 100,
              ),
              CircularProgressIndicator()
            ],
          );
        });
  }
}
