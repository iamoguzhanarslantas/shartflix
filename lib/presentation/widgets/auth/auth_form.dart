import 'package:flutter/material.dart';
import 'package:shartflix/core/constants/app_colors.dart';
import 'package:shartflix/core/constants/app_text_styles.dart';

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
        const SizedBox(height: 16),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.06,
          ), // Responsive horizontal padding
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.88, // Responsive width
            height: 56, // Fixed height
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
