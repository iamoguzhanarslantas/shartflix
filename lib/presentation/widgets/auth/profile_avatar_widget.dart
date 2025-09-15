import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shartflix/core/constants/app_colors.dart';
import 'package:shartflix/core/constants/app_gradients.dart';
import 'package:shartflix/core/constants/app_icons.dart';

class ProfileAvatarWidget extends StatelessWidget {
  const ProfileAvatarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 52.h),
      child: Center(
        child: Container(
          width: 76.w,
          height: 76.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24.r),
            color: AppColors.black.withValues(alpha: 0.25),
          ),
          child: Center(
            child: ShaderMask(
              shaderCallback: (bounds) =>
                  AppGradients.iconLinearGradient.createShader(bounds),
              blendMode: BlendMode.srcIn,
              child: SvgPicture.asset(
                AppIcons.vector,
                width: 32.w,
                height: 40.h,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
