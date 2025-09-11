import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shartflix/core/constants/app_colors.dart';
import 'package:shartflix/core/constants/app_text_styles.dart';
import 'package:shartflix/data/models/user_model.dart';
import 'package:shartflix/presentation/cubits/auth/auth_cubit.dart';
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
        iconTheme: const IconThemeData(color: AppColors.white),
      ),
      body: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state is AuthAuthenticated) {
            final UserModel user = state.user;
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
