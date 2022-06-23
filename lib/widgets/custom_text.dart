import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double? fontSize;
  final Color? fontColor;
  final FontWeight? fontWeight;
  const CustomText({
    Key? key,
    required this.text,
    this.fontSize,
    this.fontColor,
    this.fontWeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: TextStyle(
            fontSize: fontSize ?? 16,
            color: fontColor ?? Colors.black,
            fontWeight: fontWeight ?? FontWeight.normal));
  }
}
