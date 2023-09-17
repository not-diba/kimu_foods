import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'partials/material_colors.dart';

class KimuFoodsTheme {
  // Font Theme
  static ThemeData light() {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      primarySwatch: pumpkin,
      textTheme: GoogleFonts.ralewayTextTheme(),
      scaffoldBackgroundColor: backgroundColor,
    );
  }

  static ThemeData dark() {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      primarySwatch: pumpkin,
      textTheme: GoogleFonts.ralewayTextTheme(),
      scaffoldBackgroundColor: Colors.black,
    );
  }
}

