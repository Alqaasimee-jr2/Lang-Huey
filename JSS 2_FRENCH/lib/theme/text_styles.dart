import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'colors.dart';

class LangHueyTextStyles {
  static TextStyle get h1 => GoogleFonts.outfit(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: LangHueyColors.charcoal,
      );

  static TextStyle get h2 => GoogleFonts.outfit(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: LangHueyColors.charcoal,
      );

  static TextStyle get h3 => GoogleFonts.outfit(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: LangHueyColors.charcoal,
      );

  static TextStyle get bodyLarge => GoogleFonts.inter(
        fontSize: 15,
        fontWeight: FontWeight.normal,
        color: LangHueyColors.charcoal,
      );

  static TextStyle get bodySmall => GoogleFonts.inter(
        fontSize: 13,
        fontWeight: FontWeight.normal,
        color: LangHueyColors.textMuted,
      );

  static TextStyle get frenchHighlight => GoogleFonts.outfit(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: LangHueyColors.deepTeal,
      );

  static TextStyle get badge => GoogleFonts.outfit(
        fontSize: 11,
        fontWeight: FontWeight.bold,
        letterSpacing: 1.1,
      );
}
