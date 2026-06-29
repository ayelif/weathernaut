import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xFF0F8CFF),
        brightness: Brightness.light,
        primary: const Color(0xFF0F8CFF),
        secondary: const Color(0xFF35A7FF),
        surface: const Color(0xFFF6F8FA),
        background: Colors.white,
      ),
      textTheme: GoogleFonts.poppinsTextTheme(ThemeData.light().textTheme).copyWith(
        displayLarge: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 32),
        titleLarge: GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 20),
        bodyLarge: GoogleFonts.poppins(fontWeight: FontWeight.normal, fontSize: 16),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: Colors.transparent,
        elevation: 0,
        indicatorColor: Colors.transparent,
        iconTheme: WidgetStateProperty.resolveWith<IconThemeData>(
          (states) {
            if (states.contains(WidgetState.selected)) {
              return const IconThemeData(
                color: Color(0xFF0F8CFF),
                size: 26,
              );
            }
            return const IconThemeData(
              color: Colors.black38,
              size: 24,
            );
          },
        ),
        labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>(
          (states) {
            if (states.contains(WidgetState.selected)) {
              return const TextStyle(
                color: Color(0xFF0F8CFF),
                fontWeight: FontWeight.w600,
                fontSize: 12,
              );
            }
            return const TextStyle(
              color: Colors.black38,
              fontWeight: FontWeight.w500,
              fontSize: 11,
            );
          },
        ),
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xFF0F8CFF),
        brightness: Brightness.dark,
        primary: const Color(0xFF0F8CFF),
        secondary: const Color(0xFF35A7FF),
        surface: const Color(0xFF0F172A),
        background: const Color(0xFF020617),
      ),
      textTheme: GoogleFonts.poppinsTextTheme(ThemeData.dark().textTheme).copyWith(
        displayLarge: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 32, color: Colors.white),
        titleLarge: GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 20, color: Colors.white),
        bodyLarge: GoogleFonts.poppins(fontWeight: FontWeight.normal, fontSize: 16, color: Colors.white70),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: Colors.transparent,
        elevation: 0,
        indicatorColor: Colors.transparent,
        iconTheme: WidgetStateProperty.resolveWith<IconThemeData>(
          (states) {
            if (states.contains(WidgetState.selected)) {
              return const IconThemeData(
                color: Color(0xFF0F8CFF),
                size: 26,
              );
            }
            return const IconThemeData(
              color: Colors.white38,
              size: 24,
            );
          },
        ),
        labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>(
          (states) {
            if (states.contains(WidgetState.selected)) {
              return const TextStyle(
                color: Color(0xFF0F8CFF),
                fontWeight: FontWeight.w600,
                fontSize: 12,
              );
            }
            return const TextStyle(
              color: Colors.white38,
              fontWeight: FontWeight.w500,
              fontSize: 11,
            );
          },
        ),
      ),
    );
  }
}
