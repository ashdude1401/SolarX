import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'colors.dart';

class CustomTheme {
  static ThemeData lightTheme() {
    return ThemeData(
      useMaterial3: true,
      fontFamily: GoogleFonts.quicksand(
        fontWeight: FontWeight.w500,
      ).fontFamily,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }

  static ThemeData darkTheme() {
    return ThemeData(
      useMaterial3: true,
      fontFamily: GoogleFonts.quicksand(
        fontWeight: FontWeight.w500,
      ).fontFamily,
      brightness: Brightness.dark,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: mobiledarkBackgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    ).copyWith(
      scaffoldBackgroundColor: mobiledarkBackgroundColor,
    );
  }
}
