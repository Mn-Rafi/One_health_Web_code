import 'package:flutter/material.dart';
import 'package:one_health_doctor_and_admin/api/admin_api/admin_appoinment_servies.dart';
import 'package:one_health_doctor_and_admin/constants/controller.dart';
import 'package:one_health_doctor_and_admin/constants/styles.dart';
import 'package:one_health_doctor_and_admin/helpers/admin_appoinments_list_model.dart';
import 'package:one_health_doctor_and_admin/routing/routes.dart';
import 'package:one_health_doctor_and_admin/widgets/custom_botton_one.dart';
import 'package:one_health_doctor_and_admin/widgets/custom_table_header.dart';
import 'package:intl/intl.dart';

class AdminAppoinments extends StatelessWidget {
  dynamic link;
  AdminAppoinments({Key? key, required this.link}) : super(key: key);

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
              horizontal: 30,
            ),
            child: Card(
              color: lightGreyTwo,
              child: Table(
                columnWidths: const {
                  0: FlexColumnWidth(0.6),
                  1: FlexColumnWidth(1.5),
                  2: FlexColumnWidth(0.8),
                  3: FlexColumnWidth(1.0),
                  4: FlexColumnWidth(1.0),
                  5: FlexColumnWidth(0.8),
                  6: FlexColumnWidth(1.5),
                  7: FlexColumnWidth(0.7),
                  8: FlexColumnWidth(0.7),
                  9: FlexColumnWidth(0.7),
                },
                border: TableBorder.all(color: Colors.black),
                children: const [
                  TableRow(
                      decoration: BoxDecoration(
                        color: Colors.blue,
                      ),
                      children: [
                        CustomTableHead(title: 'Sl. No'),
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
              horizontal: 30,
            ),
            child: Card(
              color: lightGreyTwo,
              child: FutureBuilder<AdminAppointmentsListModel?>(
                future: _adminAppoinmentServices.getAllAppoinments(
                    link: link ?? '/'),
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
                            0: FlexColumnWidth(0.6),
                            1: FlexColumnWidth(1.5),
                            2: FlexColumnWidth(0.8),
                            3: FlexColumnWidth(1.0),
                            4: FlexColumnWidth(1.0),
                            5: FlexColumnWidth(0.8),
                            6: FlexColumnWidth(1.5),
                            7: FlexColumnWidth(0.7),
                            8: FlexColumnWidth(0.7),
                            9: FlexColumnWidth(0.7),
                          },
                          border:
                              TableBorder.all(color: Colors.black, width: 0.2),
                          children:
                              List<TableRow>.generate(list.length, (index) {
                            return TableRow(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0, vertical: 10),
                                  child: Text(
                                    '${index + 1}',
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0, vertical: 10),
                                  child: Text(list[index].user!),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0, vertical: 10),
                                  child: Text(list[index].status.toString()),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0, vertical: 10),
                                  child: Text(list[index]
                                      .date
                                      .toString()
                                      .substring(0, 10)),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0, vertical: 10),
                                  child: Text(list[index].time.toString()),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0, vertical: 10),
                                  child: Text(list[index].fee.toString()),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0, vertical: 10),
                                  child: Text(list[index].doctor.toString()),
                                ),
                                list[index].status == 'Scheduled'
                                    ? Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20.0, vertical: 10),
                                        child: IconButton(
                                            onPressed: () async {
                                              final isCompleted =
                                                  await _adminAppoinmentServices
                                                      .markAppointmentAsComplete(
                                                          id: list[index].sId,
                                                          status: 'Complete');
                                              if (isCompleted) {
                                                showSnackBar(
                                                    context: context,
                                                    message:
                                                        'Appointment Marked as Complete');

                                                navigationController.navigateTo(
                                                    adminAppointmentsPage,
                                                    arguments: '');
                                              }
                                            },
                                            icon: const Icon(
                                                Icons.check_box_outline_blank)),
                                      )
                                    : const SizedBox(),
                                list[index].status == 'Scheduled'
                                    ? Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20.0, vertical: 10),
                                        child: IconButton(
                                            onPressed: () async {
                                              final isCompleted =
                                                  await _adminAppoinmentServices
                                                      .markAppointmentAsComplete(
                                                          id: list[index].sId,
                                                          status: 'Canceled');
                                              if (isCompleted) {
                                                showSnackBar(
                                                    context: context,
                                                    message:
                                                        'Appointment Marked as Canceled');

                                                navigationController.navigateTo(
                                                    adminAppointmentsPage,
                                                    arguments: '');
                                              }
                                            },
                                            icon: const Icon(Icons.cancel)),
                                      )
                                    : const SizedBox(),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0, vertical: 10),
                                  child: IconButton(
                                      onPressed: () async {
                                        final isCompleted =
                                            await _adminAppoinmentServices
                                                .deleteAppointment(
                                          id: list[index].sId,
                                        );
                                        if (isCompleted) {
                                          showSnackBar(
                                              context: context,
                                              message:
                                                  'Appointment Deleted Permenantly');
                                          navigationController.navigateTo(
                                              adminAppointmentsPage,
                                              arguments: '');
                                        }
                                      },
                                      icon: const Icon(Icons.delete)),
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
          if (link != '')
            CustomButtonOne(
                onPressed: () {
                  navigationController.navigateTo(adminDoctorsPage,
                      arguments: '');
                },
                text: 'Go Back'),
        ],
      ),
    );
  }
}
