import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shartflix/presentation/widgets/auth/custom_text_input.dart';
import 'package:shartflix/presentation/widgets/auth/auth_form.dart';
import 'package:shartflix/presentation/widgets/auth/terms_and_conditions_checkbox.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthForm(
      formFields: [
        const CustomTextInput(
          labelText: 'Ad Soyad',
          iconPath: 'assets/icon/User.svg',
        ),
        SizedBox(height: 10.h),
        const CustomTextInput(
          labelText: 'Email',
          iconPath: 'assets/icon/Mail.svg',
        ),
        SizedBox(height: 10.h),
        const CustomTextInput(
          labelText: 'Şifre',
          iconPath: 'assets/icon/Lock.svg',
          isPassword: true,
        ),
        SizedBox(height: 10.h),
        const CustomTextInput(
          labelText: 'Şifre Tekrar',
          iconPath: 'assets/icon/Lock.svg',
          isPassword: true,
        ),
        SizedBox(height: 12.h),
        const TermsAndConditionsCheckbox(),
      ],
      buttonText: 'Kaydol',
      onButtonPressed: () {
        // Handle registration logic
      },
    );
  }
}
