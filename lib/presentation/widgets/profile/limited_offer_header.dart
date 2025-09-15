import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shartflix/core/constants/app_colors.dart';
import 'package:shartflix/core/constants/app_text_styles.dart';

class LimitedOfferHeader extends StatelessWidget {
  const LimitedOfferHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
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
            style: AppTextStyles.bodyNormalRegular.copyWith(
              color: AppColors.white.withValues(
                alpha: 0.9,
              ), // 90% white
              height: 1.0, // 100% line-height
            ),
          ),
        ),
      ],
    );
  }
}
