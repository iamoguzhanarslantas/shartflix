import 'package:flutter/material.dart';
import 'package:shartflix/presentation/widgets/custom_text_input.dart';
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
          iconPath: 'assets/icon/user.png', // Assuming a user icon
        ),
        const SizedBox(height: 10),
        const CustomTextInput(
          labelText: 'Email',
          iconPath: 'assets/icon/mail.png',
        ),
        const SizedBox(height: 10),
        const CustomTextInput(
          labelText: 'Şifre',
          iconPath: 'assets/icon/lock.png',
          isPassword: true,
        ),
        const SizedBox(height: 10),
        const CustomTextInput(
          labelText: 'Şifre Tekrar',
          iconPath: 'assets/icon/lock.png',
          isPassword: true,
        ),
        const SizedBox(height: 10), // Gap between password repeat and checkbox
        const TermsAndConditionsCheckbox(),
      ],
      buttonText: 'Kaydol',
      onButtonPressed: () {
        // Handle registration logic
      },
    );
  }
}
