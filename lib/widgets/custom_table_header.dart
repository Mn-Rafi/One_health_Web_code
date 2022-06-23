
import 'package:flutter/material.dart';
import 'package:one_health_doctor_and_admin/constants/styles.dart';

class CustomTableHead extends StatelessWidget {
  final String title;
  const CustomTableHead({
    Key? key, required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(title, style: mainHeaderStyle.copyWith(fontSize: 15, color: Colors.white),),
      ),
    );
  }
}
