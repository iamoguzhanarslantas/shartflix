import 'package:flutter/material.dart';
import 'package:shartflix/presentation/widgets/app_layout.dart';
import 'package:shartflix/presentation/widgets/auth/login_header.dart';
import 'package:shartflix/presentation/widgets/auth/login_form.dart';
import 'package:shartflix/presentation/widgets/auth/login_footer.dart';

class LoginPage extends StatelessWidget {
  static const String routeName = '/login';
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: AppLayout(
        child: SingleChildScrollView(
          physics: MediaQuery.of(context).viewInsets.bottom == 0
              ? NeverScrollableScrollPhysics() // Klavye kapalı → scroll yok
              : BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LoginHeader(),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03), // Responsive height
              LoginForm(),
              LoginFooter(),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03), // Responsive height
            ],
          ),
        ),
      ),
    );
  }
}
