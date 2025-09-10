import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shartflix/core/constants/app_colors.dart';

class ProfileAvatarWidget extends StatelessWidget {
  const ProfileAvatarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 13.h, // Approximately 52px from the top
      left: 0,
      right: 0,
      child: Center(
        child: Container(
          width: 19.w, // Approximately 76px
          height: 19.w, // Approximately 76px
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6.w), // Approximately 24px
            color: AppColors.black.withValues(alpha: 0.25), // #00000040
          ),
          child: Center(
            child: SvgPicture.asset(
              'assets/icon/Vector.svg',
              width: 10
                  .w, // Adjust icon size as needed, e.g., half of avatar width
              height: 10.w, // Adjust icon size as needed
              colorFilter: const ColorFilter.mode(
                AppColors.white,
                BlendMode.srcIn,
              ), // Assuming the icon should be white
            ),
          ),
        ),
      ),
    );
  }
}
