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
        leading: BlocBuilder<AuthCubit, AuthState>(
          builder: (context, authState) {
            if (authState is AuthAuthenticated) {
              return IconButton(
                icon: const Icon(Icons.arrow_back, color: AppColors.white),
                onPressed: () {
                  context.pop();
                },
              );
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
        title: Text(
          'Profile',
          style: AppTextStyles.h5.copyWith(color: AppColors.white),
        ),
        backgroundColor: AppColors.black,
        iconTheme: const IconThemeData(color: AppColors.white),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout, color: AppColors.white),
            onPressed: () {
              BlocProvider.of<AuthCubit>(context).logout();
            },
          ),
        ],
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
