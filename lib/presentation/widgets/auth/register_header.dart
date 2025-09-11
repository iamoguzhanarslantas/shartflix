import 'package:flutter/material.dart';
import 'package:shartflix/presentation/widgets/auth/auth_header.dart';

class RegisterHeader extends StatelessWidget {
  final ValueNotifier<bool> hasErrorNotifier;

  const RegisterHeader({super.key, required this.hasErrorNotifier});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: hasErrorNotifier,
      builder: (context, hasError, child) {
        return AuthHeader(
          title: 'Hesap Oluştur',
          subtitle: 'Kullanıcı bilgilerini girerek kaydol',
          hasError: hasError,
        );
      },
    );
  }
}
