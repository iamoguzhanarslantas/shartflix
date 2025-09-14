import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shartflix/core/constants/app_colors.dart';
import 'package:shartflix/core/constants/app_icons.dart';
import 'package:shartflix/data/entities/movie_entity.dart';
import 'package:shartflix/presentation/widgets/common/favorite_button_with_blur.dart';
import 'package:shartflix/presentation/widgets/movie/movie_info_box.dart';

class MovieCard extends StatelessWidget {
  final MovieEntity movie;
  final VoidCallback onFavoriteToggle;

  const MovieCard({
    super.key,
    required this.movie,
    required this.onFavoriteToggle,
  });

  @override
  Widget build(BuildContext context) {
    final double navbarHeight = 100.h;
    return Stack(
      children: [
        movie.images != null && movie.images!.isNotEmpty
            ? Positioned.fill(
                child: Image.network(
                  movie.images!.last,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: AppColors.white20,
                      child: Center(
                        child: Icon(Icons.movie, color: AppColors.white50),
                      ),
                    );
                  },
                ),
              )
            : Positioned.fill(
                child: Container(
                  color: AppColors.white20,
                  child: Center(
                    child: Icon(Icons.movie, color: AppColors.white50),
                  ),
                ),
              ),
        Positioned(
          bottom: navbarHeight,
          left: 16.w,
          right: 16.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FavoriteButtonWithBlur(
                isFavorite: movie.isFavorite ?? false,
                onFavoriteToggle: onFavoriteToggle,
              ),
              SizedBox(height: 4.h),
              MovieInfoBox(
                movieTitle: movie.title ?? 'No Title',
                movieDescription: movie.description ?? 'No Description',
                iconPath: AppIcons.iconNoBackground,
                isFavorite: movie.isFavorite ?? false,
                onFavoriteToggle: onFavoriteToggle,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
