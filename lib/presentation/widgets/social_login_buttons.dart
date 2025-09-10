import 'package:flutter/material.dart';
import 'package:shartflix/core/constants/app_colors.dart';
import 'package:sizer/sizer.dart';

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
        width: 15.w, // Responsive width using Sizer
        height: 15.w, // Responsive height using Sizer
        decoration: BoxDecoration(
          color: AppColors.white05, // #FFFFFF0D is 5% opacity white
          borderRadius: BorderRadius.circular(
            16,
          ), // Assuming this is the border radius for the icon container
          border: Border.all(
            color: AppColors.white20,
            width: 1,
          ), // 0xFFFFFFFF33 is 20% opacity white
        ),
        child: Center(
          child: Image.asset(
            iconPath,
            width: 9.w, // Responsive icon size using Sizer
            height: 9.w, // Responsive icon size using Sizer
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
        SizedBox(width: 2.w), // Responsive gap using Sizer
        SocialLoginButton(
          iconPath: 'assets/icon/apple.png',
          onPressed: () {
            // Handle Apple login
          },
        ),
        SizedBox(width: 2.w), // Responsive gap using Sizer
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
