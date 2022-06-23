import 'package:flutter/material.dart';
import 'package:one_health_doctor_and_admin/constants/controller.dart';
import 'package:one_health_doctor_and_admin/constants/styles.dart';
import 'package:one_health_doctor_and_admin/helpers/doctor_patients_model.dart';
import 'package:one_health_doctor_and_admin/routing/routes.dart';
import 'package:one_health_doctor_and_admin/widgets/custom_table_header.dart';

class PatientsPage extends StatelessWidget {
  const PatientsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Text(
            'Patients',
            style: mainHeaderStyle,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Your Patients List',
              style: mainHeaderStyle.copyWith(color: Colors.blue, fontSize: 20),
            ),
          ),
          Container(
            color: Colors.white,
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Table(
                  border: TableBorder.all(color: Colors.black),
                  children: const [
                    TableRow(
                        decoration: BoxDecoration(
                          color: Colors.blue,
                        ),
                        children: [
                          CustomTableHead(title: 'ID'),
                          CustomTableHead(title: 'Patient Name'),
                          CustomTableHead(title: 'Age'),
                          CustomTableHead(title: 'Gender'),
                          CustomTableHead(title: 'Profile'),
                        ])
                  ],
                ),
                StreamBuilder<List<DoctorPatientDetailsModel?>?>(
                    stream: doctorPatientsController.doctorPatientsResponse(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        if (snapshot.hasError) {
                          return Center(
                            child: Text(
                              '${snapshot.error.toString()} occurred',
                              style: TextStyle(fontSize: 18),
                            ),
                          );
                        }
                        if (snapshot.hasData) {
                          return Table(
                              border: TableBorder.all(
                                  color: Colors.black, width: 0.2),
                              children: List<TableRow>.generate(
                                  snapshot.data!.length, (index) {
                                // final day = days[index];
                                return TableRow(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20.0, vertical: 10),
                                      child: Text(
                                          snapshot.data![index]!.id.toString()),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20.0, vertical: 10),
                                      child: Text(snapshot.data![index]!.name
                                          .toString()),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20.0, vertical: 10),
                                      child: Text(snapshot.data![index]!.age
                                          .toString()),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20.0, vertical: 10),
                                      child: Text(snapshot.data![index]!.gender
                                          .toString()),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20.0, vertical: 10),
                                      child: ElevatedButton(
                                          onPressed: () {
                                            navigationController.navigateTo(
                                              patientProfilePageView,
                                              arguments: {
                                                "_id":
                                                    snapshot.data![index]!.id,
                                                "isPatient": true
                                              },
                                            );
                                          },
                                          child: Text('Profile',
                                              style: normalTextStyle.copyWith(
                                                  color: Colors.white))),
                                    ),
                                  ],
                                );
                              }, growable: false));
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
              ],
            ),
          )
        ],
      ),
    );
  }
}
