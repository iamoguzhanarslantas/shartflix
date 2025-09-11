import 'package:flutter/material.dart';
import 'package:shartflix/core/constants/app_colors.dart';
import 'package:shartflix/core/constants/app_text_styles.dart';

class ProfileUpdatePage extends StatelessWidget {
  static const String routeName = '/profile-update';
  const ProfileUpdatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        title: Text(
          'Update Profile',
          style: AppTextStyles.h4.copyWith(color: AppColors.white90),
        ),
        backgroundColor: AppColors.black,
        elevation: 0,
      ),
      body: const Center(
        child: Text(
          'This is the Profile Update Page for new users.',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
