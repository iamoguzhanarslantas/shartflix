import 'package:flutter/material.dart';
import 'package:shartflix/core/constants/app_text_styles.dart';
import 'package:sizer/sizer.dart';
import 'package:shartflix/core/utils/responsive_helper.dart'; // Import the new helper

class CustomTextInput extends StatefulWidget {
  final String labelText;
  final String? iconPath;
  final bool isPassword;
  final TextEditingController? controller;

  const CustomTextInput({
    super.key,
    required this.labelText,
    this.iconPath,
    this.isPassword = false,
    this.controller,
  });

  @override
  State<CustomTextInput> createState() => _CustomTextInputState();
}

class _CustomTextInputState extends State<CustomTextInput> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isPassword;
  }

  void _toggleObscureText() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.isSmallScreenHeight
          ? 88.w
          : 88.w, // Responsive width using Sizer
      child: Container(
        height: context.isSmallScreenHeight
            ? 7.h
            : 7.h, // Consistent height with buttons
        padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: context.isSmallScreenHeight ? 2.h : 2.25.h,
        ), // Responsive vertical padding
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: Colors.white, width: 1),
        ),
        child: Row(
          children: [
            if (widget.iconPath != null)
              Padding(
                padding: const EdgeInsets.only(
                  right: 10.0,
                ), // Gap between icon and text field
                child: Image.asset(
                  widget.iconPath!,
                  width: 4.5.w, // Responsive width using Sizer
                  height: 4.h, // Responsive height using Sizer
                ),
              ),
            Expanded(
              child: TextField(
                controller: widget.controller,
                obscureText: _obscureText,
                decoration: InputDecoration(
                  labelText: widget.labelText,
                  border: InputBorder.none, // Remove default TextField border
                  labelStyle: AppTextStyles.bodyNormalRegular.copyWith(
                    color: Colors.white,
                  ),
                  isDense: true, // Reduce vertical space
                  contentPadding:
                      EdgeInsets.zero, // Remove default content padding
                  suffixIcon: widget.isPassword
                      ? GestureDetector(
                          onTap: _toggleObscureText,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(
                              2,
                              3,
                              0,
                              0,
                            ), // Adjust icon position
                            child: Image.asset(
                              _obscureText
                                  ? 'assets/icon/hide.png'
                                  : 'assets/icon/see.png',
                              width: 5.w, // Responsive width using Sizer
                              height: 4.5.h, // Responsive height using Sizer
                            ),
                          ),
                        )
                      : null,
                  suffixIconConstraints: BoxConstraints.tight(
                    Size(7.5.w, 6.h), // Responsive suffix icon size using Sizer
                  ),
                ),
                style: AppTextStyles.bodyNormalRegular.copyWith(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
