import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shartflix/core/constants/app_colors.dart';
import 'package:shartflix/core/constants/app_dimensions.dart';
import 'package:shartflix/data/entities/user_entity.dart';

class ProfilePageUserPhoto extends StatelessWidget {
  const ProfilePageUserPhoto({super.key, required this.user});

  final UserEntity user;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: AppDimensions.profileAvatarRadius.r,
      child: user.photoUrl != null && user.photoUrl!.isNotEmpty
          ? ClipOval(
              child: Image.network(
                user.photoUrl!,
                fit: BoxFit.cover,
                width: AppDimensions.profileAvatarRadius.r * 2,
                height: AppDimensions.profileAvatarRadius.r * 2,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  }
                  return Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
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
                    size: AppDimensions.profileAvatarRadius.r,
                    color: AppColors.white,
                  );
                },
              ),
            )
          : Icon(
              Icons.person,
              size: AppDimensions.profileAvatarRadius.r,
              color: AppColors.white,
            ),
    );
  }
}
