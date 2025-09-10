import 'package:flutter/material.dart';
import 'package:shartflix/core/constants/app_colors.dart';
import 'package:shartflix/core/constants/app_text_styles.dart';
import 'package:shartflix/presentation/widgets/social_login_buttons.dart';

class LoginFooter extends StatelessWidget {
  const LoginFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 15), // Gap between Login button and social icons
        const SocialLoginButtonsRow(),
        const SizedBox(height: 8), // Gap between social icons and new text
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Bir hesabın yok mu?',
              style: AppTextStyles.bodyNormal.copyWith(
                color: AppColors.white80,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(width: 8), // Gap between texts
            Text(
              'Kayıt ol',
              style: AppTextStyles.bodyNormalSemiBold.copyWith(
                color: AppColors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ],
    );
  }
}
