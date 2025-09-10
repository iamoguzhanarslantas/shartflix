import 'package:flutter/material.dart';
import 'dart:ui';

import 'package:shartflix/core/constants/app_gradients.dart';

class GlowingRadialGradient extends StatelessWidget {
  final double width;
  final double height;
  final double blurSigma;

  const GlowingRadialGradient({
    super.key,
    this.width = 310,
    this.height = 208,
    this.blurSigma = 50.6,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scaleX: 0.8, // yatayda uzatma
      scaleY: 0.5, // dikey sabit
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(gradient: AppGradients.loginRadialGradient),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: blurSigma, sigmaY: blurSigma),
          child: Container(color: Colors.transparent),
        ),
      ),
    );
  }
}
