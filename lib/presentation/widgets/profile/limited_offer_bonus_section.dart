import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shartflix/core/constants/app_colors.dart';
import 'package:shartflix/core/constants/app_icons.dart';
import 'package:shartflix/core/constants/app_text_styles.dart';
import 'package:shartflix/presentation/widgets/limited_offer_bonus_card.dart';

class LimitedOfferBonusSection extends StatelessWidget {
  const LimitedOfferBonusSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 354.w,
      height: 164.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: AppColors.white.withValues(
            alpha: 0.2,
          ), // 20% white
          width: 1.w,
        ),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 16.h,
          ), // 16px top spacing
          SizedBox(
            height: 20.h,
            child: Text(
              'Alacağınız Bonuslar',
              textAlign: TextAlign.center,
              style: AppTextStyles.bodyLargeMedium.copyWith(
                color: AppColors.white,
              ),
            ),
          ),
          SizedBox(height: 14.h), // 14px spacing
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              LimitedOfferBonusCard(
                iconPath: AppIcons.premium,
                text: 'Premium Hesap',
              ),
              LimitedOfferBonusCard(
                iconPath: AppIcons.moreMatches,
                text: 'Daha Fazla Eşleşme',
              ),
              LimitedOfferBonusCard(
                iconPath: AppIcons.upFront,
                text: 'Öne Çıkarma',
              ),
              LimitedOfferBonusCard(
                iconPath: AppIcons.moreLikes,
                text: 'Daha Fazla Beğeni',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
