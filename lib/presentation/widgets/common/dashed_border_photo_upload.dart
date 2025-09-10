import 'package:flutter/material.dart';
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
          strokeWidth: 1,
          color: AppColors.white20, // 20% white for border
          dashes: const [4, 4],
          radius: 32,
        ),
        child: Container(
          width: 176,
          height: 176,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: AppColors.white05,
            borderRadius: BorderRadius.circular(32),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/icon/Plus.svg', // Assuming Plus.svg is the icon
                width: 24, // Example size, adjust as needed
                height: 24, // Example size, adjust as needed
                colorFilter: ColorFilter.mode(
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
