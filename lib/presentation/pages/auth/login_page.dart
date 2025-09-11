import 'package:flutter/material.dart';
import 'package:shartflix/presentation/widgets/common/app_layout.dart';
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
      extendBodyBehindAppBar: true,
      body: AppLayout(
        child: SingleChildScrollView(
          physics: MediaQuery.of(context).viewInsets.bottom == 0
              ? const NeverScrollableScrollPhysics() // Klavye kapalı → scroll yok
              : const BouncingScrollPhysics(),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [LoginHeader(), LoginForm(), LoginFooter()],
            ),
          ),
        ),
      ),
    );
  }
}
