import 'package:flutter/material.dart';
import 'package:shartflix/core/constants/app_colors.dart';
import 'package:shartflix/core/constants/app_text_styles.dart';

class AuthHeader extends StatelessWidget {
  final String title;
  final String subtitle;
  final Widget? topWidget;

  const AuthHeader({
    super.key,
    required this.title,
    required this.subtitle,
    this.topWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (topWidget != null) topWidget!,
        Image.asset('assets/icon/app_logo.png', width: 78, height: 78),
        Text(title, style: AppTextStyles.h4.copyWith(color: AppColors.white)),
        const SizedBox(height: 5), // Small gap between texts
        Text(
          subtitle,
          style: AppTextStyles.bodyNormalRegular.copyWith(
            color: AppColors.white,
          ),
        ),
      ],
    );
  }
}
