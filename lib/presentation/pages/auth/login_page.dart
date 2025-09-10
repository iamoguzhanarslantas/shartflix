import 'package:flutter/material.dart';
import 'package:shartflix/presentation/animations/login_lottie.dart';
import 'package:shartflix/presentation/widgets/app_layout.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppLayout(
        child: LoginLottie(),
      ),
    );
  }
}
