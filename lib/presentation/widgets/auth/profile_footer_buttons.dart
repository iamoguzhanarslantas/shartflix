import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shartflix/core/constants/app_colors.dart';
import 'package:shartflix/core/constants/app_text_styles.dart';
import 'package:shartflix/presentation/widgets/common/primary_button.dart';

class ProfileFooterButtons extends StatelessWidget {
  final File? imageFile;

  const ProfileFooterButtons({super.key, this.imageFile});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height < 800 ? 66.h : 132.h,
        ), // Top gap
        Opacity(
          opacity: imageFile != null ? 1.0 : 0.5,
          child: PrimaryButton(
            text: 'Devam Et',
            onPressed: imageFile != null
                ? () {
                    // Handle continue button press
                  }
                : () {
                    // Do nothing if no image is selected
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
