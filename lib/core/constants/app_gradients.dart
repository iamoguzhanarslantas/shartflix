import 'package:flutter/material.dart';
import 'package:shartflix/core/constants/app_colors.dart';

class AppGradients {
  AppGradients._();

  // Background Gradient: #3F0306 to #090909
  static const LinearGradient backgroundGradient = LinearGradient(
    colors: [AppColors.backgroundStart, AppColors.backgroundEnd],
    begin: Alignment.topCenter,
    end: Alignment.center,
  );

  // Popular Card Gradient: Red-Purple tones
  static const LinearGradient popularCardGradient = LinearGradient(
    colors: [AppColors.primary, AppColors.secondary],
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

  // Login Radial Gradient
  static const RadialGradient loginRadialGradient = RadialGradient(
    center: Alignment.center,
    colors: [AppColors.radialStart, AppColors.radialEnd],
    stops: [0.0, 1.0],
    radius: 0.8,
    focal: Alignment.center,
  );

  // Icon Linear Gradient: White to PinkLight
  static const LinearGradient iconLinearGradient = LinearGradient(
    colors: [AppColors.white, AppColors.pinkLight],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  // Button Radial Gradient
  static final RadialGradient buttonRadialGradient = RadialGradient(
    center: Alignment.center,
    focal: Alignment(
      0.0,
      -0.66,
    ),
    colors: [AppColors.primary, AppColors.buttonActive],
    stops: [0.0, 1.0],
    radius:
        0.84,
  );

  // Navigation Bar Background Gradient
  static const LinearGradient navBarBackgroundGradient = LinearGradient(
    colors: [Colors.transparent, AppColors.backgroundEnd],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    stops: [0.0, 0.29],
  );

  // Limited Offer Button Background Gradient
  static const LinearGradient limitedOfferButtonGradient = LinearGradient(
    colors: [AppColors.primary, AppColors.buttonLimited],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
