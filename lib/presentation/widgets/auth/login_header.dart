import 'package:flutter/material.dart';
import 'package:shartflix/core/constants/app_colors.dart';
import 'package:shartflix/core/constants/app_text_styles.dart';
import 'package:shartflix/presentation/animations/login_lottie.dart';
import 'package:sizer/sizer.dart';
import 'package:shartflix/core/utils/responsive_helper.dart'; // Import the new helper

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: context.isSmallScreenHeight ? 22.h : 22.h,
          child: const LoginLottie(),
        ),
        Image.asset(
          'assets/icon/app_logo.png',
          width: context.isSmallScreenHeight ? 18.w : 20.w,
          height: context.isSmallScreenHeight ? 18.w : 20.w,
        ),
        SizedBox(height: context.isSmallScreenHeight ? 1.h : 1.5.h),
        Text(
          'Giriş Yap',
          style: AppTextStyles.h4.copyWith(color: AppColors.white),
        ),
        SizedBox(height: context.isSmallScreenHeight ? 0.5.h : 1.h),
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
