import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shartflix/core/constants/app_colors.dart';
import 'package:shartflix/core/constants/app_text_styles.dart';
import 'package:shartflix/presentation/widgets/auth/custom_text_input.dart';
import 'package:shartflix/presentation/widgets/auth/auth_form.dart';
import 'package:shartflix/presentation/widgets/auth/auth_form_validator.dart';

class LoginForm extends StatefulWidget {
  final ValueNotifier<bool> hasErrorNotifier;

  const LoginForm({super.key, required this.hasErrorNotifier});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  @override
  Widget build(BuildContext context) {
    return AuthFormValidator(
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
        // Update the hasErrorNotifier based on the presence of error texts
        final bool currentHasError =
            emailErrorText != null || passwordErrorText != null;
        if (widget.hasErrorNotifier.value != currentHasError) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            widget.hasErrorNotifier.value = currentHasError;
          });
        }

        return Form(
          key: formKey,
          child: AuthForm(
            formFields: [
              CustomTextInput(
                labelText: 'Email',
                iconPath: 'assets/icon/Mail.svg',
                controller: emailController,
                errorText: emailErrorText,
              ),
              SizedBox(height: 10.h),
              CustomTextInput(
                labelText: 'Password',
                iconPath: 'assets/icon/Lock.svg',
                isPassword: true,
                controller: passwordController,
                errorText: passwordErrorText,
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
            onButtonPressed: onSubmit,
          ),
        );
      },
    );
  }
}
