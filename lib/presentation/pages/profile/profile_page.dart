import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shartflix/core/constants/app_colors.dart';
import 'package:shartflix/core/constants/app_text_styles.dart';
import 'package:go_router/go_router.dart';
import 'package:shartflix/domain/entities/user_entity.dart';
import 'package:shartflix/application/usecases/auth/auth_bloc.dart'; // Use AuthBloc
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
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthUnauthenticated) {
            context.go(LoginPage.routeName);
          }
        },
        builder: (context, state) {
          if (state is AuthAuthenticated) {
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
