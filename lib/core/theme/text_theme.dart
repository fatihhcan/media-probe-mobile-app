import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';


class TextThemeManager {
  static TextThemeManager? _instance;
  static TextThemeManager get instance {
    return _instance ??= TextThemeManager.init();
  }

  TextThemeManager.init();

  TextTheme textTheme({bool isDark = false}) {
    return TextTheme(
      displayLarge: TextStyle(
        fontFamily: GoogleFonts.manrope().fontFamily,
        fontSize: 30,
        fontWeight: FontWeight.w700,
        decoration: TextDecoration.underline,
        color: Colors.white,
        decorationColor: Colors.white.withOpacity(0.01),
      ),
      
   displaySmall: TextStyle(
        fontFamily:GoogleFonts.manrope().fontFamily,
        fontSize: 24,
        decoration: TextDecoration.underline,
        color: Colors.white,
        decorationColor: Colors.white.withOpacity(0.01),
      ),

      headlineMedium: TextStyle(
        fontFamily:GoogleFonts.manrope().fontFamily,
        fontSize: 20,
        decoration: TextDecoration.underline,
        fontWeight: FontWeight.w700,
        color: Colors.white,
        decorationColor: Colors.white.withOpacity(0.01),
      ),

      headlineSmall: TextStyle(
        fontFamily: GoogleFonts.manrope().fontFamily,
        fontSize: 16,
        fontWeight: FontWeight.w600,
        decoration: TextDecoration.underline,
        color: Colors.white,
        decorationColor: Colors.white.withOpacity(0.01),
      ),


      bodyLarge: TextStyle(
        fontFamily:GoogleFonts.manrope().fontFamily,
        fontSize: 10,
        fontWeight: FontWeight.w600,
        decoration: TextDecoration.underline,
        color: Colors.white,
        decorationColor: Colors.white.withOpacity(0.01),
      ),

      titleMedium:  TextStyle(
        fontFamily: GoogleFonts.manrope().fontFamily,
        fontSize: 12,
        fontWeight: FontWeight.w700,
        decoration: TextDecoration.underline,
        color: Colors.white,
        decorationColor: Colors.white.withOpacity(0.01),
      ),


    );
  }
}