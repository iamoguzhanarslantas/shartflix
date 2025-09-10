import 'package:flutter/material.dart';
import 'package:shartflix/core/constants/app_colors.dart';
import 'package:shartflix/core/constants/app_text_styles.dart';
import 'package:shartflix/presentation/animations/login_lottie.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
            LoginLottie(),
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
