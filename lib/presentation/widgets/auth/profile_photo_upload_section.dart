import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:sizer/sizer.dart'; // Remove sizer import
import 'package:shartflix/core/constants/app_colors.dart';
import 'package:shartflix/core/constants/app_text_styles.dart';
import 'package:shartflix/presentation/widgets/common/dashed_border_photo_upload.dart';

class ProfilePhotoUploadSection extends StatelessWidget {
  const ProfilePhotoUploadSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 12.h),
      child: Column(
        children: [
          Text(
            'Fotoğraf Yükle',
            textAlign: TextAlign.center,
            style: AppTextStyles.h4.copyWith(color: AppColors.white),
          ),
          SizedBox(height: 12.h),
          Text(
            'Profil fotoğrafın için görsel \n yükleyebilirsin',
            textAlign: TextAlign.center,
            style: AppTextStyles.bodyNormalRegular.copyWith(
              color: AppColors.white90,
            ),
          ),
          SizedBox(height: 52.h), // Spacing between text and photo upload
          Center(
            child: DashedBorderPhotoUpload(
              onTap: () {
                // Handle photo upload tap
              },
            ),
          ),
        ],
      ),
    );
  }
}
