import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shartflix/core/constants/app_colors.dart';
import 'package:shartflix/core/constants/app_text_styles.dart';

class TokenPackageBadge extends StatelessWidget {
  final String badgeText;
  final Color badgeColor;

  const TokenPackageBadge({
    super.key,
    required this.badgeText,
    required this.badgeColor,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: -11.5.h, // (23.h / 2)
      left: 0,
      right: 0,
      child: Center(
        child: Container(
          height: 23.h,
          padding: EdgeInsets.only(
            top: 4.h,
            right: 20.w,
            bottom: 4.h,
            left: 20.w,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
            color: badgeColor,
            boxShadow: [
              BoxShadow(
                color: AppColors.white.withValues(
                  alpha: 0.3,
                ), // Inset effect approximation
                blurRadius: 8.33.r,
                spreadRadius: 0,
                blurStyle: BlurStyle.inner,
              ),
            ],
          ),
          child: SizedBox(
            height: 15.h,
            child: Text(
              badgeText,
              textAlign: TextAlign.center,
              style: AppTextStyles.bodySmallRegular.copyWith(
                color: AppColors.white,
                height: 1.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
