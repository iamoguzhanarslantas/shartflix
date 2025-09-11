import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shartflix/core/constants/app_colors.dart';
import 'package:shartflix/core/constants/app_text_styles.dart';
import 'package:shartflix/data/models/movie_model.dart';

class MovieCard extends StatelessWidget {
  final MovieModel movie;
  final VoidCallback onFavoriteToggle;

  const MovieCard({
    super.key,
    required this.movie,
    required this.onFavoriteToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      color: AppColors.white10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Padding(
        padding: EdgeInsets.all(12.w),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Movie Poster (Avatar)
            ClipRRect(
              borderRadius: BorderRadius.circular(8.r),
              child: movie.posterUrl != null && movie.posterUrl!.isNotEmpty
                  ? Image.network(
                      movie.posterUrl!,
                      width: 80.w,
                      height: 120.h,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Container(
                        width: 80.w,
                        height: 120.h,
                        color: AppColors.white20,
                        child: Icon(Icons.movie, color: AppColors.white50, size: 40.w),
                      ),
                    )
                  : Container(
                      width: 80.w,
                      height: 120.h,
                      color: AppColors.white20,
                      child: Icon(Icons.movie, color: AppColors.white50, size: 40.w),
                    ),
            ),
            SizedBox(width: 12.w),
            // Movie Details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movie.title ?? 'No Title',
                    style: AppTextStyles.bodyLargeSemiBold.copyWith(color: AppColors.white),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    movie.description ?? 'No Description',
                    style: AppTextStyles.bodySmallRegular.copyWith(color: AppColors.white60),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 8.h),
                  Row(
                    children: [
                      Icon(Icons.star, color: AppColors.warning, size: 16.w),
                      SizedBox(width: 4.w),
                      Text(
                        (movie.voteAverage ?? 0.0).toStringAsFixed(1),
                        style: AppTextStyles.bodyNormalRegular.copyWith(color: AppColors.white),
                      ),
                      SizedBox(width: 12.w),
                      Icon(Icons.calendar_today, color: AppColors.white50, size: 16.w),
                      SizedBox(width: 4.w),
                      Text(
                        movie.releaseDate ?? 'N/A',
                        style: AppTextStyles.bodyNormalRegular.copyWith(color: AppColors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Favorite Button
            IconButton(
              icon: Icon(
                movie.isFavorite == true ? Icons.favorite : Icons.favorite_border,
                color: movie.isFavorite == true ? AppColors.primary : AppColors.white,
              ),
              onPressed: onFavoriteToggle,
            ),
          ],
        ),
      ),
    );
  }
}
