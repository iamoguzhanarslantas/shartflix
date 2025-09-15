import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shartflix/core/constants/app_colors.dart';
import 'package:shartflix/core/constants/app_text_styles.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: AppColors.black,
      fontFamily: AppTextStyles.h1.fontFamily, 
      colorScheme: const ColorScheme(
        primary: AppColors.primary,
        primaryContainer: AppColors.primaryDark,
        secondary: AppColors.secondary,
        secondaryContainer:
            AppColors.secondary, 
        surface: AppColors.black,
        error: AppColors.error,
        onPrimary: AppColors.white90,
        onSecondary: AppColors.white90,
        onSurface: AppColors.white90,
        onError: AppColors.white90,
        brightness:
            Brightness.dark, 
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
        bodyLarge: AppTextStyles.bodyXLargeRegular.copyWith(
          color: AppColors.white90,
        ),
        bodyMedium: AppTextStyles.bodyLargeRegular.copyWith(
          color: AppColors.white90,
        ),
        bodySmall: AppTextStyles.bodyNormalRegular.copyWith(
          color: AppColors.white90,
        ),
        labelLarge: AppTextStyles.bodySmallRegular.copyWith(
          color: AppColors.white90,
        ),
        labelSmall: AppTextStyles.bodyXSmallRegular.copyWith(
          color: AppColors.white90,
        ),
      ),
     
     
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.black,
        foregroundColor: AppColors.white90,
        elevation: 0,
      ),
      cardTheme: CardThemeData(
        color: AppColors.black,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.r)),
        ),
      ),
    );
  }
}
