import 'package:flutter/material.dart';
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
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
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
              width: 20,
              height: 20,
              margin: const EdgeInsets.only(
                top: 2,
                left: 2,
              ), // Adjust top and left as per 'top: 2px; left: 2px;'
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
                  ? const Icon(Icons.check, size: 16, color: AppColors.white)
                  : null,
            ),
          ),
          const SizedBox(width: 8), // Gap between checkbox and text
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
