import 'package:flutter/material.dart';
import 'package:shartflix/core/constants/app_colors.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BackButtonWidget extends StatelessWidget {
  final VoidCallback onPressed;

  const BackButtonWidget({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width:
            11.w, // Approximately 44px on a 400px wide screen (44/400 = 0.11)
        height: 11.w, // Maintain aspect ratio
        padding: EdgeInsets.all(2.w), // Approximately 8px
        decoration: BoxDecoration(
          color: AppColors.white05,
          borderRadius: BorderRadius.circular(
            4.w, // Approximately 16px
          ),
          border: Border.all(
            color: AppColors.white20,
            width: 0.25.w, // Approximately 1px
          ),
        ),
        child: SvgPicture.asset(
          'assets/icon/Arrow.svg',
          width: 6.w, // Approximately 24px
          height: 6.w, // Maintain aspect ratio
          colorFilter: const ColorFilter.mode(
            AppColors.white,
            BlendMode.srcIn,
          ), // Apply color filter for SVG
        ),
      ),
    );
  }
}
