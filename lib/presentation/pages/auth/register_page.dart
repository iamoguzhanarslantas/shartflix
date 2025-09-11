import 'package:flutter/material.dart';
import 'package:shartflix/presentation/widgets/auth/auth_screen_wrapper.dart';
import 'package:shartflix/presentation/widgets/auth/register_header.dart';
import 'package:shartflix/presentation/widgets/auth/register_form.dart';
import 'package:shartflix/presentation/widgets/auth/register_footer.dart';

class RegisterPage extends StatelessWidget {
  static const String routeName = '/register';
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthScreenWrapper(
      builder: (context, hasErrorNotifier) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            RegisterHeader(hasErrorNotifier: hasErrorNotifier),
            RegisterForm(hasErrorNotifier: hasErrorNotifier),
            RegisterFooter()
          ],
        );
      },
    );
  }
}
