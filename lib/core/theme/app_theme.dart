import 'package:flutter/material.dart';
import 'package:shartflix/core/constants/app_colors.dart';
import 'package:shartflix/core/constants/app_text_styles.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: AppColors.black,
      fontFamily: AppTextStyles.h1.fontFamily, // Use Instrument Sans as default
      colorScheme: const ColorScheme(
        primary: AppColors.primary,
        primaryContainer: AppColors.primaryDark,
        secondary: AppColors.secondary,
        secondaryContainer:
            AppColors.secondary, // Using secondary for container as well
        surface: AppColors.black,
        error: AppColors.error,
        onPrimary: AppColors.white90,
        onSecondary: AppColors.white90,
        onSurface: AppColors.white90,
        onError: AppColors.white90,
        brightness:
            Brightness.dark, // Assuming a dark theme based on background
      ),
      textTheme: TextTheme(
        // Headings
        displayLarge: AppTextStyles.h1.copyWith(color: AppColors.white90),
        displayMedium: AppTextStyles.h2.copyWith(color: AppColors.white90),
        displaySmall: AppTextStyles.h3.copyWith(color: AppColors.white90),
        headlineMedium: AppTextStyles.h4.copyWith(color: AppColors.white90),
        headlineSmall: AppTextStyles.h5.copyWith(color: AppColors.white90),
        titleLarge: AppTextStyles.h6.copyWith(color: AppColors.white90),
        // Body Text
        bodyLarge: AppTextStyles.bodyXLarge.copyWith(color: AppColors.white90),
        bodyMedium: AppTextStyles.bodyLarge.copyWith(color: AppColors.white90),
        bodySmall: AppTextStyles.bodyNormal.copyWith(color: AppColors.white90),
        labelLarge: AppTextStyles.bodySmall.copyWith(color: AppColors.white90),
        labelSmall: AppTextStyles.bodyXSmall.copyWith(color: AppColors.white90),
      ),
      // Add other theme properties as needed
      // For example, AppBarTheme, ButtonTheme, etc.
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.black,
        foregroundColor: AppColors.white90,
        elevation: 0,
      ),
      cardTheme: const CardThemeData(
        color: AppColors.black,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
      ),
      // You can add custom extensions for gradients if needed,
      // but for now, we'll use them directly where needed.
    );
  }
}
