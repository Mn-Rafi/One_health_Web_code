import 'package:flutter/material.dart';

import 'package:one_health_doctor_and_admin/constants/styles.dart';

class CustomButtonOne extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Color? color;
  const CustomButtonOne({
    Key? key,
    required this.text,
    this.onPressed,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: color ?? Colors.purple,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            textStyle:
                const TextStyle(fontSize: 18, fontWeight: FontWeight.w400)),
        onPressed: onPressed ?? () {},
        child:
            Text(text, style: normalTextStyle.copyWith(color: Colors.white)));
  }
}
