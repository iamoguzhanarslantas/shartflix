import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';
import 'package:shartflix/core/constants/app_text_styles.dart';
import 'package:shartflix/presentation/widgets/common/back_button_widget.dart';

class ProfileHeaderWidget extends StatelessWidget {
  const ProfileHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 2.h,
          left: 5.w,
          child: BackButtonWidget(
            onPressed: () {
              context.pop();
            },
          ),
        ),
        Positioned(
          top: 2.h + 3.25.w, // Vertically center with back button
          left: 0, // Set left to 0 to allow SizedBox to take full width
          right: 0, // Set right to 0 to allow SizedBox to take full width
          child: SizedBox(
            width: 100.w, // Take full width to center the text
            child: Text(
              'Profil Detayı',
              textAlign: TextAlign.center,
              style: AppTextStyles.bodyXLargeSemiBold.copyWith(
                fontSize: 4.5.w, // Approximately 18px
                height: 1, // line-height: 100%
              ),
            ),
          ),
        ),
      ],
    );
  }
}
