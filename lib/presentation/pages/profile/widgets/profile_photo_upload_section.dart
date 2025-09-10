import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:shartflix/core/constants/app_colors.dart';
import 'package:shartflix/core/constants/app_text_styles.dart';
import 'package:shartflix/presentation/widgets/common/dashed_border_photo_upload.dart';

class ProfilePhotoUploadSection extends StatelessWidget {
  const ProfilePhotoUploadSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Positioned(
          top: 13.h + 19.w + 3.w, // Avatar top + avatar height + 12px gap
          left: 0,
          right: 0,
          child: Text(
            'Fotoğraf Yükle',
            textAlign: TextAlign.center,
            style: AppTextStyles.h4.copyWith(
              fontSize: 6.w, // Approximately 24px
              height: 1, // line-height: 100%
              color: AppColors.white,
            ),
          ),
        ),
        Positioned(
          top:
              13.h +
              19.w +
              3.w +
              4.h +
              1.w, // Avatar top + avatar height + 12px gap + 'Fotograf yukle' height + small gap (approx 4px)
          left: 0,
          right: 0,
          child: Text(
            'Profil fotoğrafın için görsel \n yükleyebilirsin',
            textAlign: TextAlign.center,
            style: AppTextStyles.bodyNormalRegular.copyWith(
              fontSize: 3.5.w, // Approximately 14px
              height: 1, // line-height: 100%
              color: AppColors.white90,
            ),
          ),
        ),
        Positioned(
          top:
              13.h +
              19.w +
              1.h +
              4.h +
              5.h +
              16.w, // Adjust top to be below the text, with some spacing
          left: 0,
          right: 0,
          child: Center(
            child: DashedBorderPhotoUpload(
              onTap: () {
                // Handle photo upload tap
              },
            ),
          ),
        ),
      ],
    );
  }
}
