import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shartflix/core/services/local_storage_service.dart';
import 'package:shartflix/di.dart';
import 'package:shartflix/data/models/user_model.dart'; // Import UserModel
import 'package:shartflix/presentation/cubits/auth/auth_bloc.dart'; // Use AuthBloc
import 'package:shartflix/presentation/cubits/auth/auth_event.dart'; // Import AuthEvent
import 'package:shartflix/presentation/pages/home/home_page.dart';
import 'package:shartflix/presentation/widgets/common/app_layout.dart';
import 'package:shartflix/presentation/widgets/auth/profile_header_widget.dart';
import 'package:shartflix/presentation/widgets/auth/profile_avatar_widget.dart';
import 'package:shartflix/presentation/widgets/auth/profile_photo_upload_section.dart';
import 'package:shartflix/presentation/widgets/auth/profile_footer_buttons.dart';

class ProfilePhotoUploadPage extends StatefulWidget {
  static const String routeName = '/profile-photo-upload';
  final bool fromProfile;

  const ProfilePhotoUploadPage({super.key, this.fromProfile = false});

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
                                imagePath: _selectedImage!.path,
                              ),
                            );
                          }
                        : null,
                    onSkip: () async {
                      final authBloc = context.read<AuthBloc>();
                      final authState = authBloc.state;

                      if (authState is AuthAuthenticated) {
                        authBloc.add(
                          AuthSkipPhotoUpload(
                            user: UserModel.fromJson(
                              authState.user.toModelJson(),
                            ),
                          ),
                        );

                        // AuthBloc'un AuthAuthenticated state’ini bekle
                        await authBloc.stream.firstWhere(
                          (state) => state is AuthAuthenticated,
                        );

                        if (widget.fromProfile) {
                          if (context.mounted) {
                            Navigator.of(context).pop(); // Profil senaryosu
                          }
                        } else {
                          _navigateToHome(); // Yeni kullanıcı senaryosu
                        }
                      }
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
