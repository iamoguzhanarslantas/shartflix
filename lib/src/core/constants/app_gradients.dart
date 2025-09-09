import 'package:flutter/material.dart';
import 'package:shartflix/src/core/constants/app_colors.dart';

class AppGradients {
  // Background Gradient: #3F0306 to #090909
  static const LinearGradient backgroundGradient = LinearGradient(
    colors: [Color(0xFF3F0306), Color(0xFF090909)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  // Popular Card Gradient: Red-Purple tones
  static const LinearGradient popularCardGradient = LinearGradient(
    colors: [
      AppColors.primary, // Example red tone
      AppColors.secondary, // Example purple tone
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // Normal Card Gradient: Red tones
  static const LinearGradient normalCardGradient = LinearGradient(
    colors: [AppColors.primary, AppColors.primaryDark],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // Active Navigation Gradient: Red tones
  static const LinearGradient activeNavigationGradient = LinearGradient(
    colors: [AppColors.primary, AppColors.primaryDark],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );
}
