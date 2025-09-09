import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shartflix/src/core/constants/app_colors.dart';
import 'package:shartflix/src/core/theme/app_text_styles.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
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
    return Scaffold(
      backgroundColor: AppColors.black, // Use the defined black color
      appBar: AppBar(
        title: Text(
          'Shartflix',
          style: AppTextStyles.h4.copyWith(color: AppColors.white90),
        ),
        backgroundColor: AppColors.black,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              'assets/lottie/artboard.json',
              controller: _lottieController,
              onLoaded: (composition) {
                _lottieController
                  ..duration = composition.duration
                  ..forward();
              },
            ),
            const SizedBox(height: 20),
            Text(
              'Hello World',
              style: AppTextStyles.h2.copyWith(color: AppColors.white90),
            ),
          ],
        ),
      ),
    );
  }
}
