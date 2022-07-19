import 'package:flutter/material.dart';
import 'package:one_health_doctor_and_admin/api/admin_api/admin_departments_services.dart';
import 'package:one_health_doctor_and_admin/constants/controller.dart';
import 'package:one_health_doctor_and_admin/constants/styles.dart';
import 'package:one_health_doctor_and_admin/helpers/admin_department_response_model.dart';
import 'package:one_health_doctor_and_admin/helpers/text_field_validator_mixin.dart';
import 'package:one_health_doctor_and_admin/routing/routes.dart';
import 'package:one_health_doctor_and_admin/widgets/custom_botton_one.dart';
import 'package:one_health_doctor_and_admin/widgets/custom_text_formfield.dart';

class AdminDepartment extends StatelessWidget with TextFieldValidator {
  AdminDepartment({Key? key}) : super(key: key);

  final AdminDepartmetnServices _adminDepartmetnServices =
      AdminDepartmetnServices();
  final TextEditingController _departmentNameController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Text(
            'Departments',
            style: mainHeaderStyle,
          ),
          FutureBuilder<DepartmentResponseModel?>(
              future: _adminDepartmetnServices.getDepartmentList(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Column(
                    children: const [
                      SizedBox(
                        height: 100,
                      ),
                      CircularProgressIndicator()
                    ],
                  );
                } else if (snapshot.hasData) {
                  return ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 30,
                        ),
                        child: Card(
                          color: lightGreyTwo,
                          child: ExpansionTile(
                            title: Text(
                              snapshot.data!.departmentList![index],
                              style: mainHeaderStyle.copyWith(fontSize: 20),
                            ),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                // InkWell(
                                //   onTap: () {
                                //     _adminDepartmetnServices
                                //         .editDepartment(
                                //             _adminDepartmetnServices
                                //                 .departmentsIdList[index],
                                //             'General')
                                //         .then((value) {
                                //       if (value) {
                                //         ScaffoldMessenger.of(context)
                                //             .removeCurrentSnackBar();
                                //         ScaffoldMessenger.of(context)
                                //             .showSnackBar(
                                //           const SnackBar(
                                //             content: Text(
                                //                 'Department Edited Succesfully'),
                                //           ),
                                //         );
                                //         navigationController.navigateTo(
                                //             adminDepartmentsPage,
                                //             arguments: '');
                                //       }
                                //     });
                                //   },
                                //   child: Container(
                                //       decoration: BoxDecoration(
                                //         borderRadius: BorderRadius.circular(5),
                                //         color: Colors.red,
                                //       ),
                                //       width: 50,
                                //       child: const Padding(
                                //         padding: EdgeInsets.all(4.0),
                                //         child:
                                //             Icon(Icons.edit, color: Colors.black),
                                //       )),
                                // ),
                                // const SizedBox(width: 10),
                                InkWell(
                                  onTap: () {
                                    _adminDepartmetnServices
                                        .deleteDepartment(
                                            _adminDepartmetnServices
                                                .departmentsIdList[index])
                                        .then((value) {
                                      if (value) {
                                        ScaffoldMessenger.of(context)
                                            .removeCurrentSnackBar();
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                            content: Text(
                                                'Department Deleted Succesfully'),
                                          ),
                                        );
                                        navigationController.navigateTo(
                                            adminDepartmentsPage,
                                            arguments: '');
                                      }
                                    });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Colors.white,
                                    ),
                                    width: 50,
                                    child: const Padding(
                                      padding: EdgeInsets.all(4.0),
                                      child: Icon(
                                        Icons.delete,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            children: List<InkWell>.generate(
                                snapshot.data!.doctorsList![index].length,
                                (indx) => InkWell(
                                      onTap: () {
                                        navigationController.navigateTo(
                                            adminDoctorProfileViewPage,
                                            arguments: snapshot
                                                .data!
                                                .doctorsList![index][indx]
                                                .doctor!);
                                      },
                                      child: Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 12),
                                        child: Card(
                                          color: Colors.white,
                                          child: Padding(
                                            padding: const EdgeInsets.all(12.0),
                                            child: Row(
                                              children: [
                                                SizedBox(
                                                  width: 100,
                                                  height: 100,
                                                  child: Image.network(snapshot
                                                      .data!
                                                      .doctorsList![index][indx]
                                                      .doctor!
                                                      .image!),
                                                ),
                                                const SizedBox(
                                                  width: 50,
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: [
                                                    Text(
                                                      snapshot
                                                          .data!
                                                          .doctorsList![index]
                                                              [indx]
                                                          .doctor!
                                                          .name!,
                                                      style: mainHeaderStyle
                                                          .copyWith(fontSize: 20),
                                                    ),
                                                    Text(
                                                      snapshot
                                                          .data!
                                                          .doctorsList![index]
                                                              [indx]
                                                          .doctor!
                                                          .qualification!,
                                                      style: mainHeaderStyle
                                                          .copyWith(fontSize: 17, color: Colors.grey),
                                                    ),
                                                    Text(
                                                      checkDays(snapshot
                                                              .data!
                                                              .doctorsList![index]
                                                                  [indx]
                                                              .doctor!
                                                              .days!)
                                                          .toString(),
                                                      style: mainHeaderStyle
                                                          .copyWith(fontSize: 15, color: Colors.grey),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    )),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => const Divider(),
                    itemCount: snapshot.data!.departmentList!.length,
                  );
                } else {
                  return Column(
                    children: [
                      const SizedBox(
                        height: 100,
                      ),
                      Text(
                        'No Data Found',
                        style: mainHeaderStyle,
                      )
                    ],
                  );
                }
              }),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: Card(
              color: lightGreyTwo,
              child: ExpansionTile(
                title: Text(
                  ' - Add Deparment',
                  style: mainHeaderStyle.copyWith(fontSize: 18),
                ),
                trailing: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.white,
                    ),
                    width: 50,
                    child: const Padding(
                      padding: EdgeInsets.all(4.0),
                      child: Icon(Icons.add, color: Colors.black),
                    )),
                children: [
                  Text(
                    'Add Department',
                    style: mainHeaderStyle.copyWith(fontSize: 20),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 100),
                    child: CustomTextFormField(
                      hintText: 'Department Name',
                      textController: _departmentNameController,
                      iconData: Icons.category,
                      keyBoardType: TextInputType.name,
                      validator: (val) {
                        return isValid(val, 'Department Name');
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30),
                    child: CustomButtonOne(
                      onPressed: () {
                        if (_departmentNameController.text.isNotEmpty) {
                          _adminDepartmetnServices
                              .addDepartment(_departmentNameController.text)
                              .then((value) {
                            if (value) {
                              ScaffoldMessenger.of(context)
                                  .removeCurrentSnackBar();
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Department Added Succesfully'),
                                ),
                              );
                              navigationController.navigateTo(
                                  adminDepartmentsPage,
                                  arguments: '');
                            }
                          });
                        } else {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text('Please enter department name'),
                            duration: Duration(seconds: 2),
                          ));
                        }
                      },
                      text: 'Add Department',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

List<String> checkDays(List<int> days) {
  final List<String> daysList = [];
  for (int i = 0; i < days.length; i++) {
    switch (days[i]) {
      case 0:
        {
          daysList.add("Sunday");
          break;
        }

      case 1:
        {
          daysList.add("Monday");
          break;
        }

      case 2:
        {
          daysList.add("Tuesday");
          break;
        }
      case 3:
        {
          daysList.add("Wednesday");
          break;
        }
      case 4:
        {
          daysList.add("Thursday");
          break;
        }
      case 5:
        {
          daysList.add("Friday");
          break;
        }
      case 6:
        {
          daysList.add("Saturday");
          break;
        }
    }
  }
  return daysList;
}
