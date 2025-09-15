import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shartflix/core/constants/app_colors.dart';
import 'package:shartflix/core/constants/app_text_styles.dart';

class LimitedOfferBonusCard extends StatelessWidget {
  final String iconPath;
  final String text;

  const LimitedOfferBonusCard({
    super.key,
    required this.iconPath,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80.5.w,
      height: 98.h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 56.w,
            height: 56.h,
            decoration: BoxDecoration(
              color: AppColors.bonusCard,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: AppColors.white.withValues(alpha: 0.2),
                  blurRadius: 8.33.r,
                  spreadRadius: 0,
                  blurStyle: BlurStyle.inner,
                ),
              ],
            ),
            child: SvgPicture.asset(
              iconPath,
              width: 32.w,
              height: 32.h,
              colorFilter: ColorFilter.mode(AppColors.white, BlendMode.srcIn),
            ),
          ),
          SizedBox(height: 10.h), 
          Transform.rotate(
            angle: -0.09 * (3.1415926535 / 180), 
            child: SizedBox(
              width: 80.5.w,
              height: 30.0.h,
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: AppTextStyles.bodySmallRegular.copyWith(
                  color: AppColors.white,
                  height: 1.0, 
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
