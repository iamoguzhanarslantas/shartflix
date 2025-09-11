import 'package:flutter/material.dart';
import 'dart:ui';

import 'package:flutter_screenutil/flutter_screenutil.dart';
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
      scaleX: 0.8.w, // yatayda uzatma
      scaleY: 0.8.h, // dikey sabit
      child: Container(
        width: width.w,
        height: height.h,
        decoration: BoxDecoration(gradient: AppGradients.loginRadialGradient),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: blurSigma.w, sigmaY: blurSigma.h),
          child: Container(color: Colors.transparent),
        ),
      ),
    );
  }
}
