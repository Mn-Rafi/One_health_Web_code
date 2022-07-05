import 'package:flutter/material.dart';
import 'package:one_health_doctor_and_admin/api/admin_api/admin_patients_services.dart';
import 'package:one_health_doctor_and_admin/constants/controller.dart';
import 'package:one_health_doctor_and_admin/constants/styles.dart';
import 'package:one_health_doctor_and_admin/helpers/admin_patients_profile_model.dart';
import 'package:one_health_doctor_and_admin/routing/routes.dart';
import 'package:one_health_doctor_and_admin/widgets/custom_table_header.dart';

class AdminPatientsPage extends StatelessWidget {
  AdminPatientsPage({Key? key}) : super(key: key);
  final AdminPatientServices _adminPatientsProfileServices =
      AdminPatientServices();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 20),
        child: Column(
          children: [
            Text(
              'Patients',
              style: mainHeaderStyle,
            ),
            const SizedBox(
              height: 30,
            ),
            Table(
              columnWidths: const {
                0: FlexColumnWidth(1.5),
                1: FlexColumnWidth(1.2),
                2: FlexColumnWidth(1.0),
                3: FlexColumnWidth(1.0),
                4: FlexColumnWidth(1.0),
              },
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
            FutureBuilder<PatientsProfileModel?>(
              future: _adminPatientsProfileServices.getAllPatients(),
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
                  if (snapshot.data!.user!.isEmpty) {
                    return const Center(
                      child: Text(
                        'No Doctors Found',
                        style: TextStyle(fontSize: 18),
                      ),
                    );
                  }
                  // final List list = snapshot.data!
                  //     .where((element) => element!.name!.contains('G'))
                  //     .toList();
                  // print(list);
                  return Table(
                      columnWidths: const {
                        0: FlexColumnWidth(1.5),
                        1: FlexColumnWidth(1.2),
                        2: FlexColumnWidth(1.0),
                        3: FlexColumnWidth(1.0),
                        4: FlexColumnWidth(1.0),
                      },
                      border: TableBorder.all(color: Colors.black, width: 0.2),
                      children: List<TableRow>.generate(
                          snapshot.data!.user!.length, (index) {
                        return TableRow(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 10),
                              child: Text(
                                  snapshot.data!.user![index].sId.toString()),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 10),
                              child: Text(snapshot.data!.user![index].firstName
                                  .toString()),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 10),
                              child: Text(
                                  snapshot.data!.user![index].age.toString()),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 10),
                              child: Text(snapshot.data!.user![index].gender
                                  .toString()),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 10),
                              child: ElevatedButton(
                                  onPressed: () {
                                    navigationController.navigateTo(
                                        adminPatientProfileViewPage,
                                        arguments: snapshot.data!.user![index]);
                                  },
                                  child: Text('Profile',
                                      style: normalTextStyle.copyWith(
                                          color: Colors.white))),
                            ),
                          ],
                        );
                      }, growable: false));
                  // ListTile(
                  //   title: Text(snapshot.data![index]!.name!),
                  //   subtitle: Text(snapshot.data![index]!.email!),
                  //   trailing: IconButton(
                  //     icon: Icon(Icons.delete),
                  //     onPressed: () {
                  //       print('Delete');
                  //     },
                  //   ),
                  // );

                } else {
                  return Column(
                    children: const [
                      SizedBox(
                        height: 100,
                      ),
                      CircularProgressIndicator()
                    ],
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
