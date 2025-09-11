import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shartflix/presentation/widgets/auth/custom_text_input.dart';
import 'package:shartflix/presentation/widgets/auth/auth_form.dart';
import 'package:shartflix/presentation/widgets/auth/terms_and_conditions_checkbox.dart';
import 'package:shartflix/presentation/widgets/auth/auth_form_validator.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthFormValidator(
      isRegisterForm: true,
      builder: (
        context,
        formKey,
        nameController,
        emailController,
        passwordController,
        confirmPasswordController,
        nameErrorText,
        emailErrorText,
        passwordErrorText,
        confirmPasswordErrorText,
        validateName,
        validateEmail,
        validatePassword,
        validateConfirmPassword,
        onSubmit,
      ) {
        return Form(
          key: formKey,
          child: AuthForm(
            formFields: [
              CustomTextInput(
                labelText: 'Ad Soyad',
                iconPath: 'assets/icon/User.svg',
                controller: nameController,
                errorText: nameErrorText,
              ),
              SizedBox(height: 10.h),
              CustomTextInput(
                labelText: 'Email',
                iconPath: 'assets/icon/Mail.svg',
                controller: emailController,
                errorText: emailErrorText,
              ),
              SizedBox(height: 10.h),
              CustomTextInput(
                labelText: 'Şifre',
                iconPath: 'assets/icon/Lock.svg',
                isPassword: true,
                controller: passwordController,
                errorText: passwordErrorText,
              ),
              SizedBox(height: 10.h),
              CustomTextInput(
                labelText: 'Şifre Tekrar',
                iconPath: 'assets/icon/Lock.svg',
                isPassword: true,
                controller: confirmPasswordController,
                errorText: confirmPasswordErrorText,
              ),
              SizedBox(height: 12.h),
              const TermsAndConditionsCheckbox(),
            ],
            buttonText: 'Kaydol',
            onButtonPressed: onSubmit,
          ),
        );
      },
    );
  }
}
