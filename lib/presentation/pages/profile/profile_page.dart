import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shartflix/core/constants/app_colors.dart';
import 'package:shartflix/core/constants/app_text_styles.dart';
import 'package:go_router/go_router.dart'; // Import for GoRouter
import 'package:shartflix/domain/entities/user_entity.dart'; // Import UserEntity
import 'package:shartflix/presentation/cubits/auth/auth_cubit.dart';
import 'package:shartflix/presentation/pages/auth/login_page.dart';
import 'package:shartflix/presentation/widgets/profile/profile_info_widget.dart';

class ProfilePage extends StatelessWidget {
  static const routeName = '/profile';
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
          style: AppTextStyles.h5.copyWith(color: AppColors.white),
        ),
        backgroundColor: AppColors.black,
        elevation: 0,
        // leading and actions removed as navigation is handled by BottomNavigationBar
      ),
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthUnauthenticated) {
            context.go(LoginPage.routeName);
          }
        },
        builder: (context, state) {
          if (state is AuthAuthenticated) {
            final UserEntity user = state.user;
            return ProfileInfoWidget(user: user);
          } else if (state is AuthRegistrationSuccess) {
            // Handle AuthRegistrationSuccess
            final UserEntity user = state.user;
            return ProfileInfoWidget(user: user);
          } else if (state is AuthLoading) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return Center(
              child: Text(
                'Please log in to view your profile.',
                style: AppTextStyles.bodyLargeRegular.copyWith(
                  color: AppColors.white,
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
