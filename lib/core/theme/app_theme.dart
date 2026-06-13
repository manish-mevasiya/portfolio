import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/app_colors.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor:
      AppColors.background,

      useMaterial3: true,

      textTheme:
      GoogleFonts.poppinsTextTheme(
        ThemeData.dark().textTheme,
      ),

      colorScheme:
      const ColorScheme.dark(
        primary: AppColors.primary,
      ),
    );
  }
}