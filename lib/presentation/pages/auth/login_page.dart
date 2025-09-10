import 'package:flutter/material.dart';
import 'package:shartflix/presentation/widgets/app_layout.dart';
import 'package:shartflix/presentation/widgets/auth/login_header.dart';
import 'package:shartflix/presentation/widgets/auth/login_form.dart';
import 'package:shartflix/presentation/widgets/auth/login_footer.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: AppLayout(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              LoginHeader(),
              LoginForm(),
              LoginFooter(),
            ],
          ),
        ),
      ),
    );
  }
}
