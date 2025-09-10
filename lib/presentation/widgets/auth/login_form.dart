import 'package:flutter/material.dart';
import 'package:shartflix/core/constants/app_colors.dart';
import 'package:shartflix/core/constants/app_text_styles.dart';
import 'package:shartflix/presentation/widgets/auth/custom_text_input.dart';
import 'package:shartflix/presentation/widgets/auth/auth_form.dart';
import 'package:sizer/sizer.dart';
import 'package:shartflix/core/utils/responsive_helper.dart'; // Import the new helper

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthForm(
      formFields: [
        const CustomTextInput(
          labelText: 'Email',
          iconPath: 'assets/icon/Mail.svg', // Changed to .svg
        ),
        SizedBox(height: context.isSmallScreenHeight ? 1.h : 1.5.h),
        const CustomTextInput(
          labelText: 'Password',
          iconPath: 'assets/icon/Lock.svg', // Changed to .svg
          isPassword: true,
        ),
        SizedBox(
          height: context.isSmallScreenHeight ? 1.h : 1.5.h,
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 6.w),
            child: Text(
              'Şifremi unuttum',
              style: AppTextStyles.bodyNormalSemiBold.copyWith(
                color: AppColors.white,
              ),
            ),
          ),
        ),
      ],
      buttonText: 'Giriş Yap',
      onButtonPressed: () {
        // Handle login logic
      },
    );
  }
}
