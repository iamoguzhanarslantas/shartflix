import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shartflix/core/constants/app_colors.dart';
import 'package:shartflix/core/constants/app_dimensions.dart';
import 'package:shartflix/core/constants/app_gradients.dart';
import 'package:shartflix/core/constants/app_icons.dart';
import 'package:shartflix/core/constants/app_strings.dart';
import 'package:shartflix/core/constants/app_text_styles.dart';
import 'package:shartflix/presentation/widgets/profile/limited_offer_bottom_sheet.dart';

class LimitedOfferButton extends StatelessWidget {
  const LimitedOfferButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppDimensions.profileButtonWidth.w,
      height: AppDimensions.profileButtonHeight.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          AppDimensions.profileButtonBorderRadius.r,
        ),
        gradient: AppGradients.limitedOfferButtonGradient,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            showModalBottomSheet(
              enableDrag: false,
              isDismissible: false,
              useRootNavigator: true,
              context: context,
              isScrollControlled: true,
              builder: (BuildContext context) {
                return const LimitedOfferBottomSheet();
              },
            );
          },
          borderRadius: BorderRadius.circular(
            AppDimensions.profileButtonBorderRadius.r,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                AppIcons.gem,
                width: AppDimensions.profileButtonIconSize.w,
                height: AppDimensions.profileButtonIconSize.h,
                colorFilter: ColorFilter.mode(AppColors.white, BlendMode.srcIn),
              ),
              SizedBox(width: AppDimensions.profileButtonTextSpacing.w),
              Text(
                AppStrings.limitedOffer,
                style: AppTextStyles.profileLimitedOffer.copyWith(
                  color: AppColors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
