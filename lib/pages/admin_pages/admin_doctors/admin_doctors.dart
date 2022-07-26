import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:material_tag_editor/tag_editor.dart';
import 'package:one_health_doctor_and_admin/api/admin_api/admin_doctor_profile_services.dart';
import 'package:one_health_doctor_and_admin/constants/controller.dart';
import 'package:one_health_doctor_and_admin/constants/styles.dart';
import 'package:one_health_doctor_and_admin/helpers/doctor_response_profilemodel.dart';
import 'package:one_health_doctor_and_admin/routing/routes.dart';
import 'package:one_health_doctor_and_admin/widgets/custom_table_header.dart';
import 'package:one_health_doctor_and_admin/widgets/custom_text_formfield.dart';

class AdminDoctorsPage extends StatefulWidget {
  AdminDoctorsPage({Key? key}) : super(key: key);

  @override
  State<AdminDoctorsPage> createState() => _AdminDoctorsPageState();
}

class _AdminDoctorsPageState extends State<AdminDoctorsPage> {
  final AdminDoctorProfileServices _adminDoctorProfileServices =
      AdminDoctorProfileServices();

  final searchControler = TextEditingController();
  List<String> values = [];

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
            Row(
              children: [
                Text(
                  'Filter with department and experience',
                  style: mainHeaderStyle.copyWith(fontSize: 14),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: TagEditor(
                  maxLines: 1,
                  length: values.length,
                  delimiters: [',', '\n'],
                  hasAddButton: false,
                  textInputAction: TextInputAction.next,
                  textStyle: TextStyle(
                    fontSize: 14.0,
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                  ),
                  inputDecoration: InputDecoration(
                    border: InputBorder.none,
                    filled: true,
                    fillColor: Color(0xFFF7F7F7),
                    contentPadding: const EdgeInsets.only(
                        left: 14.0, bottom: 6.0, top: 8.0),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFF7F7F7)),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  onTagChanged: (newValue) {
                    setState(() {
                      if (values.length == 2) {
                        values.removeAt(1);
                        values.add(newValue);
                        print('new value is $newValue');
                      } else {
                        values.add(newValue);
                        print('new value is $newValue');
                      }
                    });
                  },
                  tagBuilder: (context, index) => _Chip(
                    index: index,
                    label: values[index],
                    onDeleted: (index) {
                      values.removeAt(index);
                      setState(() {});
                    },
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                  child: CustomTextFormField(
                onChanged: (val) {
                  setState(() {});
                },
                hintText: 'Search with name, department, experience,...',
                keyBoardType: TextInputType.text,
                iconData: Icons.search,
                textController: searchControler,
              )),
            ),
            const SizedBox(
              height: 30,
            ),
            Table(
              columnWidths: const {
                0: FlexColumnWidth(1.5),
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
                  if (snapshot.hasData) {
                    List<DoctorModel?> doctorsList =
                        snapshot.data!.where((element) {
                      // if (values.isNotEmpty) {
                      //   log('hereeee  ${values.join(',')}');
                      //   if (element!.department!
                      //       .contains(values[0].toLowerCase())) {
                      //     return true;
                      //   }
                      // }
                      if (element!.name!
                          .toLowerCase()
                          .contains(searchControler.text.toLowerCase())) {
                        return true;
                      }
                      if (element.department!
                          .toLowerCase()
                          .contains(searchControler.text.toLowerCase())) {
                        return true;
                      }
                      if (element.experience!
                          .toLowerCase()
                          .contains(searchControler.text.toLowerCase())) {
                        return true;
                      }
                      return false;
                    }).toList();
                    if (values.isNotEmpty) {
                      doctorsList = doctorsList.where((element) {
                        if (element!.department!
                            .toLowerCase()
                            .contains(values[0].toLowerCase())) {
                          return true;
                        }
                        if (element.experience!
                            .toLowerCase()
                            .contains(values[0].toLowerCase())) {
                          return true;
                        }

                        return false;
                      }).toList();
                      if (values.length == 2) {
                        print(values[1].toLowerCase());
                        doctorsList = doctorsList.where((element) {
                          if (element!.department!
                              .toLowerCase()
                              .contains(values[1].toLowerCase())) {
                            return true;
                          }
                          if (element.experience!
                              .toLowerCase()
                              .contains(values[1].toLowerCase())) {
                            return true;
                          }
                          return false;
                        }).toList();
                      }
                    }
                    if (doctorsList.isEmpty) {
                      return const Center(
                        child: Text(
                          'No Doctors Found',
                          style: TextStyle(fontSize: 18),
                        ),
                      );
                    }
                    return Table(
                        columnWidths: const {
                          0: FlexColumnWidth(1.5),
                          2: FlexColumnWidth(1.0),
                          3: FlexColumnWidth(1.0),
                          4: FlexColumnWidth(1.0),
                        },
                        border:
                            TableBorder.all(color: Colors.black, width: 0.2),
                        children: List<TableRow>.generate(doctorsList.length,
                            (index) {
                          return TableRow(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0, vertical: 10),
                                child:
                                    Text(doctorsList[index]!.name.toString()),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0, vertical: 10),
                                child: Text(
                                    doctorsList[index]!.department.toString()),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0, vertical: 10),
                                child: Text(
                                    doctorsList[index]!.experience.toString()),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0, vertical: 10),
                                child: ElevatedButton(
                                    onPressed: () {
                                      navigationController.navigateTo(
                                          adminDoctorProfileViewPage,
                                          arguments: doctorsList[index]!);
                                    },
                                    child: Text('Profile',
                                        style: normalTextStyle.copyWith(
                                            color: Colors.white))),
                              ),
                            ],
                          );
                        }, growable: false));
                  }
                  return Column(
                    children: const [
                      SizedBox(
                        height: 100,
                      ),
                      CircularProgressIndicator()
                    ],
                  );
                  // ListTile(
                  //   title: Text(doctorsList![index]!.name!),
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

class _Chip extends StatelessWidget {
  final String label;
  final ValueChanged<int> onDeleted;
  final int index;

  const _Chip({
    required this.label,
    required this.onDeleted,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Chip(
      labelPadding: const EdgeInsets.only(left: 8.0),
      label: Text(label),
      backgroundColor: const Color(0xffFFB9C6),
      deleteIcon: const Icon(
        Icons.close,
        size: 18,
      ),
      onDeleted: () {
        onDeleted(index);
      },
    );
  }
}
