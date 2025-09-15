import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shartflix/core/constants/app_icons.dart';

class PhotoDeleteButton extends StatelessWidget {
  final VoidCallback onTap;
  final bool isVisible;

  const PhotoDeleteButton({
    super.key,
    required this.onTap,
    required this.isVisible,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 36.h, 
      child: Visibility(
        visible: isVisible,
        maintainSize: true,
        maintainAnimation: true,
        maintainState: true,
        child: Padding(
          padding: EdgeInsets.only(top: 12.h),
          child: GestureDetector(
            onTap: onTap, 
            child: SvgPicture.asset(
              AppIcons.photoDelete, 
              width: 24.w,
              height: 24.h,
              
            ),
          ),
        ),
      ),
    );
  }
}
