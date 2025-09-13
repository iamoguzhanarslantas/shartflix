import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shartflix/core/constants/app_colors.dart';
import 'package:flutter_svg/flutter_svg.dart'; // Import flutter_svg
import 'package:shartflix/core/constants/app_icons.dart';

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
        padding: EdgeInsets.all(8.r),
        width: 60.w,
        height: 60.h,
        decoration: BoxDecoration(
          color: AppColors.white05,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: AppColors.white20, width: 1.w),
        ),
        child: Center(child: SvgPicture.asset(iconPath, width: 24.w, height: 24.h)),
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
          iconPath: AppIcons.google, // Changed to .svg
          onPressed: () {
            // Handle Google login
          },
        ),
        SizedBox(width: 8.w), // Fixed gap between buttons
        SocialLoginButton(
          iconPath: AppIcons.apple, // Changed to .svg
          onPressed: () {
            // Handle Apple login
          },
        ),
        SizedBox(width: 8.w), // Fixed gap between buttons
        SocialLoginButton(
          iconPath: AppIcons.facebook, // Changed to .svg
          onPressed: () {
            // Handle Facebook login
          },
        ),
      ],
    );
  }
}
