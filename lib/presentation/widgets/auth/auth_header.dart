import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
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
        if (topWidget == null) SizedBox(height: 76.h),
        SvgPicture.asset('assets/icon/Icon.svg', width: 78.w, height: 78.h),
        SizedBox(height: 12.h),
        Text(title, style: AppTextStyles.h4.copyWith(color: AppColors.white)),
        SizedBox(height: 10.h),
        Text(
          subtitle,
          style: AppTextStyles.bodyNormalRegular.copyWith(
            color: AppColors.white90,
          ),
        ),
        SizedBox(height: 24.h),
      ],
    );
  }
}
