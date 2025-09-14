import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shartflix/core/constants/app_colors.dart';
import 'package:shartflix/core/constants/app_text_styles.dart';
import 'package:shartflix/presentation/cubits/auth/auth_bloc.dart'; // Use AuthBloc
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
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthError) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
          widget.hasErrorNotifier.value = true;
        } else if (state is AuthAuthenticated) {
          widget.hasErrorNotifier.value = false;
          sl<LocalStorageService>().getIsNewUser().then((isNewUser) {
            if (isNewUser == true && context.mounted) {
              GoRouter.of(context).go(
                ProfilePhotoUploadPage.routeName,
              );
            } else if (context.mounted) {
              GoRouter.of(
                context,
              ).go(HomePage.routeName);
            }
          });
        } else if (state is AuthLoading) {
          widget.hasErrorNotifier.value = false;
        }
      },
      builder: (context, state) {
        return AuthFormValidator(
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
                termsErrorText,
                validateName,
                validateEmail,
                validatePassword,
                validateConfirmPassword,
                onSubmit,
                isLoading,
              ) {
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
                        validator: validateEmail,
                      ),
                      SizedBox(height: 10.h),
                      CustomTextInput(
                        labelText: 'Password',
                        iconPath: AppIcons.lock,
                        isPassword: true,
                        controller: passwordController,
                        errorText: passwordErrorText,
                        validator: validatePassword,
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
                    buttonText: isLoading
                        ? 'Giriş Yapılıyor...'
                        : 'Giriş Yap',
                    onButtonPressed: onSubmit,
                    isButtonLoading: isLoading,
                  ),
                );
              },
        );
      },
    );
  }
}
