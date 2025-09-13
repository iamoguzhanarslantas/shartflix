import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shartflix/core/constants/app_colors.dart';
import 'package:shartflix/core/constants/app_text_styles.dart';
import 'package:flutter_svg/flutter_svg.dart'; // For SVG icons

class MovieInfoBox extends StatefulWidget {
  final String movieTitle;
  final String movieDescription;
  final String iconPath; // Path to the icon
  final bool isFavorite;
  final VoidCallback onFavoriteToggle;

  const MovieInfoBox({
    super.key,
    required this.movieTitle,
    required this.movieDescription,
    required this.iconPath,
    required this.isFavorite,
    required this.onFavoriteToggle,
  });

  @override
  State<MovieInfoBox> createState() => _MovieInfoBoxState();
}

class _MovieInfoBoxState extends State<MovieInfoBox>
    with SingleTickerProviderStateMixin {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      child: Container(
        width: 402.w,
        height: _isExpanded ? null : 87.h,
        color: Colors.transparent, // Set background to transparent
        padding: EdgeInsets.only(
          top: 16.h,
          right: 24.w,
          bottom: 16.h,
          left: 24.w,
        ),
        child: Row(
          children: [
            // Icon Container
            Container(
              width: 40.w,
              height: 40.h,
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(21.r),
              ),
              child: Center(
                child: SvgPicture.asset(
                  widget.iconPath,
                  colorFilter: ColorFilter.mode(
                    AppColors.white,
                    BlendMode.srcIn,
                  ),
                  width: 20.w, // Updated icon size inside the container
                  height: 17.h, // Updated icon size inside the container
                ),
              ),
            ),
            SizedBox(width: 16.w), // Gap between icon and text
            // Movie Title and Description
            SizedBox(
              width: 278.w,
              height: _isExpanded ? null : 55.h,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 22.h,
                    child: Text(
                      widget.movieTitle,
                      style: AppTextStyles.bodyXLargeBold.copyWith(
                        color: AppColors.white,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  SizedBox(
                    height: _isExpanded ? null : 31.h,
                    child: RichText(
                      maxLines: _isExpanded
                          ? 100
                          : 2, // Show all lines when expanded
                      overflow: TextOverflow.ellipsis,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: _isExpanded
                                ? widget.movieDescription
                                : (widget.movieDescription.length > 50
                                      ? '${widget.movieDescription.substring(0, 50)}...'
                                      : widget.movieDescription),
                            style: AppTextStyles.bodyNormalRegular.copyWith(
                              color: AppColors.white80,
                            ),
                          ),
                          if (!_isExpanded &&
                              widget.movieDescription.length >
                                  50) // Only show "Devamı Oku" if not expanded and description is long
                            TextSpan(
                              text: ' Devamı Oku', // "Read More" part
                              style: AppTextStyles.bodyNormalSemiBold.copyWith(
                                color: AppColors.white,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  setState(() {
                                    _isExpanded = true;
                                  });
                                },
                            ),
                          if (_isExpanded) // Show "Daha Az Oku" if expanded
                            TextSpan(
                              text: ' Daha Az Oku', // "Read Less" part
                              style: AppTextStyles.bodyNormalSemiBold.copyWith(
                                color: AppColors.white,
                                height: 1.0, // 100% line-height
                                letterSpacing: 0.0, // 0% letter-spacing
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  setState(() {
                                    _isExpanded = false;
                                  });
                                },
                            ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Favorite Button
          ],
        ),
      ),
    );
  }
}
