import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shartflix/core/constants/app_colors.dart';
import 'package:shartflix/core/constants/app_text_styles.dart';
import 'package:shartflix/presentation/cubits/auth/auth_cubit.dart';
import 'package:shartflix/presentation/pages/auth/profile_photo_upload_page.dart';
import 'package:shartflix/presentation/pages/home/home_page.dart';
import 'package:shartflix/core/constants/app_icons.dart';
import 'package:shartflix/presentation/widgets/auth/custom_text_input.dart';
import 'package:go_router/go_router.dart';
import 'package:shartflix/core/services/local_storage_service.dart';
import 'package:shartflix/di.dart';
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
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthError) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
          widget.hasErrorNotifier.value = true;
        } else if (state is AuthAuthenticated) {
          widget.hasErrorNotifier.value = false;
          // Check if it's a new user after registration
          sl<LocalStorageService>().getIsNewUser().then((isNewUser) {
            if (isNewUser && context.mounted) {
              GoRouter.of(context).go(
                ProfilePhotoUploadPage.routeName,
              ); // Redirect to photo upload page
            } else if (context.mounted) {
              GoRouter.of(
                context,
              ).go(HomePage.routeName); // Redirect to home page
            }
          });
        } else if (state is AuthLoading) {
          widget.hasErrorNotifier.value = false; // Clear previous errors
        }
      },
      builder: (context, state) {
        return AuthFormValidator(
          builder:
              (
                context,
                formKey,
                nameController, // Not used in login
                emailController,
                passwordController,
                confirmPasswordController, // Not used in login
                nameErrorText, // Not used in login
                emailErrorText,
                passwordErrorText,
                confirmPasswordErrorText, // Not used in login
                termsErrorText, // Not used in login
                validateName, // Not used in login
                validateEmail,
                validatePassword,
                validateConfirmPassword, // Not used in login
                onSubmit,
                isLoading,
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
                        iconPath: AppIcons.mail,
                        controller: emailController,
                        errorText: emailErrorText,
                        validator: validateEmail, // Pass the validator
                      ),
                      SizedBox(height: 10.h),
                      CustomTextInput(
                        labelText: 'Password',
                        iconPath: AppIcons.lock,
                        isPassword: true,
                        controller: passwordController,
                        errorText: passwordErrorText,
                        validator: validatePassword, // Pass the validator
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
                    buttonText: state is AuthLoading
                        ? 'Giriş Yapılıyor...'
                        : 'Giriş Yap',
                    onButtonPressed: onSubmit, // Use the onSubmit callback from AuthFormValidator
                    isButtonLoading: state is AuthLoading,
                  ),
                );
              },
        );
      },
    );
  }
}
