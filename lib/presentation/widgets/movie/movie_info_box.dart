import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shartflix/core/constants/app_colors.dart';
import 'package:shartflix/core/constants/app_text_styles.dart';
import 'package:flutter_svg/flutter_svg.dart'; 

class MovieInfoBox extends StatefulWidget {
  final String movieTitle;
  final String movieDescription;
  final String iconPath; 
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
        color: Colors.transparent, 
        child: Row(
          children: [
            
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
                  width: 20.w, 
                  height: 17.h, 
                ),
              ),
            ),
            SizedBox(width: 16.w), 
            
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
                          : 2, 
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
                                  50) 
                            TextSpan(
                              text: ' Devamı Oku', 
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
                          if (_isExpanded) 
                            TextSpan(
                              text: ' Daha Az Oku', 
                              style: AppTextStyles.bodyNormalSemiBold.copyWith(
                                color: AppColors.white,
                                height: 1.0, 
                                letterSpacing: 0.0, 
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

            
          ],
        ),
      ),
    );
  }
}
