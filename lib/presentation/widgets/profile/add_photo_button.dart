import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shartflix/core/constants/app_colors.dart';
import 'package:shartflix/core/constants/app_dimensions.dart';
import 'package:shartflix/core/constants/app_strings.dart';
import 'package:shartflix/core/constants/app_text_styles.dart';

class AddPhotoButton extends StatelessWidget {
  final VoidCallback onPressed;

  const AddPhotoButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppDimensions.addPhotoButtonWidth.w,
      height: AppDimensions.addPhotoButtonHeight.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          AppDimensions.addPhotoButtonBorderRadius.r,
        ),
        color: AppColors.white05,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(
            AppDimensions.addPhotoButtonBorderRadius.r,
          ),
          child: Center(
            child: Text(
              AppStrings.addPhoto,
              style: AppTextStyles.bodyNormalSemiBold.copyWith(
                color: AppColors.white,
                fontSize: AppDimensions.addPhotoButtonTextFontSize.sp,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
