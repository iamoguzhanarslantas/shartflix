import 'package:flutter/material.dart';
import 'package:shartflix/core/constants/app_colors.dart';
import 'package:shartflix/core/constants/app_text_styles.dart';
import 'package:sizer/sizer.dart'; // Import sizer

enum ButtonType { primary, secondary, outline }

class PrimaryButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final ButtonType type;
  final bool iconOnly;
  final Widget? leftIcon;
  final Widget? rightIcon;

  const PrimaryButton({
    super.key,
    required this.label,
    this.onPressed,
    this.type = ButtonType.primary,
    this.iconOnly = false,
    this.leftIcon,
    this.rightIcon,
  });

  @override
  Widget build(BuildContext context) {
    // ResponsiveHelper is no longer needed for direct pixel to sizer conversion
    // final responsive = ResponsiveHelper(context);

    Color backgroundColor;
    Color textColor;
    BorderSide borderSide;

    switch (type) {
      case ButtonType.primary:
        backgroundColor = AppColors.primary;
        textColor = AppColors.white;
        borderSide = BorderSide.none;
        break;
      case ButtonType.secondary:
        backgroundColor = AppColors.secondary;
        textColor = AppColors.white;
        borderSide = BorderSide.none;
        break;
      case ButtonType.outline:
        backgroundColor = Colors.transparent;
        textColor = AppColors.primary;
        borderSide = BorderSide(color: AppColors.primary, width: 1);
        break;
    }

    return SizedBox(
      width: 94.4.w, // 354px converted to sizer width
      height: 6.89.h, // 56px converted to sizer height
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.26.w), // 16px converted to sizer width
            side: borderSide,
          ),
          padding: EdgeInsets.symmetric(
            horizontal: 8.53.w, // 32px converted to sizer width
            vertical: 0.98.h, // 8px converted to sizer height
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (leftIcon != null) ...[
              leftIcon!,
              SizedBox(width: 2.13.w), // 8px gap converted to sizer width
            ],
            if (!iconOnly)
              Text(
                label,
                style: AppTextStyles.bodyLargeMedium.copyWith(color: textColor),
              ),
            if (rightIcon != null) ...[
              SizedBox(width: 2.13.w), // 8px gap converted to sizer width
              rightIcon!,
            ],
          ],
        ),
      ),
    );
  }
}
