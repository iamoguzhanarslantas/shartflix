import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shartflix/core/constants/app_dimensions.dart';
import 'package:shartflix/presentation/widgets/common/app_layout.dart';
import 'package:shartflix/presentation/widgets/profile/limited_offer_bonus_section.dart';
import 'package:shartflix/presentation/widgets/profile/limited_offer_close_button.dart';
import 'package:shartflix/presentation/widgets/profile/limited_offer_header.dart';
import 'package:shartflix/presentation/widgets/profile/limited_offer_see_all_tokens_button.dart';
import 'package:shartflix/presentation/widgets/profile/limited_offer_token_packages.dart';

class LimitedOfferBottomSheet extends StatelessWidget {
  const LimitedOfferBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(AppDimensions.profileAvatarRadius.r),
      ),
      child: Container(
        width: 402.w,
        height: 665.h,
        decoration: const BoxDecoration(color: Colors.transparent),
        child: AppLayout(
          child: Stack(
            children: [
              const LimitedOfferCloseButton(),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 32.h, horizontal: 24.w),
                child: Container(
                  width: 354.w,
                  height: 601.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  child: Column(
                    children: [
                      const LimitedOfferHeader(),
                      SizedBox(height: 24.h),
                      const LimitedOfferBonusSection(),
                      SizedBox(height: 24.h),
                      const LimitedOfferTokenPackages(),
                      SizedBox(height: 24.h),
                      const LimitedOfferSeeAllTokensButton(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
