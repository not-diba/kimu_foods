import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'partials/material_colors.dart';

class KimuFoodsTheme {
  // Font Theme
  static ThemeData light() {
    return ThemeData(
      brightness: Brightness.light,
      primarySwatch: pumpkin,
      textTheme: GoogleFonts.ralewayTextTheme(),
      scaffoldBackgroundColor: backgroundColor,
    );
  }

  static ThemeData dark() {
    return ThemeData(
      brightness: Brightness.dark,
      primarySwatch: pumpkin,
      textTheme: GoogleFonts.ralewayTextTheme(),
      scaffoldBackgroundColor: Colors.black,
    );
  }
}

