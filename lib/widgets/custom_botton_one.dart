import 'package:flutter/material.dart';
import 'package:one_health_doctor_and_admin/constants/styles.dart';

class CustomButtonOne extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  const CustomButtonOne({
    Key? key,
    required this.text,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed ?? () {},
        child:
            Text(text, style: normalTextStyle.copyWith(color: Colors.white)));
  }
}
