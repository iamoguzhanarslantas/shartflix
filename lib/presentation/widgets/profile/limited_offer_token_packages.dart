import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shartflix/core/constants/app_colors.dart';
import 'package:shartflix/core/constants/app_text_styles.dart';
import 'package:shartflix/presentation/widgets/profile/token_package_card.dart';

class LimitedOfferTokenPackages extends StatelessWidget {
  const LimitedOfferTokenPackages({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 354.w,
      height: 238.h,
      decoration: BoxDecoration(
        color: Colors.transparent, // Placeholder color
        borderRadius: BorderRadius.circular(
          8.r,
        ), // Placeholder border radius
      ),
      child: Column(
        children: [
          SizedBox(
            width: 354.w,
            height: 20.h,
            child: Text(
              'Kilidi açmak için bir jeton paketi seçin',
              textAlign: TextAlign.center,
              style: AppTextStyles.bodyLargeMedium.copyWith(
                color: AppColors.white,
                height: 1.0, // 100% line-height
              ),
            ),
          ),
          SizedBox(height: 32.h), // 32px spacing
          Container(
            width: 354.w,
            height: 186.h,
            decoration: BoxDecoration(
              color: Colors.transparent, // Placeholder color
              borderRadius: BorderRadius.circular(
                8.r,
              ), // Placeholder border radius
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const TokenPackageCard(
                      oldPrice: '200',
                      newPrice: '300',
                      tokenText: 'Jeton',
                      price: '₺99,99',
                      frequencyText: 'Başına haftalık',
                      gradientColor1: AppColors.bonusCard,
                      gradientColor2: AppColors.primary,
                      badgeText: '+10%',
                      badgeColor: AppColors.bonusCard,
                    ),
                    SizedBox(
                      width: 12.w,
                    ), // 12px gap
                    const TokenPackageCard(
                      oldPrice: '2000',
                      newPrice: '3.375',
                      tokenText: 'Jeton',
                      price: '₺799,99',
                      frequencyText: 'Başına haftalık',
                      gradientColor1: AppColors.secondary,
                      gradientColor2: AppColors.primary,
                      badgeText: '+20%',
                      badgeColor: AppColors.secondary,
                    ),
                    SizedBox(
                      width: 12.w,
                    ), // 12px gap
                    const TokenPackageCard(
                      oldPrice: '1000',
                      newPrice: '1.350',
                      tokenText: 'Jeton',
                      price: '₺399,99',
                      frequencyText: 'Başına haftalık',
                      gradientColor1: AppColors.bonusCard,
                      gradientColor2: AppColors.primary,
                      badgeText: '+30%',
                      badgeColor: AppColors.bonusCard,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
