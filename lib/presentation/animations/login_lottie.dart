import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';
import 'package:shartflix/core/utils/responsive_helper.dart'; // Import the new helper

class LoginLottie extends StatefulWidget {
  const LoginLottie({super.key});

  @override
  State<LoginLottie> createState() => _LoginLottieState();
}

class _LoginLottieState extends State<LoginLottie>
    with TickerProviderStateMixin {
  late final AnimationController _lottieController;

  @override
  void initState() {
    super.initState();
    _lottieController = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _lottieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.isSmallScreenHeight
          ? 100.w
          : 105.w, // Responsive width for small screens, 105.w for large
      height: context.isSmallScreenHeight
          ? 20.h
          : 25.h, // Responsive height for small screens, 25.h for large (equivalent to 186px on 800px height screen)
      child: Lottie.asset(
        'assets/lottie/artboard.json',
        controller: _lottieController,
        onLoaded: (composition) {
          _lottieController
            ..duration = composition.duration
            ..repeat(); // Loop the animation
        },
      ),
    );
  }
}
