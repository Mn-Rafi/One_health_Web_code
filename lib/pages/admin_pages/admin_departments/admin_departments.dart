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
                    itemBuilder: (context, index) => Padding(
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
                              Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.red,
                                  ),
                                  width: 50,
                                  child: const Padding(
                                    padding: EdgeInsets.all(4.0),
                                    child:
                                        Icon(Icons.edit, color: Colors.black),
                                  )),
                              const SizedBox(width: 10),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.red,
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
                            ],
                          ),
                          children: List<InkWell>.generate(
                              snapshot.data!.doctorsList![index].length,
                              (indx) => InkWell(
                                    onTap: () {
                                      navigationController.navigateTo(
                                          adminDoctorProfileViewPage,
                                          arguments: '');
                                    },
                                    child: Text(
                                      snapshot.data!.doctorsList![index][indx]
                                          .doctor!.name!,
                                      style: mainHeaderStyle,
                                    ),
                                  )),
                        ),
                      ),
                    ),
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
                      color: Colors.red,
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
