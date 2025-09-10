import 'package:flutter/material.dart';
import 'package:shartflix/core/constants/app_colors.dart';
import 'package:shartflix/core/constants/app_text_styles.dart';
import 'package:shartflix/presentation/widgets/custom_text_input.dart';
import 'package:shartflix/presentation/widgets/auth/auth_form.dart';
import 'package:sizer/sizer.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthForm(
      formFields: [
        const CustomTextInput(
          labelText: 'Email',
          iconPath: 'assets/icon/mail.png',
        ),
        SizedBox(height: 1.h), // Responsive height using Sizer
        const CustomTextInput(
          labelText: 'Password',
          iconPath: 'assets/icon/lock.png',
          isPassword: true,
        ),
        SizedBox(
          height: 1.h,
        ), // Responsive height using Sizer
        Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 6.w), // Responsive horizontal padding
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
