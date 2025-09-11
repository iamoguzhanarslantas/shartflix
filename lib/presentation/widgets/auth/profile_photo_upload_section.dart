import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shartflix/core/constants/app_colors.dart';
import 'package:shartflix/core/constants/app_text_styles.dart';
import 'package:shartflix/presentation/widgets/common/dashed_border_photo_upload.dart';
import 'package:shartflix/presentation/widgets/common/image_picker_widget.dart';
import 'package:shartflix/presentation/widgets/common/photo_delete_button.dart';

class ProfilePhotoUploadSection extends StatelessWidget {
  final Function(File?) onImageSelected;
  final File? imageFile;

  const ProfilePhotoUploadSection({
    super.key,
    required this.onImageSelected,
    this.imageFile,
  });

  @override
  Widget build(BuildContext context) {
    return ImagePickerWidget(
      builder: (context, selectedImage, onPickImage, onClearImage) {
        // Update the parent's state with the selected image
        if (selectedImage != imageFile) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            onImageSelected(selectedImage);
          });
        }

        return Padding(
          padding: EdgeInsets.only(top: 12.h),
          child: Column(
            children: [
              Text(
                'Fotoğraf Yükle',
                textAlign: TextAlign.center,
                style: AppTextStyles.h4.copyWith(color: AppColors.white),
              ),
              SizedBox(height: 12.h),
              Text(
                'Profil fotoğrafın için görsel \n yükleyebilirsin',
                textAlign: TextAlign.center,
                style: AppTextStyles.bodyNormalRegular.copyWith(
                  color: AppColors.white90,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height < 800 ? 26.h : 52.h,
              ), // Spacing between text and photo upload
              Center(
                child: DashedBorderPhotoUpload(
                  onTap: onPickImage,
                  imageFile: imageFile,
                ),
              ),
              PhotoDeleteButton(
                onTap: onClearImage,
                isVisible: imageFile != null,
              ),
            ],
          ),
        );
      },
    );
  }
}
