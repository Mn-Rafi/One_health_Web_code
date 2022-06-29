import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color light = Color(0xFFF7F8FC);
const Color lightGrey = Color(0xFFA4A6B3);
const Color dark = Color(0xFF363740);
const Color active = Color(0xFF3C19C0);
const Color   lightGreyTwo = Color.fromARGB(255, 221, 239, 255);

final mainHeaderStyle = GoogleFonts.exo(
  fontSize: 30,
  fontWeight: FontWeight.w500,
);

final normalTextStyle = GoogleFonts.ubuntu(color: Colors.grey[800]);
final normalTextStyledark =
    GoogleFonts.ubuntu(color: const Color.fromARGB(255, 197, 197, 197));
const BoxDecoration kboxdecoration = BoxDecoration(
    gradient: LinearGradient(colors: [Color(0xffa1c4fd), Color(0xffc2e9fb)]));

showSnackBar({required BuildContext context, required String message}) {
  ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)));
}
