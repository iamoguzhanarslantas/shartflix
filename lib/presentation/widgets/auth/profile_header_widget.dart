import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:shartflix/core/constants/app_text_styles.dart';
import 'package:shartflix/presentation/widgets/common/back_button_widget.dart';

class ProfileHeaderWidget extends StatelessWidget {
  const ProfileHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 68.w, top: 68.h, bottom: 8.h, left: 24.w),
      child: Row(
        children: [
          BackButtonWidget(
            onPressed: () {
              context.pop();
            },
          ),
          Expanded(
            child: Text(
              'Profil Detayı',
              textAlign: TextAlign.center,
              style: AppTextStyles.bodyXLargeSemiBold.copyWith(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
