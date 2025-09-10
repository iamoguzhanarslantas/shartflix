import 'package:flutter/material.dart';
import 'package:shartflix/core/constants/app_colors.dart';
import 'package:shartflix/core/constants/app_text_styles.dart';
import 'package:shartflix/presentation/animations/login_lottie.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.2, // Responsive height
          child: LoginLottie(),
        ),
        Image.asset('assets/icon/app_logo.png', width: 78, height: 78),
        const SizedBox(height: 10), // Gap between logo and text
        Text(
          'Giriş Yap',
          style: AppTextStyles.h4.copyWith(color: AppColors.white),
        ),
        const SizedBox(height: 5), // Small gap between texts
        Text(
          'Kullanıcı bilgilerinle giriş yap',
          style: AppTextStyles.bodyNormalRegular.copyWith(
            color: AppColors.white,
          ),
        ),
      ],
    );
  }
}
