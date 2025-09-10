import 'package:flutter/material.dart';
import 'package:shartflix/core/constants/app_colors.dart';

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
        width: 60, // Updated width
        height: 60, // Updated height
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
            width:
                60 * 0.6, // Adjust icon size to fit within the 60x60 container
            height:
                60 * 0.6, // Adjust icon size to fit within the 60x60 container
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
        const SizedBox(width: 8),
        SocialLoginButton(
          iconPath: 'assets/icon/apple.png',
          onPressed: () {
            // Handle Apple login
          },
        ),
        const SizedBox(width: 8),
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
