import 'package:flutter/material.dart';

class AppColors {
  static const Color background = Color(0xFF141414); // Netflix Dark
  static const Color backgroundDeep = Color(0xFF000000);
  static const Color accentCyan = Color(0xFFE50914); // Netflix Red
  static const Color glassColor = Color(0x33000000);
  static const Color glassBorderColor = Color(0x33FFFFFF);
  static const Color textMain = Colors.white;
  static const Color surfaceLow = Color(0xFF1F1F1F);
}

class AppTheme {
  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: AppColors.accentCyan,
      scaffoldBackgroundColor: Colors.transparent, // Mantenemos transparente para el video
      canvasColor: AppColors.background,
      fontFamily: 'Inter',
    );
  }
}
