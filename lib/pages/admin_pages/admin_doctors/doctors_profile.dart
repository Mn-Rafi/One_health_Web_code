import 'package:flutter/material.dart';
import 'package:one_health_doctor_and_admin/constants/styles.dart';
import 'package:one_health_doctor_and_admin/widgets/custom_botton_one.dart';

class DoctorProfileAdminSide extends StatelessWidget {
  const DoctorProfileAdminSide({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 50),
        child: Card(
            color: lightGreyTwo,
            child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(
                          'https://static.vecteezy.com/system/resources/thumbnails/006/017/842/small_2x/customer-service-icon-user-with-laptop-computer-and-headphone-illustration-free-vector.jpg',
                          width: 200,
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        'Name : ',
                                        style: mainHeaderStyle.copyWith(
                                            fontSize: 14),
                                      ),
                                    ),
                                    Text(
                                      '',
                                      style: normalTextStyle,
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        'ID : ',
                                        style: mainHeaderStyle.copyWith(
                                            fontSize: 14),
                                      ),
                                    ),
                                    Text(
                                      '',
                                      style: normalTextStyle,
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        'Email : ',
                                        style: mainHeaderStyle.copyWith(
                                            fontSize: 14),
                                      ),
                                    ),
                                    Text(
                                      '',
                                      style: normalTextStyle,
                                    )
                                  ],
                                ),
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            'Qualification : ',
                                            style: mainHeaderStyle.copyWith(
                                                fontSize: 14),
                                          ),
                                        ),
                                        Text(
                                          '',
                                          style: normalTextStyle,
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            'Experience : ',
                                            style: mainHeaderStyle.copyWith(
                                                fontSize: 14),
                                          ),
                                        ),
                                        Text(
                                          '',
                                          style: normalTextStyle,
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            'Department : ',
                                            style: mainHeaderStyle.copyWith(
                                                fontSize: 14),
                                          ),
                                        ),
                                        Text(
                                          '',
                                          style: normalTextStyle,
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            'Area of expertise : ',
                                            style: mainHeaderStyle.copyWith(
                                                fontSize: 14),
                                          ),
                                        ),
                                        Text(
                                          '',
                                          style: normalTextStyle,
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            'OP Time : ',
                                            style: mainHeaderStyle.copyWith(
                                                fontSize: 14),
                                          ),
                                        ),
                                        Text(
                                          ' to ',
                                          style: normalTextStyle,
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ])),
                    ],
                  ),
                  Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CustomButtonOne(
                              onPressed: () {
                                print('Appointments');
                              },
                              text: 'Appointments'),
                          CustomButtonOne(
                              onPressed: () {
                                print('Prescriptions');
                              },
                              text: 'Prescriptions'),
                          CustomButtonOne(
                              onPressed: () {
                                print('Set Inactive');
                              },
                              text: 'Set Inactive'),
                          CustomButtonOne(
                              onPressed: () {
                                print('Remove Admin Access');
                              },
                              text: 'Remove Admin Access'),
                          CustomButtonOne(
                              onPressed: () {
                                print('Remove Doctor');
                              },
                              text: 'Remove Doctor'),
                        ],
                      ),
                    ],
                  ),
                ]))),
      ),
    );
  }
}
