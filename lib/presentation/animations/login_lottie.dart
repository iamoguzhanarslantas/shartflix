import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoginLottie extends StatefulWidget {
  const LoginLottie({super.key});

  @override
  State<LoginLottie> createState() => _LoginLottieState();
}

class _LoginLottieState extends State<LoginLottie> with TickerProviderStateMixin {
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
    return Lottie.asset(
      'assets/lottie/artboard.json',
      controller: _lottieController,
      onLoaded: (composition) {
        _lottieController
          ..duration = composition.duration
          ..repeat(); // Loop the animation
      },
    );
  }
}
