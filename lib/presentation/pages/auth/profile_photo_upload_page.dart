import 'dart:io';

import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
