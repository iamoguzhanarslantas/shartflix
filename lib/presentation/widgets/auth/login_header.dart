import 'package:flutter/material.dart';

import 'package:shartflix/presentation/animations/login_lottie.dart';
import 'package:shartflix/presentation/widgets/auth/auth_header.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const AuthHeader(
      title: 'Giriş Yap',
      subtitle: 'Kullanıcı bilgilerinle giriş yap',
      topWidget: LoginLottie(),
    );
  }
}
