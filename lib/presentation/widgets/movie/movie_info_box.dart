import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shartflix/core/constants/app_colors.dart';
import 'package:shartflix/core/constants/app_text_styles.dart';
import 'package:shartflix/core/constants/app_icons.dart'; // Assuming you have an icon for this
import 'package:flutter_svg/flutter_svg.dart'; // For SVG icons

class MovieInfoBox extends StatelessWidget {
  final String movieTitle;
  final String movieDescription;
  final String iconPath; // Path to the icon

  const MovieInfoBox({
    super.key,
    required this.movieTitle,
    required this.movieDescription,
    required this.iconPath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 402.w,
      height: 87.h,
      padding: EdgeInsets.only(
        top: 16.h,
        right: 24.w,
        bottom: 16.h,
        left: 24.w,
      ),
      decoration: BoxDecoration(
        color: AppColors.white10, // Example background color
        borderRadius: BorderRadius.circular(12.r), // Example border radius
      ),
      child: Row(
        children: [
          // Icon
          SvgPicture.asset(
            iconPath,
            colorFilter: ColorFilter.mode(AppColors.white, BlendMode.srcIn),
            width: 24.w,
            height: 24.h,
          ),
          SizedBox(width: 16.w), // Gap between icon and text
          // Movie Title and Description
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                movieTitle,
                style: AppTextStyles.bodyLargeSemiBold.copyWith(
                  color: AppColors.white,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 4.h),
              Text(
                movieDescription,
                style: AppTextStyles.bodySmallRegular.copyWith(
                  color: AppColors.white60,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
