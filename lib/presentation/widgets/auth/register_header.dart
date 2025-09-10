import 'package:flutter/material.dart';
import 'package:shartflix/presentation/widgets/auth/auth_header.dart';

class RegisterHeader extends StatelessWidget {
  const RegisterHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const AuthHeader(
      title: 'Hesap Oluştur',
      subtitle: 'Kullanıcı bilgilerini girerek kaydol',
    );
  }
}
