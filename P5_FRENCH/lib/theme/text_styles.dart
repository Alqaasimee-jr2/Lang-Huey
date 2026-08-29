import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'colors.dart';

class P5Text {
  static TextStyle heroHeading([Color color = P5Colors.charcoal]) => GoogleFonts.nunito(
        fontSize: 34,
        fontWeight: FontWeight.w900,
        color: color,
        letterSpacing: -0.5,
      );

  static TextStyle heading([Color color = P5Colors.charcoal]) => GoogleFonts.nunito(
        fontSize: 26,
        fontWeight: FontWeight.w800,
        color: color,
      );

  static TextStyle subheading([Color color = P5Colors.charcoal]) => GoogleFonts.nunito(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        color: color,
      );

  static TextStyle body([Color color = P5Colors.charcoal]) => GoogleFonts.nunito(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: color,
      );

  static TextStyle caption([Color color = P5Colors.charcoal]) => GoogleFonts.nunito(
        fontSize: 13,
        fontWeight: FontWeight.w500,
        color: color,
      );

  static TextStyle frenchPhrase([Color color = P5Colors.teal]) => GoogleFonts.nunito(
        fontSize: 22,
        fontWeight: FontWeight.w800,
        color: color,
      );

  static TextStyle phonetic([Color color = P5Colors.gold]) => GoogleFonts.nunito(
        fontSize: 15,
        fontWeight: FontWeight.w600,
        fontStyle: FontStyle.italic,
        color: color,
      );
}
