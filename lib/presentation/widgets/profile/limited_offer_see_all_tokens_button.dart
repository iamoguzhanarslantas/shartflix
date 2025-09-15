import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shartflix/core/constants/app_colors.dart';
import 'package:shartflix/core/constants/app_text_styles.dart';

class LimitedOfferSeeAllTokensButton extends StatelessWidget {
  const LimitedOfferSeeAllTokensButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 354.w,
      height: 56.h,
      padding: EdgeInsets.symmetric(
        vertical: 8.h,
        horizontal: 32.w,
      ),
      decoration: BoxDecoration(
        color: AppColors.primary, // buttonColor: primary
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Center(
        child: Text(
          'Tüm Jetonları Gör',
          style: AppTextStyles.bodyLargeSemiBold.copyWith(
            // Assuming a bold style for primary button
            color: AppColors.white,
          ),
        ),
      ),
    );
  }
}
