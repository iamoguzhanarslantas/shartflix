import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shartflix/core/constants/app_colors.dart';
import 'package:shartflix/core/constants/app_text_styles.dart';

class TokenPackageCard extends StatelessWidget {
  final String oldPrice;
  final String newPrice;
  final String tokenText;
  final String price;
  final String frequencyText;
  final Color gradientColor1;
  final Color gradientColor2;
  final String badgeText;
  final Color badgeColor;

  const TokenPackageCard({
    super.key,
    required this.oldPrice,
    required this.newPrice,
    required this.tokenText,
    required this.price,
    required this.frequencyText,
    required this.gradientColor1,
    required this.gradientColor2,
    required this.badgeText,
    required this.badgeColor,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none, // Allows children to overflow
      children: [
        Container(
          width: 110.w,
          height: 186.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              16.r,
            ), // Updated from 8.r to 16.r
            gradient: RadialGradient(
              colors: [gradientColor1, gradientColor2],
              center: Alignment(2 * 26.44 / 100 - 1, 2 * 15.22 / 100 - 1),
              radius: 1.4456,
            ),
            border: Border.all(
              color: AppColors.white.withValues(
                alpha: 0.4,
              ), // #FFFFFF66 (40% white)
              width: 1.w,
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.white.withValues(
                  alpha: 0.3,
                ), // #FFFFFF4D (30% white) inset approximation
                blurRadius: 15.r,
                spreadRadius: 0,
                offset: const Offset(4, 4), // Simulating inset with offset
              ),
            ],
          ),
          child: Column(
            children: [
              SizedBox(
                height: 124.h,
                child: Column(
                  children: [
                    SizedBox(height: 32.5.h), // 32.5px top spacing
                    SizedBox(
                      height: 19.h,
                      child: Text(
                        oldPrice,
                        textAlign: TextAlign.center,
                        style: AppTextStyles.limitedOfferBonusText.copyWith(
                          color: AppColors.white.withValues(
                            alpha: 0.9,
                          ), // 90% white
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 39.h,
                      child: Text(
                        newPrice,
                        textAlign: TextAlign.center,
                        style: AppTextStyles.h3.copyWith(
                          color: AppColors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 17.h,
                      child: Text(
                        tokenText,
                        textAlign: TextAlign.center,
                        style: AppTextStyles.bodyNormalMedium.copyWith(
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 14.h,
              ), // 14px spacing between the two inner containers
              SizedBox(
                height: 36.h,
                child: Column(
                  children: [
                    SizedBox(
                      height: 20.h,
                      child: Text(
                        price,
                        textAlign: TextAlign.center,
                        style: AppTextStyles.bodyLargeBold.copyWith(
                          color: AppColors.white,
                        ),
                      ),
                    ),
                    SizedBox(height: 1.h), // 1px spacing
                    SizedBox(
                      height: 15.h,
                      child: Text(
                        frequencyText,
                        textAlign: TextAlign.center,
                        style: AppTextStyles.bodySmallMedium.copyWith(
                          color: AppColors.white.withValues(
                            alpha: 0.8,
                          ), // 80% white
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: -11.5.h, // (23.h / 2)
          left: 0,
          right: 0,
          child: Center(
            child: Container(
              height: 23.h,
              padding: EdgeInsets.only(
                top: 4.h,
                right: 20.w,
                bottom: 4.h,
                left: 20.w,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.r),
                color: badgeColor,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.white.withValues(
                      alpha: 0.3,
                    ), // Inset effect approximation
                    blurRadius: 8.33.r,
                    spreadRadius: 0,
                    blurStyle: BlurStyle.inner,
                  ),
                ],
              ),
              child: SizedBox(
                height: 15.h,
                child: Text(
                  badgeText,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.bodySmallRegular.copyWith(
                    color: AppColors.white,
                    height: 1.0,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
