import 'package:flutter/material.dart';
import 'package:one_health_doctor_and_admin/constants/controller.dart';
import 'package:one_health_doctor_and_admin/constants/styles.dart';
import 'package:one_health_doctor_and_admin/helpers/doctor_appointments_model.dart';
import 'package:one_health_doctor_and_admin/routing/routes.dart';
import 'package:one_health_doctor_and_admin/widgets/custom_table_header.dart';

class AppointmentsPage extends StatelessWidget {
  const AppointmentsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Text(
            'Appointments',
            style: mainHeaderStyle,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Your Appointment History',
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
                          CustomTableHead(title: 'Patient Name'),
                          CustomTableHead(title: 'Date'),
                          CustomTableHead(title: 'Time'),
                          CustomTableHead(title: 'Status'),
                          CustomTableHead(title: 'Reason'),
                          CustomTableHead(title: 'Profile'),
                        ])
                  ],
                ),
                StreamBuilder<List<DoctorAppointmentDetailsModel?>?>(
                    stream:
                        doctorAppointmentsController.doctorPatientsResponse(),
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
                        if (snapshot.data!.isEmpty) {
                          return const Center(
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'No Appointments Found',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.black),
                              ),
                            ),
                          );
                        }
                        if (snapshot.hasData) {
                          return Table(
                              border: TableBorder.all(
                                  color: Colors.black, width: 0.2),
                              children: List<TableRow>.generate(
                                  snapshot.data!.length, (index) {
                                print(snapshot.data!.length);
                                return TableRow(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 50.0, vertical: 10),
                                      child: Text(snapshot.data![index]!.name
                                          .toString()),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 50.0, vertical: 10),
                                      child: Text(snapshot.data![index]!.date
                                          .toString()
                                          .substring(0, 10)),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 50.0, vertical: 10),
                                      child: Text(snapshot.data![index]!.time
                                          .toString()),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 50.0, vertical: 10),
                                      child: Text(snapshot.data![index]!.status
                                          .toString()),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 50.0, vertical: 10),
                                      child: Text(snapshot.data![index]!.reason
                                          .toString()),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 50.0, vertical: 10),
                                      child: ElevatedButton(
                                          onPressed: () {
                                            navigationController.navigateTo(
                                              patientProfilePageView,
                                              arguments: {
                                                "_id":
                                                    snapshot.data![index]!.id,
                                                "isPatient": false
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
