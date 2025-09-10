import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:shartflix/core/constants/app_colors.dart';
import 'package:shartflix/core/constants/app_text_styles.dart';
import 'package:shartflix/presentation/widgets/common/primary_button.dart';

class ProfileFooterButtons extends StatelessWidget {
  const ProfileFooterButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Positioned(
          bottom: 0,
          left: 8.53.w, // 32px converted to sizer width
          right: 8.53.w, // 32px converted to sizer width
          child: Padding(
            padding: EdgeInsets.only(bottom: 8.h),
            child: Opacity(
              opacity: 0.5,
              child: PrimaryButton(
                label: 'Devam Et',
                onPressed: () {
                  // Handle continue button press
                },
                type: ButtonType.primary,
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 1.6.h, // 13px below the "Devam Et" button
          left: 0,
          right: 0,
          child: Center(
            child: TextButton(
              onPressed: () {
                // Handle skip button press
              },
              child: Text(
                'Atla',
                style: AppTextStyles.bodyLargeSemiBold.copyWith(
                  color: AppColors.white,
                  height: 1, // line-height: 100%
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
