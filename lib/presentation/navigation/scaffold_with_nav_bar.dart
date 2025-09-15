import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shartflix/core/constants/app_dimensions.dart';
import 'package:shartflix/core/constants/app_gradients.dart';
import 'package:shartflix/core/constants/app_icons.dart';
import 'package:shartflix/core/constants/app_strings.dart';
import 'package:shartflix/presentation/widgets/common/gradient_button.dart';

class ScaffoldWithNavBar extends StatelessWidget {
  const ScaffoldWithNavBar({required this.navigationShell, Key? key})
    : super(key: key ?? const ValueKey('ScaffoldWithNavBar'));

  final StatefulNavigationShell navigationShell;

  void _goBranch(int index) {
    navigationShell.goBranch(
      index,
      
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          navigationShell,
          Container(
            width: AppDimensions.navBarWidth.w,
            height: AppDimensions.navBarHeight.h,
            decoration: BoxDecoration(
              gradient: AppGradients.navBarBackgroundGradient,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildNavItem(
                  context,
                  0,
                  AppStrings.home,
                  AppIcons.home,
                  AppIcons.homeFill,
                ),
                _buildNavItem(
                  context,
                  1,
                  AppStrings.profile,
                  AppIcons.profile,
                  AppIcons.profileFill,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(
    BuildContext context,
    int index,
    String label,
    String inactiveIconPath, 
    String activeIconPath, 
  ) {
    final bool isActive = navigationShell.currentIndex == index;
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: AppDimensions.navItemHorizontalMargin.w,
        vertical: AppDimensions.navItemVerticalMargin.h,
      ),
      child: GradientButton(
        onPressed: () => _goBranch(index),
        text: label,
        inactiveIconPath: inactiveIconPath,
        activeIconPath: activeIconPath,
        isActive: isActive,
      ),
    );
  }
}
