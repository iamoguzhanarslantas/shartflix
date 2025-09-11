import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shartflix/presentation/widgets/common/primary_button.dart';

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
        SizedBox(height: 16.h),
        PrimaryButton(text: buttonText, onPressed: onButtonPressed),
      ],
    );
  }
}
