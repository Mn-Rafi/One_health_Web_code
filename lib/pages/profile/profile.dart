import 'package:flutter/material.dart';
import 'package:one_health_doctor_and_admin/constants/controller.dart';
import 'package:one_health_doctor_and_admin/constants/styles.dart';
import 'package:one_health_doctor_and_admin/helpers/doctor_profile_model.dart';
import 'package:one_health_doctor_and_admin/routing/routes.dart';
import 'package:one_health_doctor_and_admin/widgets/custom_botton_one.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: StreamBuilder<DoctorProfileModel?>(
          stream: profileController.doctorProfileResponse(),
          builder: (context, AsyncSnapshot<DoctorProfileModel?> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return Center(
                  child: Text(
                    '${snapshot.error.toString()} occurred',
                    style: TextStyle(fontSize: 18),
                  ),
                );
              } else if (snapshot.hasData) {
                return Column(children: [
                  Text(
                    'Profile',
                    style: mainHeaderStyle,
                  ),
                  SizedBox(
                    // height: 300,
                    width: 600,
                    child: Card(
                      color: lightGreyTwo,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.network(
                                    snapshot.data!.imagePath.toString(),
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
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                  'Name : ',
                                                  style: mainHeaderStyle
                                                      .copyWith(fontSize: 14),
                                                ),
                                              ),
                                              Text(
                                                snapshot.data!.name,
                                                style: normalTextStyle,
                                              )
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                  'Email : ',
                                                  style: mainHeaderStyle
                                                      .copyWith(fontSize: 14),
                                                ),
                                              ),
                                              Text(
                                                snapshot.data!.email,
                                                style: normalTextStyle,
                                              )
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                  'Qualifications : ',
                                                  style: mainHeaderStyle
                                                      .copyWith(fontSize: 14),
                                                ),
                                              ),
                                              Text(
                                                snapshot.data!.qualification,
                                                style: normalTextStyle,
                                              )
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                  'Department : ',
                                                  style: mainHeaderStyle
                                                      .copyWith(fontSize: 14),
                                                ),
                                              ),
                                              Text(
                                                snapshot.data!.department,
                                                style: normalTextStyle,
                                              )
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                  'Experience : ',
                                                  style: mainHeaderStyle
                                                      .copyWith(fontSize: 14),
                                                ),
                                              ),
                                              Text(
                                                snapshot.data!.experience,
                                                style: normalTextStyle,
                                              )
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                  'Area of Expertise : ',
                                                  style: mainHeaderStyle
                                                      .copyWith(fontSize: 14),
                                                ),
                                              ),
                                              Text(
                                                snapshot.data!.areaOfExpertise,
                                                style: normalTextStyle,
                                              )
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                  'OP Time : ',
                                                  style: mainHeaderStyle
                                                      .copyWith(fontSize: 14),
                                                ),
                                              ),
                                              Text(
                                                '${snapshot.data!.opTimeStart} to ${snapshot.data!.opTimeEnd}',
                                                style: normalTextStyle,
                                              )
                                            ],
                                          ),
                                        ])),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 20.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  CustomButtonOne(
                                      onPressed: () {
                                        print('Edit Profile');
                                        navigationController.navigateTo(
                                            doctorEditProfile, arguments: '');
                                      },
                                      text: 'Edit Profile'),
                                  CustomButtonOne(
                                      onPressed: () {
                                        print('Change Password');
                                        navigationController.navigateTo(
                                            doctorChangePasswordPage, arguments: '');
                                      },
                                      text: 'Change Password'),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ]);
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
          }),
    );
  }
}
