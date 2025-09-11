import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shartflix/core/constants/app_colors.dart';
import 'package:shartflix/core/constants/app_text_styles.dart';
import 'package:flutter_svg/flutter_svg.dart'; // Import flutter_svg

class CustomTextInput extends StatefulWidget {
  final String labelText;
  final String? iconPath;
  final bool isPassword;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final String? errorText;

  const CustomTextInput({
    super.key,
    required this.labelText,
    this.iconPath,
    this.isPassword = false,
    this.controller,
    this.validator,
    this.errorText,
  });

  @override
  State<CustomTextInput> createState() => _CustomTextInputState();
}

class _CustomTextInputState extends State<CustomTextInput> {
  late bool _obscureText;
  late FocusNode _focusNode;
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isPassword;
    _focusNode = FocusNode();
    _focusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChange);
    _focusNode.dispose();
    super.dispose();
  }

  void _onFocusChange() {
    setState(() {
      _isFocused = _focusNode.hasFocus;
    });
  }

  void _toggleObscureText() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    Color borderColor = AppColors.white20;
    if (_isFocused) {
      borderColor = AppColors.primary;
    }
    if (widget.errorText != null && widget.errorText!.isNotEmpty) {
      borderColor = AppColors.error;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 56.h,
          width: 354.w,
          padding: EdgeInsets.fromLTRB(20.w, 16.h, 20.w, 16.h),
          decoration: BoxDecoration(
            color: AppColors.white05,
            borderRadius: BorderRadius.circular(18.r),
            border: Border.all(color: borderColor, width: 1.w),
          ),
          child: Row(
            children: [
              if (widget.iconPath != null)
                Padding(
                  padding: EdgeInsets.only(
                    right: 10.w,
                  ), // Gap between icon and text field
                  child: SvgPicture.asset(
                    widget.iconPath!,
                    width: 24.w,
                    height: 24.h,
                    colorFilter: const ColorFilter.mode(
                      AppColors.white,
                      BlendMode.srcIn,
                    ), // Apply color filter
                  ),
                ),
              Expanded(
                child: TextField(
                  controller: widget.controller,
                  focusNode: _focusNode,
                  obscureText: _obscureText,
                  decoration: InputDecoration(
                    labelText: widget.labelText,
                    border: InputBorder.none, // Remove default TextField border
                    labelStyle: AppTextStyles.bodyNormalRegular.copyWith(
                      color: AppColors.white50,
                      height: 1.h,
                    ),
                    isDense: true, // Reduce vertical space
                    contentPadding:
                        EdgeInsets.zero, // Remove default content padding
                    suffixIcon: widget.isPassword
                        ? GestureDetector(
                            onTap: _toggleObscureText,
                            child: SvgPicture.asset(
                              _obscureText
                                  ? 'assets/icon/Hide.svg'
                                  : 'assets/icon/See.svg',
                              width: 24.w,
                              height: 24.h,
                              colorFilter: const ColorFilter.mode(
                                AppColors.white30,
                                BlendMode.srcIn,
                              ), // Apply color filter
                            ),
                          )
                        : null,
                    suffixIconConstraints: BoxConstraints.tight(Size(24.w, 24.h)),
                  ),
                  style: AppTextStyles.bodyNormalRegular.copyWith(
                    color: AppColors.white,
                    height: 1.h,
                  ),
                ),
              ),
            ],
          ),
        ),
        if (widget.errorText != null && widget.errorText!.isNotEmpty)
          Padding(
            padding: EdgeInsets.only(left: 20.w, top: 4.h),
            child: Text(
              widget.errorText!,
              style: AppTextStyles.bodySmallRegular.copyWith(color: AppColors.error),
            ),
          ),
      ],
    );
  }
}
