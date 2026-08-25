import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Lang Huey Smartboard Typography (visible from 5 meters)
/// Source of Truth: 02_lang_huey_brand_system.md
class LHText {
  static TextStyle display(Color color) => GoogleFonts.nunito(
    fontSize: 72,
    fontWeight: FontWeight.w900,
    color: color,
  );

  static TextStyle heading(Color color) => GoogleFonts.nunito(
    fontSize: 48,
    fontWeight: FontWeight.w700,
    color: color,
  );

  static TextStyle subheading(Color color) => GoogleFonts.nunito(
    fontSize: 32,
    fontWeight: FontWeight.w600,
    color: color,
  );

  static TextStyle body(Color color) => GoogleFonts.inter(
    fontSize: 24,
    fontWeight: FontWeight.w400,
    color: color,
  );

  static TextStyle cue(Color color) => GoogleFonts.inter(
    fontSize: 22,
    fontWeight: FontWeight.w400,
    color: color,
  );

  static TextStyle label(Color color) => GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: color,
    letterSpacing: 2.0,
  );
}
