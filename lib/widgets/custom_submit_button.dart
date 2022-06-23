import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomSubmitButton extends StatelessWidget {
  final String text;
  final Color bgColor;
  final double? buttonWidth;
  const CustomSubmitButton({
    Key? key,
    required this.text,
    required this.bgColor,
    this.buttonWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: buttonWidth ?? 200,
      padding: const EdgeInsets.all(20),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: bgColor,
      ),
      child: Text(
        text,
        style: GoogleFonts.ubuntu(
            color: Colors.white, fontWeight: FontWeight.w400, fontSize: 14),
      ),
    );
  }
}

class CustomLoadingSubmitButton extends StatelessWidget {
  final String text;
  final Color bgColor;
  const CustomLoadingSubmitButton({
    Key? key,
    required this.text,
    required this.bgColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 50,
      height: 6,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2),
        color: bgColor,
      ),
      child: SizedBox(
          height: 2.5,
          width: 2.5,
          child: const CircularProgressIndicator(
            color: Colors.white,
          )),
    );
  }
}
