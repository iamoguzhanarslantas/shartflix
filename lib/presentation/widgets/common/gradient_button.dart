import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shartflix/core/constants/app_colors.dart';
import 'package:shartflix/core/constants/app_dimensions.dart';
import 'package:shartflix/core/constants/app_gradients.dart';
import 'package:shartflix/core/constants/app_text_styles.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GradientButton extends StatelessWidget {
  final String text;
  final String inactiveIconPath; // Changed to String path
  final String activeIconPath; // Changed to String path
  final bool isActive;
  final VoidCallback onPressed;

  const GradientButton({
    super.key,
    required this.text,
    required this.inactiveIconPath, // Changed to path
    required this.activeIconPath, // Changed to path
    required this.isActive,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: AppDimensions.gradientButtonWidth.w,
        height: AppDimensions.gradientButtonHeight.h,
        decoration: BoxDecoration(
          gradient: isActive ? AppGradients.buttonRadialGradient : null,
          borderRadius: BorderRadius.circular(
            AppDimensions.gradientButtonBorderRadius.r,
          ),
          border: Border.all(
            color: AppColors.white30,
            width: AppDimensions.gradientButtonBorderWidth.w,
          ),
          color: isActive ? null : AppColors.black,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              isActive ? activeIconPath : inactiveIconPath,
              colorFilter: ColorFilter.mode(AppColors.white, BlendMode.srcIn),
              width: AppDimensions.gradientButtonIconSize.w,
              height: AppDimensions.gradientButtonIconSize.h,
            ),
            SizedBox(width: AppDimensions.gradientButtonTextSpacing.w),
            Text(
              text,
              style: AppTextStyles.bodyNormalMedium.copyWith(
                color: AppColors.white,
                fontSize: AppDimensions.gradientButtonFontSize.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
