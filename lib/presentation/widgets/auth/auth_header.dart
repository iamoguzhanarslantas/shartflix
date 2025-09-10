import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shartflix/core/constants/app_colors.dart';
import 'package:shartflix/core/constants/app_text_styles.dart';
import 'package:sizer/sizer.dart';

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
        SvgPicture.asset(
          'assets/icon/Icon.svg',
          width: 20.w, // Responsive width using Sizer
          height: 25.w, // Responsive height using Sizer
        ),
        Text(title, style: AppTextStyles.h4.copyWith(color: AppColors.white)),
        SizedBox(height: 1.h), // Responsive gap using Sizer
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
