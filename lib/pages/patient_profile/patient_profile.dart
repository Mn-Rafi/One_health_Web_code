import 'package:flutter/material.dart';
import 'package:one_health_doctor_and_admin/constants/controller.dart';
import 'package:one_health_doctor_and_admin/constants/styles.dart';
import 'package:one_health_doctor_and_admin/helpers/patient_profile_model.dart';
import 'package:one_health_doctor_and_admin/routing/routes.dart';
import 'package:one_health_doctor_and_admin/widgets/custom_botton_one.dart';

class PatientProfilePage extends StatefulWidget {
  final dynamic map;
  const PatientProfilePage({
    Key? key,
    required this.map,
  }) : super(key: key);

  @override
  State<PatientProfilePage> createState() => _PatientProfilePageState();
}

class _PatientProfilePageState extends State<PatientProfilePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: FutureBuilder<PatientProfileModel?>(
          future: getPatientByIDController.getPatientProfileResponse(
              widget.map["_id"], context),
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
                                                snapshot.data!.firstName,
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
                                                  'ID : ',
                                                  style: mainHeaderStyle
                                                      .copyWith(fontSize: 14),
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
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                  'Age : ',
                                                  style: mainHeaderStyle
                                                      .copyWith(fontSize: 14),
                                                ),
                                              ),
                                              Text(
                                                snapshot.data!.age,
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
                                                  'Gender : ',
                                                  style: mainHeaderStyle
                                                      .copyWith(fontSize: 14),
                                                ),
                                              ),
                                              Text(
                                                snapshot.data!.gender,
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
                                                  'Mobile : ',
                                                  style: mainHeaderStyle
                                                      .copyWith(fontSize: 14),
                                                ),
                                              ),
                                              Text(
                                                snapshot.data!.mobile,
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
                                                  'Blood Group : ',
                                                  style: mainHeaderStyle
                                                      .copyWith(fontSize: 14),
                                                ),
                                              ),
                                              Text(
                                                snapshot.data!.bloodGroup,
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
                                        print('Prescribe Medicine');
                                        navigationController.navigateTo(
                                            prescribeMedicinePage,
                                            arguments: {
                                              "name": snapshot.data!.firstName,
                                              "id": snapshot.data!.id,
                                              "isPatient":
                                                  widget.map["isPatient"]
                                            });
                                      },
                                      text: 'Prescribe Medicine'),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50.0, vertical: 10),
                    child: ElevatedButton(
                        onPressed: () {
                          navigationController.navigateUntil(
                              widget.map["isPatient"]
                                  ? patientsPageView
                                  : appointmentsPageView,
                              arguments: '');
                        },
                        child: Text('Go Back',
                            style:
                                normalTextStyle.copyWith(color: Colors.white))),
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
