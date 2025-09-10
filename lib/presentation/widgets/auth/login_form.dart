import 'package:flutter/material.dart';
import 'package:shartflix/core/constants/app_colors.dart';
import 'package:shartflix/core/constants/app_text_styles.dart';
import 'package:shartflix/presentation/widgets/custom_text_input.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
        const SizedBox(height: 16),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.06), // Responsive horizontal padding
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.88, // Responsive width
            height: 56, // Fixed height
            child: ElevatedButton(
              onPressed: () {
                // Handle login logic
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary, // Primary color
                padding: const EdgeInsets.fromLTRB(
                  32,
                  8,
                  32,
                  8,
                ), // Specified padding
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    16,
                  ), // Specified border radius
                ),
              ),
              child: Text(
                'Giriş Yap',
                style: AppTextStyles.bodyXLargeSemiBold.copyWith(
                  color: AppColors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
