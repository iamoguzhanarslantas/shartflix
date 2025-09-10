import 'package:flutter/material.dart';
import 'package:shartflix/presentation/widgets/app_background.dart';
import 'package:shartflix/presentation/widgets/glowing_radial_gradient.dart';

class AppLayout extends StatelessWidget {
  final Widget? child;

  const AppLayout({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const AppBackground(),
        const Positioned(
          top: -71,
          left: 43,
          right: 43,
          child: GlowingRadialGradient(),
        ),
        if (child != null) Positioned.fill(child: child!),
      ],
    );
  }
}
