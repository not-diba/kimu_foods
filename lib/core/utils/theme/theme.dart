import 'package:flutter/material.dart';

import '../theme/colours.dart';

class KimuFoodsTheme {
  static Color skeletonBase = kimuTertiary.withValues(alpha: 0.4);
  static final Color skeletonHighlight = kimuTertiary.withValues(alpha: 0.6);
  static const ColorScheme lightColorScheme = ColorScheme(
    primary: kimuPrimary,
    onPrimary: Colors.white,
    secondary: kimuSecondary,
    onSecondary: Colors.white,
    error: kimuError,
    onError: Colors.white,
    surface: kimuLightBackground,
    onSurface: kimuTertiary,
    brightness: Brightness.light,
  );

  static const ColorScheme darkColorScheme = ColorScheme(
    primary: kimuPrimary,
    onPrimary: Colors.white,
    secondary: kimuSecondary,
    onSecondary: Colors.white,
    error: kimuError,
    onError: Colors.white,
    surface: kimuDarkBackground,
    onSurface: kimuLightBackground,
    brightness: Brightness.dark,
  );

  //TODO: Maybe change this focus colors ?
  static final Color _lightFocusColor = Colors.black.withOpacity(0.12);
  static final Color _darkFocusColor = Colors.white.withOpacity(0.12);

  static ThemeData lightThemeData =
      themeData(lightColorScheme, _lightFocusColor);
  static ThemeData darkThemeData = themeData(darkColorScheme, _darkFocusColor);

  static ThemeData themeData(ColorScheme colorScheme, Color focusColor) {
    return ThemeData(
      fontFamily: 'Poppins',
      colorScheme: colorScheme,
      canvasColor: colorScheme.surface,
      scaffoldBackgroundColor: colorScheme.surface,
      highlightColor: Colors.transparent,
      focusColor: focusColor,
      iconTheme: IconThemeData(color: colorScheme.onSurface, size: 12.0),
      tabBarTheme: TabBarThemeData(
        dividerColor: Colors.transparent,
        dividerHeight: 0,
        splashFactory: NoSplash.splashFactory,
        indicator: UnderlineTabIndicator(
          borderSide: BorderSide(width: 3.0, color: colorScheme.primary),
          insets: const EdgeInsets.only(right: 32.0),
        ),
        labelStyle: TextStyle(
          color: colorScheme.onSurface,
          fontWeight: FontWeight.w500,
          fontFamily: 'Poppins',
          fontSize: 16,
        ),
        unselectedLabelStyle: const TextStyle(
          color: taupe,
          fontWeight: FontWeight.w400,
          fontFamily: 'Poppins',
          fontSize: 16,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: colorScheme.primary,
          side: const BorderSide(color: bone, width: 1.2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          textStyle:
              const TextStyle(fontWeight: FontWeight.w600, fontSize: 15.0),
        ),
      ),
      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith<Color>((states) {
          if (states.contains(WidgetState.selected)) {
            return kimuPrimary;
          }
          return taupe;
        }),
        trackColor: MaterialStateProperty.resolveWith<Color>((states) {
          if (states.contains(MaterialState.selected)) {
            return kimuPrimary.withValues(alpha: 0.5);
          }
          return taupe.withValues(alpha: 0.5);
        }),
        trackOutlineWidth: WidgetStateProperty.all(0.0),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: colorScheme.onPrimary,
          backgroundColor: colorScheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          textStyle:
              const TextStyle(fontWeight: FontWeight.w600, fontSize: 15.0),
        ),
      ),
      iconButtonTheme: IconButtonThemeData(
        style: IconButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.all(10),
          foregroundColor: colorScheme.primary,
          side: const BorderSide(color: bone, width: 1.2),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14.0),
          borderSide: const BorderSide(
            color: bone,
            width: 1.0,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14.0),
          borderSide: const BorderSide(
            color: bone,
            width: 1.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14.0),
          borderSide: BorderSide(
            color: kimuPrimary.withOpacity(.8),
            width: 1.0,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14.0),
          borderSide: BorderSide(
            color: kimuError.withOpacity(.2),
            width: 1.0,
          ),
        ),
        labelStyle: const TextStyle(
          fontSize: 14.0,
          fontWeight: FontWeight.w400,
        ),
        hintStyle: const TextStyle(
          fontSize: 14.0,
          fontWeight: FontWeight.w400,
        ),
        helperStyle: const TextStyle(
          fontSize: 14.0,
          fontWeight: FontWeight.w400,
        ),
        errorStyle: const TextStyle(
          fontSize: 8.0,
          fontWeight: FontWeight.w400,
        ),
      ),
      textTheme: TextTheme(
        displayLarge: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 36,
          fontWeight: FontWeight.w400,
          color: colorScheme.onSurface,
        ),
        displayMedium: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 32,
          color: colorScheme.onSurface,
        ),
        displaySmall: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 28,
          color: colorScheme.onSurface,
        ),
        headlineMedium: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 24,
          fontWeight: FontWeight.w400,
          color: colorScheme.onSurface,
        ),
        headlineSmall: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 22,
          fontWeight: FontWeight.w400,
          color: colorScheme.onSurface,
        ),
        titleLarge: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 20,
          fontWeight: FontWeight.w400,
          color: colorScheme.onSurface,
        ),
        titleMedium: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: colorScheme.onSurface,
        ),
        titleSmall: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: colorScheme.onSurface,
        ),
        bodyLarge: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: colorScheme.onSurface,
        ),
        bodyMedium: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: colorScheme.onSurface,
        ),
        bodySmall: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: colorScheme.onSurface,
        ),
        labelLarge: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: colorScheme.onSurface,
        ),
        labelSmall: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 10,
          fontWeight: FontWeight.w400,
          color: colorScheme.onSurface,
        ),
      ),
    );
  }
}
