import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shartflix/core/constants/app_colors.dart';
import 'package:shartflix/core/constants/app_dimensions.dart';
import 'package:shartflix/core/constants/app_gradients.dart';
import 'package:shartflix/core/constants/app_icons.dart';
import 'package:shartflix/core/constants/app_strings.dart';
import 'package:shartflix/core/constants/app_text_styles.dart';
import 'package:shartflix/presentation/widgets/common/app_layout.dart';
import 'package:shartflix/presentation/widgets/limited_offer_bonus_card.dart';
import 'package:shartflix/presentation/widgets/token_package_card.dart';

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
              useRootNavigator: true,
              context: context,
              isScrollControlled: true,
              builder: (BuildContext context) {
                return ClipRRect(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(AppDimensions.profileAvatarRadius.r),
                  ),
                  child: Container(
                    width: 402.w,
                    height: 665.h,
                    decoration: BoxDecoration(color: Colors.transparent),
                    child: AppLayout(
                      child: Stack(
                        children: [
                          Positioned(
                            right: 16.w,
                            top: 16.h,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pop(
                                  context,
                                ); // Close the bottom sheet
                              },
                              child: ClipOval(
                                // Use ClipOval for perfect circle with blur
                                child: BackdropFilter(
                                  filter: ImageFilter.blur(
                                    sigmaX: 20,
                                    sigmaY: 20,
                                  ),
                                  child: Container(
                                    width: 36.w,
                                    height: 36.h,
                                    decoration: BoxDecoration(
                                      color: AppColors
                                          .black10, // #0000001A (10% black)
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: AppColors
                                            .white50, // #FFFFFF80 (50% white)
                                        width: 1.w,
                                      ),
                                    ),
                                    child: Center(
                                      child: SvgPicture.asset(
                                        AppIcons.x,
                                        width: 24.w,
                                        height: 24.h,
                                        colorFilter: ColorFilter.mode(
                                          AppColors.white,
                                          BlendMode.srcIn,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 32.h,
                              horizontal: 24.w,
                            ),
                            child: Container(
                              width: 354.w,
                              height: 601.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  16.r,
                                ), // Example border radius
                              ),
                              child: Column(
                                children: [
                                  SizedBox(
                                    width: 298.w,
                                    height: 29.h,
                                    child: Text(
                                      'Sınırlı Teklif',
                                      textAlign: TextAlign.center,
                                      style: AppTextStyles.h4.copyWith(
                                        color: AppColors.white,
                                        height: 1.0, // 100% line-height
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 8.h), // 8px spacing
                                  SizedBox(
                                    width: 298.w,
                                    height: 34.h,
                                    child: Text(
                                      'Jeton paketini seçerek bonus kazanın ve yeni bölümlerin kilidini açın!',
                                      textAlign: TextAlign.center,
                                      style: AppTextStyles.bodyNormalRegular
                                          .copyWith(
                                            color: AppColors.white.withValues(
                                              alpha: 0.9,
                                            ), // 90% white
                                            height: 1.0, // 100% line-height
                                          ),
                                    ),
                                  ),
                                  SizedBox(height: 24.h), // 24px spacing
                                  Container(
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
                                      // Using Column to respect the 'gap' property later
                                      children: [
                                        SizedBox(
                                          height: 16.h,
                                        ), // 16px top spacing
                                        SizedBox(
                                          height: 20.h,
                                          child: Text(
                                            'Alacağınız Bonuslar',
                                            textAlign: TextAlign.center,
                                            style: AppTextStyles.bodyLargeMedium
                                                .copyWith(
                                                  color: AppColors.white,
                                                ),
                                          ),
                                        ),
                                        SizedBox(height: 14.h), // 14px spacing
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            LimitedOfferBonusCard(
                                              iconPath: AppIcons.premium,
                                              text: 'Premium Hesap',
                                            ),
                                            LimitedOfferBonusCard(
                                              iconPath: AppIcons
                                                  .moreMatches, // Using AppIcons.gem as placeholder
                                              text: 'Daha Fazla Eşleşme',
                                            ),
                                            LimitedOfferBonusCard(
                                              iconPath: AppIcons
                                                  .upFront, // Using AppIcons.gem as placeholder
                                              text: 'Öne Çıkarma',
                                            ),
                                            LimitedOfferBonusCard(
                                              iconPath: AppIcons
                                                  .moreLikes, // Using AppIcons.gem as placeholder
                                              text: 'Daha Fazla Beğeni',
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 24.h), // 24px spacing
                                  Container(
                                    width: 354.w,
                                    height: 238.h,
                                    decoration: BoxDecoration(
                                      color: Colors
                                          .transparent, // Placeholder color
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
                                            style: AppTextStyles.bodyLargeMedium
                                                .copyWith(
                                                  color: AppColors.white,
                                                  height:
                                                      1.0, // 100% line-height
                                                ),
                                          ),
                                        ),
                                        SizedBox(height: 32.h), // 32px spacing
                                        Container(
                                          width: 354.w,
                                          height: 186.h,
                                          decoration: BoxDecoration(
                                            color: Colors
                                                .transparent, // Placeholder color
                                            borderRadius: BorderRadius.circular(
                                              8.r,
                                            ), // Placeholder border radius
                                          ),
                                          child: Column(
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  const TokenPackageCard(
                                                    oldPrice: '200',
                                                    newPrice: '300',
                                                    tokenText: 'Jeton',
                                                    price: '₺99,99',
                                                    frequencyText:
                                                        'Başına haftalık',
                                                    gradientColor1:
                                                        AppColors.bonusCard,
                                                    gradientColor2:
                                                        AppColors.primary,
                                                    badgeText: '+10%',
                                                    badgeColor:
                                                        AppColors.bonusCard,
                                                  ),
                                                  SizedBox(
                                                    width: 12.w,
                                                  ), // 12px gap
                                                  const TokenPackageCard(
                                                    oldPrice: '2000',
                                                    newPrice: '3.375',
                                                    tokenText: 'Jeton',
                                                    price: '₺799,99',
                                                    frequencyText:
                                                        'Başına haftalık',
                                                    gradientColor1:
                                                        AppColors.secondary,
                                                    gradientColor2:
                                                        AppColors.primary,
                                                    badgeText: '+20%',
                                                    badgeColor:
                                                        AppColors.secondary,
                                                  ),
                                                  SizedBox(
                                                    width: 12.w,
                                                  ), // 12px gap
                                                  const TokenPackageCard(
                                                    oldPrice: '1000',
                                                    newPrice: '1.350',
                                                    tokenText: 'Jeton',
                                                    price: '₺399,99',
                                                    frequencyText:
                                                        'Başına haftalık',
                                                    gradientColor1:
                                                        AppColors.bonusCard,
                                                    gradientColor2:
                                                        AppColors.primary,
                                                    badgeText: '+30%',
                                                    badgeColor:
                                                        AppColors.bonusCard,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 24.h,
                                  ), // 24px spacing for the button
                                  Container(
                                    width: 354.w,
                                    height: 56.h,
                                    padding: EdgeInsets.symmetric(
                                      vertical: 8.h,
                                      horizontal: 32.w,
                                    ),
                                    decoration: BoxDecoration(
                                      color: AppColors
                                          .primary, // buttonColor: primary
                                      borderRadius: BorderRadius.circular(16.r),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Tüm Jetonları Gör',
                                        style: AppTextStyles.bodyLargeSemiBold
                                            .copyWith(
                                              // Assuming a bold style for primary button
                                              color: AppColors.white,
                                            ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
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
