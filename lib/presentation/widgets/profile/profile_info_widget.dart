import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:shartflix/core/constants/app_colors.dart';
import 'package:shartflix/core/constants/app_text_styles.dart';
import 'package:shartflix/data/entities/user_entity.dart';
import 'package:shartflix/presentation/pages/profile/profile_photo_upload_page.dart';

class ProfileInfoWidget extends StatelessWidget {
  final UserEntity user;

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
                child: user.photoUrl != null && user.photoUrl!.isNotEmpty
                    ? ClipOval(
                        child: Image.network(
                          user.photoUrl!,
                          fit: BoxFit.cover,
                          width: 100.r, 
                          height: 100.r, 
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) {
                              return child;
                            }
                            return Center(
                              child: CircularProgressIndicator(
                                value:
                                    loadingProgress.expectedTotalBytes != null
                                    ? loadingProgress.cumulativeBytesLoaded /
                                          loadingProgress.expectedTotalBytes!
                                    : null,
                                color: AppColors.white,
                              ),
                            );
                          },
                          errorBuilder: (context, error, stackTrace) {
                            return Icon(
                              Icons.person,
                              size: 50.r,
                              color: AppColors.white,
                            );
                          },
                        ),
                      )
                    : Icon(Icons.person, size: 50.r, color: AppColors.white),
              ),
            ),
          ),
          SizedBox(height: 24.h),
          Text(
            'Name:',
            style: AppTextStyles.bodyNormalSemiBold.copyWith(
              color: AppColors.white60,
            ),
          ),
          Text(
            user.name ?? 'N/A',
            style: AppTextStyles.bodyLargeRegular.copyWith(
              color: AppColors.white,
            ),
          ),
          SizedBox(height: 16.h),
          Text(
            'Email:',
            style: AppTextStyles.bodyNormalSemiBold.copyWith(
              color: AppColors.white60,
            ),
          ),
          Text(
            user.email ?? 'N/A',
            style: AppTextStyles.bodyLargeRegular.copyWith(
              color: AppColors.white,
            ),
          ),
          SizedBox(height: 16.h),
          
        ],
      ),
    );
  }
}
