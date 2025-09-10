import 'package:flutter/material.dart';
import 'package:shartflix/core/constants/app_colors.dart';
import 'package:sizer/sizer.dart';
import 'package:shartflix/core/utils/responsive_helper.dart'; // Import the new helper

class SocialLoginButton extends StatelessWidget {
  final String iconPath;
  final VoidCallback onPressed;

  const SocialLoginButton({
    super.key,
    required this.iconPath,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: context.isSmallScreenHeight
            ? 16.w
            : 16.w, // Adjusted width for smaller icons
        height: context.isSmallScreenHeight
            ? 16.w
            : 16.w, // Adjusted height for smaller icons
        decoration: BoxDecoration(
          color: AppColors.white05, // #FFFFFF0D is 5% opacity white
          borderRadius: BorderRadius.circular(
            16,
          ), // Adjusted border radius for smaller icons
          border: Border.all(
            color: AppColors.white20,
            width: 1,
          ), // 0xFFFFFFFF33 is 20% opacity white
        ),
        child: Center(
          child: Image.asset(
            iconPath,
            width: 8.w, // Adjusted responsive icon size using Sizer
            height: 8.w, // Adjusted responsive icon size using Sizer
          ),
        ),
      ),
    );
  }
}

class SocialLoginButtonsRow extends StatelessWidget {
  const SocialLoginButtonsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SocialLoginButton(
          iconPath: 'assets/icon/google.png',
          onPressed: () {
            // Handle Google login
          },
        ),
        SizedBox(width: 8.0), // Fixed gap between buttons
        SocialLoginButton(
          iconPath: 'assets/icon/apple.png',
          onPressed: () {
            // Handle Apple login
          },
        ),
        SizedBox(width: 8.0), // Fixed gap between buttons
        SocialLoginButton(
          iconPath: 'assets/icon/facebook.png',
          onPressed: () {
            // Handle Facebook login
          },
        ),
      ],
    );
  }
}
