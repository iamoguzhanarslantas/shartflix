import 'package:flutter/material.dart';

import 'package:shartflix/presentation/animations/login_lottie.dart';
import 'package:shartflix/presentation/widgets/auth/auth_header.dart';

class LoginHeader extends StatelessWidget {
  final ValueNotifier<bool> hasErrorNotifier;

  const LoginHeader({super.key, required this.hasErrorNotifier});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: hasErrorNotifier,
      builder: (context, hasError, child) {
        return AuthHeader(
          title: 'Giriş Yap',
          subtitle: 'Kullanıcı bilgilerinle giriş yap',
          topWidget: const LoginLottie(),
          hasError: hasError,
        );
      },
    );
  }
}
