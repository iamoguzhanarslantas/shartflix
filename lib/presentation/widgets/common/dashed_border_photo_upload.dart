import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shartflix/core/constants/app_colors.dart';
import 'package:shartflix/presentation/widgets/common/dashed_border_painter.dart';

class DashedBorderPhotoUpload extends StatelessWidget {
  final VoidCallback onTap;

  const DashedBorderPhotoUpload({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CustomPaint(
        painter: DashedBorderPainter(
          strokeWidth: 1.w,
          color: AppColors.white20, // 20% white for border
          dashes: const [4, 4],
          radius: 32.r,
        ),
        child: Container(
          width: 176.w,
          height: 176.h,
          padding: EdgeInsets.all(10.r),
          decoration: BoxDecoration(
            color: AppColors.white05,
            borderRadius: BorderRadius.circular(32.r),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/icon/Plus.svg', // Assuming Plus.svg is the icon
                width: 32.w, // Example size, adjust as needed
                height: 32.h, // Example size, adjust as needed
                colorFilter: const ColorFilter.mode(
                  AppColors.white,
                  BlendMode.srcIn,
                ), // Adjust color as needed
              ),
            ],
          ),
        ),
      ),
    );
  }
}
