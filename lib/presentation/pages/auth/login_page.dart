import 'package:flutter/material.dart';
import 'package:shartflix/presentation/widgets/auth/auth_screen_wrapper.dart';
import 'package:shartflix/presentation/widgets/auth/login_header.dart';
import 'package:shartflix/presentation/widgets/auth/login_form.dart';
import 'package:shartflix/presentation/widgets/auth/login_footer.dart';

class LoginPage extends StatelessWidget {
  static const String routeName = '/login';
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthScreenWrapper(
      builder: (context, hasErrorNotifier) {
        return Column(
          children: [
            LoginHeader(hasErrorNotifier: hasErrorNotifier),
            LoginForm(hasErrorNotifier: hasErrorNotifier),
            LoginFooter(),
          ],
        );
      },
    );
  }
}
