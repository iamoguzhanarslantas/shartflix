import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart'; // Import go_router
import 'package:shartflix/core/constants/app_colors.dart';
import 'package:shartflix/core/constants/app_text_styles.dart';
import 'package:shartflix/data/models/user_model.dart';
import 'package:shartflix/presentation/pages/auth/profile_photo_upload_page.dart'; // Import ProfilePhotoUploadPage

class ProfileInfoWidget extends StatelessWidget {
  final UserModel user;

  const ProfileInfoWidget({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: GestureDetector(
              onTap: () {
                context.go(ProfilePhotoUploadPage.routeName);
              },
              child: CircleAvatar(
                radius: 50.r,
                backgroundColor: AppColors.primary,
                backgroundImage: user.photoUrl != null && user.photoUrl!.isNotEmpty
                    ? NetworkImage(user.photoUrl!)
                    : null,
                child: user.photoUrl == null || user.photoUrl!.isEmpty
                    ? Icon(
                        Icons.person,
                        size: 50.r,
                        color: AppColors.white,
                      )
                    : null,
              ),
            ),
          ),
          SizedBox(height: 24.h),
          Text(
            'Name:',
            style: AppTextStyles.bodyNormalSemiBold.copyWith(color: AppColors.white60),
          ),
          Text(
            user.name ?? 'N/A',
            style: AppTextStyles.bodyLargeRegular.copyWith(color: AppColors.white),
          ),
          SizedBox(height: 16.h),
          Text(
            'Email:',
            style: AppTextStyles.bodyNormalSemiBold.copyWith(color: AppColors.white60),
          ),
          Text(
            user.email ?? 'N/A',
            style: AppTextStyles.bodyLargeRegular.copyWith(color: AppColors.white),
          ),
          SizedBox(height: 16.h),
          // Add more profile fields as needed
        ],
      ),
    );
  }
}
