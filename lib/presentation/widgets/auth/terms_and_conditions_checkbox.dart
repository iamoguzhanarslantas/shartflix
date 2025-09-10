import 'package:flutter/material.dart';
import 'package:shartflix/core/constants/app_colors.dart';
import 'package:shartflix/core/constants/app_text_styles.dart';
import 'package:sizer/sizer.dart';
import 'package:shartflix/core/utils/responsive_helper.dart'; // Import the new helper

class TermsAndConditionsCheckbox extends StatefulWidget {
  const TermsAndConditionsCheckbox({super.key});

  @override
  State<TermsAndConditionsCheckbox> createState() =>
      _TermsAndConditionsCheckboxState();
}

class _TermsAndConditionsCheckboxState
    extends State<TermsAndConditionsCheckbox> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 6.w), // Responsive horizontal padding using Sizer
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                _isChecked = !_isChecked;
              });
            },
            child: Container(
              width: context.isSmallScreenHeight ? 3.5.w : 5.w, // Adjust width for minimal spacing on small screens, slightly less on large
              height: context.isSmallScreenHeight ? 3.5.w : 5.w, // Adjust height for minimal spacing on small screens, slightly less on large
              margin: EdgeInsets.only(
                top: context.isSmallScreenHeight ? 0.05.h : 0.2.h, // Adjust top margin for minimal spacing on small screens, slightly less on large
                left: context.isSmallScreenHeight ? 0.2.w : 0.5.w, // Adjust left margin for minimal spacing on small screens, slightly less on large
              ),
              decoration: BoxDecoration(
                color: _isChecked
                    ? AppColors.primary
                    : AppColors.white05, // Example checked color
                borderRadius: BorderRadius.circular(
                  4,
                ), // Small border radius for checkbox look
                border: Border.all(
                  color: AppColors.white60,
                  width: 1,
                ), // Border color #FFFFFF99 is white60
              ),
              child: _isChecked
                  ? Icon(Icons.check, size: 4.w, color: AppColors.white) // Responsive icon size using Sizer
                  : null,
            ),
          ),
          SizedBox(width: 2.w), // Responsive gap using Sizer
          Expanded(
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Kullanıcı sözleşmesini ',
                    style: AppTextStyles.bodySmallRegular.copyWith(
                      color: AppColors.white60, // #FFFFFF99 is white60
                    ),
                  ),
                  TextSpan(
                    text: 'Okudum ve Kabul ediyorum.',
                    style: AppTextStyles.bodySmallSemiBold.copyWith(
                      color: AppColors.white, // White color
                      decoration: TextDecoration.underline, // Underlined
                      decorationStyle: TextDecorationStyle.solid,
                      decorationThickness: 1, // Default thickness
                    ),
                  ),
                  TextSpan(
                    text: ' Bu sözleşmeyi okuyarak devam ediniz lütfen.',
                    style: AppTextStyles.bodySmallRegular.copyWith(
                      color: AppColors.white60, // #FFFFFF99 is white60
                    ),
                  ),
                ],
              ),
              textAlign: TextAlign.left, // Align text to left
            ),
          ),
        ],
      ),
    );
  }
}
