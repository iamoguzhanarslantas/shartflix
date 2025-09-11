import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shartflix/core/constants/app_colors.dart';
import 'package:shartflix/core/constants/app_text_styles.dart';
import 'package:shartflix/presentation/widgets/auth/custom_text_input.dart';
import 'package:shartflix/presentation/widgets/auth/auth_form.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthForm(
      formFields: [
        const CustomTextInput(
          labelText: 'Email',
          iconPath: 'assets/icon/Mail.svg',
        ),
        SizedBox(height: 10.h),
        const CustomTextInput(
          labelText: 'Password',
          iconPath: 'assets/icon/Lock.svg',
          isPassword: true,
        ),
        SizedBox(height: 10.h),
        Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
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
