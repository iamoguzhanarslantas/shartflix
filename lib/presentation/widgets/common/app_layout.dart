import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shartflix/presentation/widgets/common/app_background.dart';
import 'package:shartflix/presentation/widgets/common/glowing_radial_gradient.dart';

class AppLayout extends StatelessWidget {
  final Widget? child;

  const AppLayout({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const AppBackground(),
        Positioned(top: -71.h, left: 43.w, child: const GlowingRadialGradient()),
        if (child != null) Positioned.fill(child: child!),
      ],
    );
  }
}
