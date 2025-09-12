import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/foundation.dart'; // Import for debugPrint
import 'package:shartflix/core/services/local_storage_service.dart';
import 'package:shartflix/di.dart';
import 'package:shartflix/presentation/cubits/auth/auth_cubit.dart';
import 'package:shartflix/presentation/pages/home/home_page.dart';
import 'package:shartflix/presentation/pages/profile/profile_page.dart'; // Import ProfilePage
import 'package:shartflix/presentation/widgets/common/app_layout.dart';
import 'package:shartflix/presentation/widgets/auth/profile_header_widget.dart';
import 'package:shartflix/presentation/widgets/auth/profile_avatar_widget.dart';
import 'package:shartflix/presentation/widgets/auth/profile_photo_upload_section.dart';
import 'package:shartflix/presentation/widgets/auth/profile_footer_buttons.dart';

class ProfilePhotoUploadPage extends StatefulWidget {
  static const String routeName = '/profile-photo-upload';

  const ProfilePhotoUploadPage({super.key});

  @override
  State<ProfilePhotoUploadPage> createState() => _ProfilePhotoUploadPageState();
}

class _ProfilePhotoUploadPageState extends State<ProfilePhotoUploadPage> {
  File? _selectedImage;

  void _onImageSelected(File? image) {
    setState(() {
      _selectedImage = image;
    });
    debugPrint(
      'Selected image: ${_selectedImage?.path}',
    ); // Added for debugging
  }

  void _navigateToHome() {
    sl<LocalStorageService>().setIsNewUser(false);
    GoRouter.of(context).go(HomePage.routeName); // Navigate back to home page
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<AuthCubit>(),
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthError) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
          } else if (state is AuthAuthenticated) {
            _navigateToHome();
          }
        },
        builder: (context, state) {
          return Scaffold(
            extendBodyBehindAppBar: true,
            body: AppLayout(
              child: Center(
                child: Column(
                  children: [
                    ProfileHeaderWidget(),
                    ProfileAvatarWidget(),
                    ProfilePhotoUploadSection(
                      onImageSelected: _onImageSelected,
                      imageFile: _selectedImage,
                    ),
                    ProfileFooterButtons(
                      imageFile: _selectedImage,
                      onContinue: _selectedImage != null
                          ? () {
                              print(
                                'Attempting to upload photo: ${_selectedImage!.path}',
                              ); // Debug print
                              context.read<AuthCubit>().uploadUserPhoto(
                                _selectedImage!.path,
                              );
                            }
                          : null,
                      onSkip: _navigateToHome,
                      isLoading: state is AuthLoading,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
