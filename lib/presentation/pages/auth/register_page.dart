import 'package:flutter/material.dart';
import 'package:shartflix/presentation/widgets/app_layout.dart';
import 'package:shartflix/presentation/widgets/auth/register_header.dart';
import 'package:shartflix/presentation/widgets/auth/register_form.dart';
import 'package:shartflix/presentation/widgets/auth/register_footer.dart';

class RegisterPage extends StatelessWidget {
  static const String routeName = '/register';
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: AppLayout(
        child: SingleChildScrollView(
          physics: MediaQuery.of(context).viewInsets.bottom == 0
              ? NeverScrollableScrollPhysics() // Klavye kapalı → scroll yok
              : BouncingScrollPhysics(), // Klavye açık → scroll var
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                SizedBox(height: 24),
                RegisterHeader(),
                SizedBox(height: 24),
                RegisterForm(),
                RegisterFooter(),
                SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
