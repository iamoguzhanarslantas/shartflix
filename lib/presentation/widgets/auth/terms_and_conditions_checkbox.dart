import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shartflix/core/constants/app_colors.dart';
import 'package:shartflix/core/constants/app_text_styles.dart';

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
      padding: EdgeInsets.symmetric(horizontal: 24.w),
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
              width: 20.w,
              height: 20.h,
              margin: EdgeInsets.only(top: 2.h, left: 2.w),
              decoration: BoxDecoration(
                color: _isChecked
                    ? AppColors.primary
                    : AppColors.white05, // Example checked color
                borderRadius: BorderRadius.circular(6.r),
                border: Border.all(color: AppColors.white20, width: 1.w),
              ),
              child: _isChecked
                  ? Icon(Icons.check, size: 16.sp, color: AppColors.white)
                  : null,
            ),
          ),
          SizedBox(width: 8.w),
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
