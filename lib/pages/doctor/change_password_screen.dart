import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:one_health_doctor_and_admin/constants/controller.dart';
import 'package:one_health_doctor_and_admin/constants/styles.dart';
import 'package:one_health_doctor_and_admin/widgets/custom_botton_one.dart';

class DoctorChangePassword extends StatelessWidget {
  const DoctorChangePassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String oldPassword = '';
    String newPassword = '';
    String confirmPassword = '';
    return SingleChildScrollView(
      child: Column(
        children: [
          Text(
            'Change Password',
            style: mainHeaderStyle,
          ),
          Card(
            color: lightGreyTwo,
            margin: const EdgeInsets.all(30),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  TextField(
                    onChanged: (value) {
                      oldPassword = value;
                    },
                    decoration: InputDecoration(
                      labelText: 'Old Password',
                    ),
                  ),
                  TextField(
                    onChanged: (value) {
                      newPassword = value;
                    },
                    decoration: InputDecoration(
                      labelText: 'New Password',
                    ),
                  ),
                  TextField(
                    onChanged: (value) {
                      confirmPassword = value;
                    },
                    decoration: const InputDecoration(
                      labelText: 'Confirm Password',
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  CustomButtonOne(
                    text: 'Change Password',
                    onPressed: () {
                      if (newPassword == confirmPassword && newPassword != '') {
                        passwordChangeController.doctorChangePassword(
                            oldPassword, newPassword, context);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text('Please provide valid data')));
                      }
                    },
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
