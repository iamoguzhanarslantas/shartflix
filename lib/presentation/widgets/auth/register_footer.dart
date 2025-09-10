import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shartflix/presentation/pages/auth/login_page.dart';
import 'package:shartflix/presentation/widgets/auth/auth_footer.dart';

class RegisterFooter extends StatelessWidget {
  const RegisterFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthFooter(
      promptText: 'Hesabın var mı?',
      actionText: 'Giriş yap',
      onActionPressed: () {
        context.go(LoginPage.routeName);
      },
    );
  }
}
