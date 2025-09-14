import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shartflix/core/constants/app_colors.dart';
import 'package:shartflix/core/constants/app_dimensions.dart';
import 'package:shartflix/core/constants/app_text_styles.dart';
import 'package:shartflix/data/entities/movie_entity.dart';

class LikedMovieCard extends StatelessWidget {
  final MovieEntity movie;

  const LikedMovieCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // Changed from Container to SizedBox
      width: AppDimensions.likedMovieCardWidth.w,
      height: AppDimensions.likedMovieCardHeight.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Movie Image
          ClipRRect(
            borderRadius: BorderRadius.circular(
              AppDimensions.likedMovieCardImageBorderRadius.r,
            ),
            child: movie.images != null && movie.images!.isNotEmpty
                ? Image.network(
                    movie.images!.last,
                    fit: BoxFit.cover,
                    width: AppDimensions.likedMovieCardWidth.w,
                    height: AppDimensions.likedMovieCardImageHeight.h,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) {
                        return child;
                      }
                      return SizedBox(
                        width: AppDimensions.likedMovieCardWidth.w,
                        height: AppDimensions.likedMovieCardImageHeight.h,
                        child: Center(
                          child: CircularProgressIndicator(
                            value: loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded /
                                      loadingProgress.expectedTotalBytes!
                                : null,
                            color: AppColors.white,
                          ),
                        ),
                      );
                    },
                    errorBuilder: (context, error, stackTrace) {
                      return SizedBox(
                        width: AppDimensions.likedMovieCardWidth.w,
                        height: AppDimensions.likedMovieCardImageHeight.h,
                        child: Center(
                          child: Icon(Icons.movie, color: AppColors.white50),
                        ),
                      );
                    },
                  )
                : SizedBox(
                    width: AppDimensions.likedMovieCardWidth.w,
                    height: AppDimensions.likedMovieCardImageHeight.h,
                    child: Center(
                      child: Icon(Icons.movie, color: AppColors.white50),
                    ),
                  ),
          ),
          SizedBox(height: AppDimensions.likedMovieCardImageTextGap.h),
          // Movie Title
          SizedBox(
            height: AppDimensions.likedMovieTitleHeight.h,
            child: Text(
              movie.title ?? 'No Title',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.bodyNormalSemiBold.copyWith(
                color: AppColors.white,
                fontSize: AppDimensions.likedMovieTitleFontSize.sp,
              ),
            ),
          ),
          SizedBox(height: AppDimensions.likedMovieIdTextGap.h),
          // Movie ID (or Release Date, using ID for now as per request)
          SizedBox(
            height: AppDimensions.likedMovieIdHeight.h,
            child: Text(
              movie.id?.substring(0, 5) ??
                  'N/A', // Using ID as per request, could be releaseDate
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.bodyNormalRegular.copyWith(
                color: AppColors.white50, // 50% white
                fontSize: AppDimensions.likedMovieIdFontSize.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
