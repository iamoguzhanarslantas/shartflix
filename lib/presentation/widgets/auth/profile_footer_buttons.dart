import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shartflix/core/constants/app_colors.dart';
import 'package:shartflix/core/constants/app_text_styles.dart';
import 'package:shartflix/presentation/widgets/common/primary_button.dart';

class ProfileFooterButtons extends StatelessWidget {
  const ProfileFooterButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height < 800 ? 66.h : 132.h,
        ), // Top gap
        Opacity(
          opacity: 0.5,
          child: PrimaryButton(
            text: 'Devam Et',
            onPressed: () {
              // Handle continue button press
            },
          ),
        ),
        SizedBox(height: 8.h),
        Center(
          child: TextButton(
            onPressed: () {
              // Handle skip button press
            },
            child: Text(
              'Atla',
              style: AppTextStyles.bodyLargeSemiBold.copyWith(
                color: AppColors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
