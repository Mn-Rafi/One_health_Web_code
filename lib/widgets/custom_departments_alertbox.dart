import 'package:flutter/material.dart';
import 'package:one_health_doctor_and_admin/pages/register/screen_register.dart';

enum Departments { one, two, three, four, five, six, seven, eight }

class DepartmentsAlertBox extends StatelessWidget {
  const DepartmentsAlertBox({Key? key}) : super(key: key);

  static List<String> departmentss = [
    'General',
    'Cardiology',
    'Dental',
    'Dermatology',
    'Endocrinology',
    'Gastroenterology',
    'General Surgery',  
    'Hematology',
  ];

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title: const Text('Select a Department'),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))),
        content: SingleChildScrollView(
          child: SizedBox(
            width: double.maxFinite,
            child: ListView.builder(
              itemCount: departmentss.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(departmentss[index]),
                  onTap: () {
                    ScreenRegister.departmentsController.text =
                        departmentss[index];
                    Navigator.of(context).pop();
                  },
                );
              },
            ),
          ),
        ));
  }
}
