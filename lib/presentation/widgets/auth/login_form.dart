import 'package:flutter/material.dart';
import 'package:shartflix/core/constants/app_colors.dart';
import 'package:shartflix/core/constants/app_text_styles.dart';
import 'package:shartflix/presentation/widgets/custom_text_input.dart';
import 'package:shartflix/presentation/widgets/auth/auth_form.dart';

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
        const SizedBox(height: 10),
        const CustomTextInput(
          labelText: 'Password',
          iconPath: 'assets/icon/lock.png',
          isPassword: true,
        ),
        const SizedBox(
          height: 10,
        ), // Gap between password field and "Forgot Password"
        Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
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
