import 'package:flutter/material.dart';
import 'package:shartflix/core/constants/app_colors.dart';
import 'package:shartflix/core/constants/app_text_styles.dart';
import 'package:shartflix/presentation/widgets/social_login_buttons.dart';

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
        const SizedBox(height: 15), // Gap between Login button and social icons
        const SocialLoginButtonsRow(),
        const SizedBox(height: 8), // Gap between social icons and text
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              promptText,
              style: AppTextStyles.bodyNormal.copyWith(
                color: AppColors.white80,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(width: 8), // Gap between texts
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
