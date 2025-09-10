import 'package:flutter/material.dart';
import 'package:shartflix/core/constants/app_gradients.dart';

class AppBackground extends StatelessWidget {
  const AppBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: AppGradients.backgroundGradient,
      ),
    );
  }
}
