import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shartflix/core/constants/app_colors.dart';
import 'package:shartflix/core/constants/app_icons.dart';

class LimitedOfferCloseButton extends StatelessWidget {
  const LimitedOfferCloseButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 16.w,
      top: 16.h,
      child: GestureDetector(
        onTap: () {
          Navigator.pop(
            context,
          ); // Close the bottom sheet
        },
        child: ClipOval(
          // Use ClipOval for perfect circle with blur
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 20,
              sigmaY: 20,
            ),
            child: Container(
              width: 36.w,
              height: 36.h,
              decoration: BoxDecoration(
                color: AppColors.black10, // #0000001A (10% black)
                shape: BoxShape.circle,
                border: Border.all(
                  color: AppColors.white50, // #FFFFFF80 (50% white)
                  width: 1.w,
                ),
              ),
              child: Center(
                child: SvgPicture.asset(
                  AppIcons.x,
                  width: 24.w,
                  height: 24.h,
                  colorFilter: ColorFilter.mode(
                    AppColors.white,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
