import 'package:flutter/material.dart';
import 'package:shartflix/presentation/widgets/common/app_layout.dart';
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
      extendBodyBehindAppBar: true,
      body: AppLayout(
        child: SingleChildScrollView(
          physics: MediaQuery.of(context).viewInsets.bottom == 0
              ? const NeverScrollableScrollPhysics() // Klavye kapalı → scroll yok
              : const BouncingScrollPhysics(), // Klavye açık → scroll var
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [RegisterHeader(), RegisterForm(), RegisterFooter()],
            ),
          ),
        ),
      ),
    );
  }
}
