import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shartflix/core/constants/app_colors.dart';
import 'package:shartflix/core/constants/app_dimensions.dart';
import 'package:shartflix/core/constants/app_strings.dart';
import 'package:shartflix/core/constants/app_text_styles.dart';
import 'package:shartflix/presentation/widgets/profile/limited_offer_button.dart';

class ProfilePageAppBar extends StatelessWidget {
  const ProfilePageAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppDimensions.navBarWidth.w,
      height: AppDimensions.profileAppBarHeight.h,
      padding: EdgeInsets.only(
        top: AppDimensions.profileAppBarPaddingTop.h,
        right: AppDimensions.profileAppBarPaddingRight.w,
        bottom: AppDimensions.profileAppBarPaddingBottom.h,
        left: AppDimensions.profileAppBarPaddingLeft.w,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            AppStrings.profile,
            style: AppTextStyles.h5.copyWith(color: AppColors.white),
          ),
          const LimitedOfferButton(), // Use the extracted widget
        ],
      ),
    );
  }
}
