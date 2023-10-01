import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kimu_foods/utils/theme/partials/text_styles.dart';
import 'partials/material_colors.dart';

class KimuFoodsTheme {
  // Font Theme
  static ThemeData light() {
    return ThemeData(
      // useMaterial3: true,
      brightness: Brightness.light,
      primarySwatch: mainColor,
      textTheme: GoogleFonts.rubikTextTheme(),
      scaffoldBackgroundColor: backgroundColor[100],
      appBarTheme: AppBarTheme(
        titleTextStyle: kimuFoodsTitleTextStyle,
      ),
    );
  }

  static ThemeData dark() {
    return ThemeData(
      // useMaterial3: true,
      brightness: Brightness.dark,
      primarySwatch: pumpkin,
      textTheme: GoogleFonts.ralewayTextTheme(),
      scaffoldBackgroundColor: Colors.black,
    );
  }
}

