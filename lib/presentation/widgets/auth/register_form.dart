import 'package:flutter/material.dart';
import 'package:shartflix/presentation/widgets/custom_text_input.dart';
import 'package:shartflix/presentation/widgets/auth/auth_form.dart';
import 'package:shartflix/presentation/widgets/auth/terms_and_conditions_checkbox.dart';
import 'package:sizer/sizer.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthForm(
      formFields: [
        const CustomTextInput(
          labelText: 'Ad Soyad',
          iconPath: 'assets/icon/user.png', // Assuming a user icon
        ),
        SizedBox(height: 1.h), // Responsive gap
        const CustomTextInput(
          labelText: 'Email',
          iconPath: 'assets/icon/mail.png',
        ),
        SizedBox(height: 1.h), // Responsive gap
        const CustomTextInput(
          labelText: 'Şifre',
          iconPath: 'assets/icon/lock.png',
          isPassword: true,
        ),
        SizedBox(height: 1.h), // Responsive gap
        const CustomTextInput(
          labelText: 'Şifre Tekrar',
          iconPath: 'assets/icon/lock.png',
          isPassword: true,
        ),
        SizedBox(height: 1.h), // Responsive gap
        const TermsAndConditionsCheckbox(),
      ],
      buttonText: 'Kaydol',
      onButtonPressed: () {
        // Handle registration logic
      },
    );
  }
}
