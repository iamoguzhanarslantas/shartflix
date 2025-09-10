import 'package:flutter/material.dart';
import 'package:shartflix/core/constants/app_colors.dart';
import 'package:shartflix/core/constants/app_text_styles.dart';
import 'package:sizer/sizer.dart';
import 'package:shartflix/core/utils/responsive_helper.dart'; // Import the new helper

class AuthForm extends StatelessWidget {
  final List<Widget> formFields;
  final String buttonText;
  final VoidCallback onButtonPressed;

  const AuthForm({
    super.key,
    required this.formFields,
    required this.buttonText,
    required this.onButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...formFields,
        SizedBox(
          height: context.isSmallScreenHeight ? 2.h : 2.h,
        ), // Adjusted height for larger screens, slightly less than before
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 6.w, // Responsive horizontal padding using Sizer
          ),
          child: SizedBox(
            width: context.isSmallScreenHeight
                ? 88.w
                : 88.w, // Responsive width using Sizer
            height: context.isSmallScreenHeight
                ? 7.h
                : 7.h, // Consistent height with text inputs
            child: ElevatedButton(
              onPressed: onButtonPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary, // Primary color
                padding: const EdgeInsets.fromLTRB(
                  32,
                  8,
                  32,
                  8,
                ), // Specified padding
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    16,
                  ), // Specified border radius
                ),
              ),
              child: Text(
                buttonText,
                style: AppTextStyles.bodyXLargeSemiBold.copyWith(
                  color: AppColors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
