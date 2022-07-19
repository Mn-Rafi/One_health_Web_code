import 'package:flutter/material.dart';
import 'package:one_health_doctor_and_admin/api/admin_api/admin_dashboard_services.dart';
import 'package:one_health_doctor_and_admin/constants/styles.dart';
import 'package:one_health_doctor_and_admin/pages/admin_pages/admin_dashboard/daily_income_chart.dart';
import 'package:one_health_doctor_and_admin/pages/admin_pages/admin_dashboard/department_chart.dart';

class AdminDashboard extends StatelessWidget {
  AdminDashboard({Key? key}) : super(key: key);

  final AdminDashBoardServices _adminDashBoardServices =
      AdminDashBoardServices();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Text(
            'Admin Dashboard',
            style: mainHeaderStyle,
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: Wrap(
              children: [
                SizedBox(
                  width: 500,
                  child: Expanded(
                    child: FutureBuilder<DoctorAndUserCardModel?>(
                        future:
                            _adminDashBoardServices.getDoctorsandUsersCard(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return Card(
                              color: lightGreyTwo,
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Row(
                                  children: [
                                    Column(children: [
                                      Text('Total doctors',
                                          style: mainHeaderStyle.copyWith(
                                              fontSize: 15)),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(snapshot.data!.doctor![0].toString(),
                                          style: mainHeaderStyle.copyWith(
                                              color: Colors.blue,
                                              fontSize: 22)),
                                    ]),
                                    const Spacer(),
                                    Column(children: [
                                      Text('Active doctors',
                                          style: mainHeaderStyle.copyWith(
                                              fontSize: 15)),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(snapshot.data!.doctor![1].toString(),
                                          style: mainHeaderStyle.copyWith(
                                              color: Colors.blue,
                                              fontSize: 22)),
                                    ]),
                                    const Spacer(),
                                    Column(children: [
                                      Text('Inactive doctors',
                                          style: mainHeaderStyle.copyWith(
                                              fontSize: 15)),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(snapshot.data!.doctor![2].toString(),
                                          style: mainHeaderStyle.copyWith(
                                              color: Colors.blue,
                                              fontSize: 22)),
                                    ]),
                                  ],
                                ),
                              ),
                            );
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
                        }),
                  ),
                ),
                const SizedBox(
                  width: 30,
                ),
                SizedBox(
                  width: 500,
                  child: Expanded(
                    child: FutureBuilder<DoctorAndUserCardModel?>(
                        future:
                            _adminDashBoardServices.getDoctorsandUsersCard(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return Card(
                              color: lightGreyTwo,
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Row(
                                  children: [
                                    Column(children: [
                                      Text('Total Users',
                                          style: mainHeaderStyle.copyWith(
                                              fontSize: 15)),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(snapshot.data!.user![0].toString(),
                                          style: mainHeaderStyle.copyWith(
                                              color: Colors.blue,
                                              fontSize: 22)),
                                    ]),
                                    const Spacer(),
                                    Column(children: [
                                      Text('Active Users',
                                          style: mainHeaderStyle.copyWith(
                                              fontSize: 15)),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(snapshot.data!.user![1].toString(),
                                          style: mainHeaderStyle.copyWith(
                                              color: Colors.blue,
                                              fontSize: 22)),
                                    ]),
                                    const Spacer(),
                                    Column(children: [
                                      Text('Blocked Users',
                                          style: mainHeaderStyle.copyWith(
                                              fontSize: 15)),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(snapshot.data!.user![2].toString(),
                                          style: mainHeaderStyle.copyWith(
                                              color: Colors.blue,
                                              fontSize: 22)),
                                    ]),
                                  ],
                                ),
                              ),
                            );
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
                        }),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Wrap(
            children: [
              AmountChart(),
              DepartmentListChart(),
            ],
          ),
        ],
      ),
    );
  }
}
