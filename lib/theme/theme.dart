import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: const ColorScheme.light(
        primary: Color.fromARGB(255, 124, 231, 35),
        secondary: Color(0xFF222222),
        background: Color(0xFFF9F9F9),
      ),
      scaffoldBackgroundColor: const Color(0xFFF9F9F9),
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFFF9F9F9),
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: Color(0xFF222222),
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        iconTheme: IconThemeData(color: Color(0xFF222222)),
      ),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(fontSize: 16, color: Color(0xFF222222)),
        bodyMedium: TextStyle(fontSize: 14, color: Color(0xFF444444)),
        labelLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFF02C7A3),
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          textStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ),
    );
  }
}
