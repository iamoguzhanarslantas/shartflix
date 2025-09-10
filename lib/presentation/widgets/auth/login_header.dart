import 'package:flutter/material.dart';
import 'package:shartflix/core/constants/app_colors.dart';
import 'package:shartflix/core/constants/app_text_styles.dart';
import 'package:shartflix/presentation/animations/login_lottie.dart';
import 'package:sizer/sizer.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20.h, // Responsive height
          child: LoginLottie(),
        ),
        Image.asset('assets/icon/app_logo.png', width: 20.w, height: 20.w), // Responsive width and height
        SizedBox(height: 1.h), // Responsive gap
        Text(
          'Giriş Yap',
          style: AppTextStyles.h4.copyWith(color: AppColors.white),
        ),
        SizedBox(height: 0.5.h), // Responsive gap
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
