import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kimu_foods/core/utils/theme/text_styles.dart';
import 'material_colors.dart';

class KimuFoodsTheme {
  // Font Theme
  static ThemeData light() {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      bottomSheetTheme: BottomSheetThemeData(
        showDragHandle: true,
        dragHandleSize: const Size(64, 4),
        backgroundColor: backgroundColor[300],
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(18),
            topRight: Radius.circular(18),
          ),
        ),
      ),
      primarySwatch: mainColor,
      textTheme: GoogleFonts.rubikTextTheme(),
      scaffoldBackgroundColor: backgroundColor[300],
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
