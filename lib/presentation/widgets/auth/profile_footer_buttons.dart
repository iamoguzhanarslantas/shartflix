import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shartflix/core/constants/app_colors.dart';
import 'package:shartflix/core/constants/app_text_styles.dart';
import 'package:shartflix/presentation/widgets/common/primary_button.dart';

class ProfileFooterButtons extends StatelessWidget {
  final File? imageFile;
  final VoidCallback? onContinue;
  final VoidCallback? onSkip;
  final bool isLoading;

  const ProfileFooterButtons({
    super.key,
    this.imageFile,
    this.onContinue,
    this.onSkip,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height < 800 ? 66.h : 132.h,
        ), 
        Opacity(
          opacity: imageFile != null ? 1.0 : 0.5,
          child: PrimaryButton(
            text: 'Devam Et',
            onPressed: (imageFile != null && !isLoading) ? onContinue : null,
            isLoading: isLoading,
          ),
        ),
        SizedBox(height: 8.h),
        Center(
          child: TextButton(
            onPressed: isLoading ? null : onSkip,
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
