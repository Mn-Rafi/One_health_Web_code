import 'package:flutter/material.dart';
import 'package:one_health_doctor_and_admin/api/admin_api/admin_appoinment_servies.dart';
import 'package:one_health_doctor_and_admin/constants/styles.dart';
import 'package:one_health_doctor_and_admin/helpers/admin_appoinments_list_model.dart';
import 'package:one_health_doctor_and_admin/widgets/custom_table_header.dart';
import 'package:intl/intl.dart';

class AdminAppoinments extends StatelessWidget {
  AdminAppoinments({Key? key}) : super(key: key);

  final AdminAppoinmentServices _adminAppoinmentServices =
      AdminAppoinmentServices();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Text(
            'Appoinments',
            style: mainHeaderStyle,
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 50,
            ),
            child: Card(
              color: lightGreyTwo,
              child: Table(
                columnWidths: const {
                  0: FlexColumnWidth(1.5),
                  1: FlexColumnWidth(1.0),
                  2: FlexColumnWidth(1.0),
                  3: FlexColumnWidth(1.0),
                  4: FlexColumnWidth(0.8),
                  5: FlexColumnWidth(1.5),
                  6: FlexColumnWidth(0.7),
                  7: FlexColumnWidth(0.7),
                  8: FlexColumnWidth(0.7),
                },
                border: TableBorder.all(color: Colors.black),
                children: const [
                  TableRow(
                      decoration: BoxDecoration(
                        color: Colors.blue,
                      ),
                      children: [
                        CustomTableHead(title: 'Patient'),
                        CustomTableHead(title: 'Status'),
                        CustomTableHead(title: 'Date'),
                        CustomTableHead(title: 'Time'),
                        CustomTableHead(title: 'Amount'),
                        CustomTableHead(title: 'Doctor'),
                        CustomTableHead(title: 'Complete'),
                        CustomTableHead(title: 'Cancel'),
                        CustomTableHead(title: 'Delete'),
                      ])
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 50,
            ),
            child: Card(
              color: lightGreyTwo,
              child: FutureBuilder<AdminAppointmentsListModel?>(
                future: _adminAppoinmentServices.getAllAppoinments(),
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
                    if (snapshot.hasData) {
                      snapshot.data!.appointment!.sort((a, b) {
                        a.date =
                            DateFormat("yyyy-MM-dd hh:mm:ss").parse(a.date!).toString();
                        b.date =
                            DateFormat("yyyy-MM-dd hh:mm:ss").parse(a.date!).toString();
                        return a.date!.compareTo(b.date!);
                      });
                      final List list = snapshot.data!.appointment!;
                      print(list);
                      if (snapshot.data!.appointment!.isEmpty) {
                        return const Center(
                          child: Text(
                            'No Appoinments Found',
                            style: TextStyle(fontSize: 18),
                          ),
                        );
                      }
                      return Table(
                          columnWidths: const {
                            0: FlexColumnWidth(1.5),
                            1: FlexColumnWidth(1.0),
                            2: FlexColumnWidth(1.0),
                            3: FlexColumnWidth(1.0),
                            4: FlexColumnWidth(0.8),
                            5: FlexColumnWidth(1.5),
                            6: FlexColumnWidth(0.7),
                            7: FlexColumnWidth(0.7),
                            8: FlexColumnWidth(0.7),
                          },
                          border:
                              TableBorder.all(color: Colors.black, width: 0.2),
                          children:
                              List<TableRow>.generate(list.length, (index) {
                            print(DateFormat("dd/MM/yyyy")
                                .parse(list[index].date!));
                            return TableRow(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20.0, vertical: 10),
                                  child: Text(list[index].user!),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20.0, vertical: 10),
                                  child: Text(list[index].status.toString()),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20.0, vertical: 10),
                                  child: Text(list[index].date.toString()),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20.0, vertical: 10),
                                  child: Text(list[index].time.toString()),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20.0, vertical: 10),
                                  child: Text(list[index].fee.toString()),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20.0, vertical: 10),
                                  child: Text(list[index].doctor.toString()),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20.0, vertical: 10),
                                  child: Icon(Icons.check_box_sharp),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20.0, vertical: 10),
                                  child: Icon(Icons.check_box_sharp),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20.0, vertical: 10),
                                  child: Icon(Icons.check_box_sharp),
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
                },
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
