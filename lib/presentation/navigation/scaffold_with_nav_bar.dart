import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shartflix/core/constants/app_gradients.dart';
import 'package:shartflix/core/constants/app_icons.dart';
import 'package:shartflix/presentation/widgets/common/gradient_button.dart';
import 'package:shartflix/presentation/widgets/movie/movie_info_box.dart';

class ScaffoldWithNavBar extends StatelessWidget {
  const ScaffoldWithNavBar({required this.navigationShell, Key? key})
    : super(key: key ?? const ValueKey('ScaffoldWithNavBar'));

  final StatefulNavigationShell navigationShell;

  void _goBranch(int index) {
    navigationShell.goBranch(
      index,
      // A common pattern when using bottom navigation bars is to ensure the
      // user returns to the top of a branch when tapping an already selected
      // tab. This is done by setting `popToRootEnabled` to true for all
      // branches, but only doing it if a new tab is selected.
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(child: navigationShell),
          MovieInfoBox(
            movieTitle: 'The Movie Title', // Placeholder
            movieDescription:
                'A brief description of the movie.', // Placeholder
            iconPath: AppIcons.gem, // Example icon
          ),
        ],
      ),
      bottomNavigationBar: Container(
        width: 402.w, // Apply specified width
        height: 100.h, // Apply specified height
        // Apply specified padding
        decoration: BoxDecoration(
          gradient: AppGradients.navBarBackgroundGradient, // Apply new gradient
          // The border on top is now part of the gradient effect, or can be added as a separate border if needed
          // For now, I'll remove the explicit top border as the gradient handles the transition.
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildNavItem(context, 0, 'Home', AppIcons.home, AppIcons.homeFill),
            _buildNavItem(
              context,
              1,
              'Profile',
              AppIcons.profile,
              AppIcons.profileFill,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(
    BuildContext context,
    int index,
    String label,
    String inactiveIconPath, // Changed to String path
    String activeIconPath, // Changed to String path
  ) {
    final bool isActive = navigationShell.currentIndex == index;
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 8.w,
        vertical: 8.h,
      ), // Margin for the button
      child: GradientButton(
        onPressed: () => _goBranch(index),
        text: label,
        inactiveIconPath: inactiveIconPath, // Changed to path
        activeIconPath: activeIconPath, // Changed to path
        isActive: isActive,
      ),
    );
  }
}
