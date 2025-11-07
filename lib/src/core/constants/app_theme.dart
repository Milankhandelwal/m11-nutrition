import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: const Color(0xFF66BB6A),
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF66BB6A),
      primary: const Color(0xFF66BB6A),
      secondary: const Color(0xFF2E7D32),
      brightness: Brightness.light,
    ),
    textTheme: GoogleFonts.poppinsTextTheme(),
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF66BB6A),
      foregroundColor: Colors.white,
      elevation: 0,
      titleTextStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
  );

  static final darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    primaryColor: const Color(0xFF66BB6A),
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF66BB6A),
      primary: const Color(0xFF66BB6A),
      secondary: const Color(0xFF2E7D32),
      brightness: Brightness.dark,
    ),
    textTheme: GoogleFonts.poppinsTextTheme().copyWith(
      bodyMedium: GoogleFonts.roboto(),
      bodyLarge: GoogleFonts.roboto(),
      bodySmall: GoogleFonts.roboto(),
    ),
    scaffoldBackgroundColor: Colors.grey.shade900,
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF2E7D32),
      foregroundColor: Colors.white,
      elevation: 0,
      titleTextStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
  );
}