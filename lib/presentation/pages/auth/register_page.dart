import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shartflix/presentation/cubits/auth/auth_cubit.dart';
import 'package:shartflix/presentation/pages/auth/profile_photo_upload_page.dart';
import 'package:shartflix/presentation/widgets/auth/auth_form_validator.dart';
import 'package:shartflix/presentation/widgets/auth/auth_screen_wrapper.dart';
import 'package:shartflix/presentation/widgets/auth/register_header.dart';
import 'package:shartflix/presentation/widgets/auth/register_form.dart';
import 'package:shartflix/presentation/widgets/auth/register_footer.dart';

class RegisterPage extends StatefulWidget {
  static const String routeName = '/register';
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final GlobalKey<AuthFormValidatorState> _formValidatorKey = GlobalKey<AuthFormValidatorState>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) async { // Marked as async
        if (state is AuthRegistrationSuccess) {
          _formValidatorKey.currentState?.clearControllers();
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Kayıt başarılı!')),
          );
          // After successful registration, always navigate to the profile photo upload page.
          // The 'isNewUser' flag will be handled by the ProfilePhotoUploadPage itself.
          context.go(ProfilePhotoUploadPage.routeName);
        } else if (state is AuthError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Kayıt başarısız: ${state.message}')),
          );
        }
      },
      child: AuthScreenWrapper(
        builder: (context, hasErrorNotifier) {
          return Column(
            children: [
              RegisterHeader(hasErrorNotifier: hasErrorNotifier),
              RegisterForm(
                formValidatorKey: _formValidatorKey, // Pass the key to RegisterForm
                hasErrorNotifier: hasErrorNotifier,
              ),
              RegisterFooter(),
            ],
          );
        },
      ),
    );
  }
}
