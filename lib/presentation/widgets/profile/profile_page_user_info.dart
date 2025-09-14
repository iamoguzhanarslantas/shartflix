import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shartflix/core/constants/app_colors.dart';
import 'package:shartflix/core/constants/app_dimensions.dart';
import 'package:shartflix/core/constants/app_text_styles.dart';
import 'package:shartflix/data/entities/user_entity.dart';

class ProfilePageUserInfo extends StatelessWidget {
  const ProfilePageUserInfo({
    super.key,
    required this.user,
  });

  final UserEntity user;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        user.name!.length > 13
            ? Text(
                user.name?.substring(0, 13) ?? 'N/A',
                style: AppTextStyles.bodyLargeSemiBold
                    .copyWith(
                      color: AppColors.white,
                      fontSize: AppDimensions
                          .profileNameFontSize
                          .sp,
                    ),
              )
            : Text(
                user.name ?? 'N/A',
                style: AppTextStyles.bodyLargeSemiBold
                    .copyWith(
                      color: AppColors.white,
                      fontSize: AppDimensions
                          .profileNameFontSize
                          .sp,
                    ),
              ),
        SizedBox(
          height: AppDimensions
              .profileNameEmailColumnGap
              .h,
        ),
        Text(
          "ID: ${user.id?.substring(0, 6) ?? 'N/A'}",
          style: AppTextStyles.bodyNormalMedium
              .copyWith(
                color: AppColors.white60,
                fontSize: AppDimensions
                    .profileEmailFontSize
                    .sp,
              ),
        ),
      ],
    );
  }
}
