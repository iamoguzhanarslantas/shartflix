import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shartflix/core/constants/app_colors.dart';
import 'dart:ui'; // Required for ImageFilter

class FavoriteButtonWithBlur extends StatelessWidget {
  final bool isFavorite;
  final VoidCallback onFavoriteToggle;

  const FavoriteButtonWithBlur({
    super.key,
    required this.isFavorite,
    required this.onFavoriteToggle,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(
        50.r,
      ), // Clips the blur effect to a rounded rectangle.
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
        child: Container(
          width: 52.w,
          height: 72.h,
          padding: EdgeInsets.only(
            top: 24.h,
            right: 14.w,
            bottom: 24.h,
            left: 14.w,
          ),
          decoration: BoxDecoration(
            color: isFavorite
                ? AppColors.black.withValues(alpha: 0.2)
                : AppColors.black.withValues(alpha: 0.05),
            borderRadius: BorderRadius.circular(
              50.r,
            ), // Defines the rounded corners for the container's background and border.
            border: Border.all(
              color: isFavorite
                  ? AppColors.white.withValues(alpha: 0.6)
                  : AppColors.white.withValues(alpha: 0.2),
              width: 1.w,
            ),
          ),
          child: IconButton(
            padding: EdgeInsets.zero,
            iconSize: 24.w,
            icon: Icon(
              isFavorite == true ? Icons.favorite : Icons.favorite_border,
              color: isFavorite == true ? AppColors.primary : AppColors.white,
            ),
            onPressed: onFavoriteToggle,
          ),
        ),
      ),
    );
  }
}
