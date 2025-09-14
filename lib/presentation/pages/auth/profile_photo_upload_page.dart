import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shartflix/core/services/local_storage_service.dart';
import 'package:shartflix/di.dart';
import 'package:shartflix/application/usecases/auth/auth_bloc.dart'; // Use AuthBloc
import 'package:shartflix/application/usecases/auth/auth_event.dart'; // Import AuthEvent
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
  }

  Future<void> _navigateToHome() async {
    sl<LocalStorageService>().setIsNewUser(false);
    context.go(HomePage.routeName);
    // No need to fetch user profile here, AuthBloc will handle it
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthError) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        } else if (state is AuthAuthenticated) {
          // If authenticated after photo upload, navigate to home
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
                            context.read<AuthBloc>().add(
                                  AuthUploadUserPhoto(
                                      imagePath: _selectedImage!.path),
                                );
                          }
                        : null,
                    onSkip: () {
                      // If user skips, set photoUrl to null (or a default URL)
                      context.read<AuthBloc>().add(
                            const AuthUpdateUserPhotoUrl(photoUrl: null),
                          );
                      _navigateToHome();
                    },
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
