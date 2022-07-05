import 'package:flutter/material.dart';
import 'package:one_health_doctor_and_admin/api/admin_api/admin_doctor_profile_services.dart';
import 'package:one_health_doctor_and_admin/constants/controller.dart';
import 'package:one_health_doctor_and_admin/constants/styles.dart';
import 'package:one_health_doctor_and_admin/helpers/doctor_response_profilemodel.dart';
import 'package:one_health_doctor_and_admin/routing/routes.dart';
import 'package:one_health_doctor_and_admin/widgets/custom_table_header.dart';

class AdminDoctorsPage extends StatelessWidget {
  AdminDoctorsPage({Key? key}) : super(key: key);
  final AdminDoctorProfileServices _adminDoctorProfileServices =
      AdminDoctorProfileServices();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 20),
        child: Column(
          children: [
            Text(
              'Doctors',
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
                      CustomTableHead(title: 'Name'),
                      CustomTableHead(title: 'Department'),
                      CustomTableHead(title: 'Experience'),
                      CustomTableHead(title: 'Profile'),
                    ])
              ],
            ),
            FutureBuilder<List<DoctorModel?>?>(
              future: _adminDoctorProfileServices.getAllDoctorsList(),
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
                      children: List<TableRow>.generate(snapshot.data!.length,
                          (index) {
                        return TableRow(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 10),
                              child:
                                  // CircleAvatar(
                                  //   radius: 50,
                                  //   child: ClipOval(
                                  //       child: Image.network(
                                  //     snapshot.data![index]!.image!,
                                  //   )),
                                  // ),
                                  Text(snapshot.data![index]!.sId.toString()),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 10),
                              child:
                                  Text(snapshot.data![index]!.name.toString()),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 10),
                              child: Text(
                                  snapshot.data![index]!.department.toString()),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 10),
                              child: Text(
                                  snapshot.data![index]!.experience.toString()),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 10),
                              child: ElevatedButton(
                                  onPressed: () {
                                    navigationController.navigateTo(
                                        adminDoctorProfileViewPage,
                                        arguments: snapshot.data![index]!);
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
