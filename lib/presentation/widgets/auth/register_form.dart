import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shartflix/core/constants/app_icons.dart';
import 'package:shartflix/presentation/widgets/auth/custom_text_input.dart';
import 'package:shartflix/presentation/widgets/auth/auth_form.dart';
import 'package:shartflix/presentation/widgets/auth/terms_and_conditions_checkbox.dart';
import 'package:shartflix/presentation/widgets/auth/auth_form_validator.dart';

class RegisterForm extends StatefulWidget {
  final ValueNotifier<bool> hasErrorNotifier;
  final GlobalKey<AuthFormValidatorState>? formValidatorKey;

  const RegisterForm({
    super.key,
    required this.hasErrorNotifier,
    this.formValidatorKey,
  });

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  bool _termsAccepted = false; // State for the checkbox

  @override
  Widget build(BuildContext context) {
    return AuthFormValidator(
      key: widget.formValidatorKey, // Pass the key here
      isRegisterForm: true,
      termsAccepted: _termsAccepted, // Pass checkbox state
      builder:
          (
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
            termsErrorText, // New parameter for terms error
            validateName,
            validateEmail,
            validatePassword,
            validateConfirmPassword,
            onSubmit,
            isLoading,
          ) {
            // Update the hasErrorNotifier based on the presence of error texts
            final bool currentHasError =
                nameErrorText != null ||
                emailErrorText != null ||
                passwordErrorText != null ||
                confirmPasswordErrorText != null ||
                termsErrorText != null; // Include terms error
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
                labelText: 'Ad Soyad',
                iconPath: AppIcons.user,
                controller: nameController,
                errorText: nameErrorText,
              ),
              SizedBox(height: 10.h),
              CustomTextInput(
                labelText: 'Email',
                iconPath: AppIcons.mail,
                controller: emailController,
                errorText: emailErrorText,
              ),
              SizedBox(height: 10.h),
              CustomTextInput(
                labelText: 'Şifre',
                iconPath: AppIcons.lock,
                isPassword: true,
                controller: passwordController,
                errorText: passwordErrorText,
              ),
              SizedBox(height: 10.h),
              CustomTextInput(
                labelText: 'Şifre Tekrar',
                iconPath: AppIcons.lock,
                isPassword: true,
                controller: confirmPasswordController,
                errorText: confirmPasswordErrorText,
              ),
                  SizedBox(height: 12.h),
                  TermsAndConditionsCheckbox(
                    value: _termsAccepted,
                    onChanged: (newValue) {
                      setState(() {
                        _termsAccepted = newValue;
                      });
                    },
                    errorText: termsErrorText,
                  ),
                ],
                buttonText: 'Kaydol',
                onButtonPressed: onSubmit,
                isButtonLoading: isLoading,
              ),
            );
          },
    );
  }
}
