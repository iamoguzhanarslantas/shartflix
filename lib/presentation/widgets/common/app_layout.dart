import 'package:flutter/material.dart';
import 'package:shartflix/presentation/widgets/common/app_background.dart';
import 'package:shartflix/presentation/widgets/common/glowing_radial_gradient.dart';
import 'package:shartflix/core/utils/responsive_helper.dart'; // Import the new helper

class AppLayout extends StatelessWidget {
  final Widget? child;

  const AppLayout({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const AppBackground(),
        Positioned(
          top: context.isSmallScreenHeight ? -71 : -60, // Revert small screen top, slightly less on large
          left: context.isSmallScreenHeight ? 43 : 50, // Revert small screen left, slightly less on large
          right: context.isSmallScreenHeight ? 43 : 50, // Revert small screen right, slightly less on large
          child: const GlowingRadialGradient(),
        ),
        if (child != null) Positioned.fill(child: child!),
      ],
    );
  }
}
