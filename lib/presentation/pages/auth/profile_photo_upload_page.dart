import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shartflix/core/services/local_storage_service.dart';
import 'package:shartflix/di.dart';
import 'package:shartflix/presentation/cubits/auth/auth_cubit.dart';
import 'package:shartflix/presentation/pages/home/home_page.dart';
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

  Future<void> _navigateToHome() async {
    sl<LocalStorageService>().setIsNewUser(false);
    context.go(HomePage.routeName);
    await _fetchUserProfile(); // Navigate back to home page
  }

  Future<void> _fetchUserProfile() async {
    await context.read<AuthCubit>().getUserProfile();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthError) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        }
        // Navigation to home is now handled by _navigateToHome() called from onContinue/onSkip
        // and not directly from AuthAuthenticated state to prevent immediate redirection
        // after initial token check.
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
                        ? () async {
                            // Made async
                            debugPrint(
                              'Attempting to upload photo: ${_selectedImage!.path}',
                            ); // Debug print
                            // Call uploadUserPhoto and then navigate on success
                            await context.read<AuthCubit>().uploadUserPhoto(
                              _selectedImage!.path,
                            );
                            // After successful upload (AuthCubit will emit AuthAuthenticated), navigate to home
                            _navigateToHome();
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
    );
  }
}
