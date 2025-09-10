import 'package:flutter/material.dart';
import 'package:shartflix/presentation/widgets/common/app_layout.dart';
import 'package:shartflix/presentation/pages/profile/widgets/profile_header_widget.dart';
import 'package:shartflix/presentation/pages/profile/widgets/profile_avatar_widget.dart';
import 'package:shartflix/presentation/pages/profile/widgets/profile_photo_upload_section.dart';
import 'package:shartflix/presentation/pages/profile/widgets/profile_footer_buttons.dart';

class ProfilePhotoUploadPage extends StatelessWidget {
  static const String routeName = '/profile-photo-upload';

  const ProfilePhotoUploadPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: AppLayout(
          child: Stack(
            children: const [
              ProfileHeaderWidget(),
              ProfileAvatarWidget(),
              ProfilePhotoUploadSection(),
              ProfileFooterButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
