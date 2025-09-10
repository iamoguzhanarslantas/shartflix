import 'package:flutter/material.dart';
import 'package:shartflix/core/constants/app_colors.dart';
import 'package:shartflix/core/constants/app_text_styles.dart';
import 'package:shartflix/presentation/widgets/auth/social_login_buttons.dart';
import 'package:sizer/sizer.dart';

import 'package:shartflix/core/utils/responsive_helper.dart'; // Import the new helper

class AuthFooter extends StatelessWidget {
  final String promptText;
  final String actionText;
  final VoidCallback onActionPressed;

  const AuthFooter({
    super.key,
    required this.promptText,
    required this.actionText,
    required this.onActionPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: context.isSmallScreenHeight ? 1.5.h : 3.h,
        ), // Adjust height for ~32px on large screens
        const SocialLoginButtonsRow(),
        SizedBox(
          height: context.isSmallScreenHeight ? 1.h : 2.h,
        ), // Adjust height for ~24px on large screens
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              promptText,
              style: AppTextStyles.bodyNormalRegular.copyWith(
                color: AppColors.white80,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(width: 2.w), // Responsive gap using Sizer
            GestureDetector(
              onTap: onActionPressed,
              child: Text(
                actionText,
                style: AppTextStyles.bodyNormalSemiBold.copyWith(
                  color: AppColors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
