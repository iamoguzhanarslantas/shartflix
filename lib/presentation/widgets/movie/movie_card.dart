import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/foundation.dart'; // For kIsWeb
import 'package:shartflix/core/constants/app_colors.dart';
import 'package:shartflix/core/constants/app_icons.dart';
import 'package:shartflix/domain/entities/movie_entity.dart';
import 'package:shartflix/presentation/widgets/common/favorite_button_with_blur.dart';
import 'package:shartflix/presentation/widgets/movie/movie_info_box.dart'; // Import MovieEntity

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
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Card(
          child: Stack(
            children: [
              movie.images != null && movie.images!.isNotEmpty
                  ? Image.network(
                      movie.images!.first,
                      width: 80.w,
                      height: 120.h,
                      fit: BoxFit.cover,
                      headers: kIsWeb ? const {} : const {},
                      errorBuilder: (context, error, stackTrace) {
                        // Suppress console errors for image loading, as UI handles it with a placeholder
                        return Container(
                          width: 80.w,
                          height: 120.h,
                          color: AppColors.white20,
                          child: Icon(
                            Icons.movie,
                            color: AppColors.white50,
                            size: 40.w,
                          ),
                        );
                      },
                    )
                  : Container(
                      width: 80.w,
                      height: 120.h,
                      color: AppColors.white20,
                      child: Icon(
                        Icons.movie,
                        color: AppColors.white50,
                        size: 40.w,
                      ),
                    ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  FavoriteButtonWithBlur(
                    isFavorite: movie.isFavorite ?? false,
                    onFavoriteToggle: onFavoriteToggle,
                  ),
                  MovieInfoBox(
                    movieTitle: movie.title ?? 'No Title', // Placeholder
                    movieDescription:
                        movie.description ?? 'No Description', // Placeholder
                    iconPath: AppIcons.iconNoBackground,
                    isFavorite: movie.isFavorite ?? false,
                    onFavoriteToggle: onFavoriteToggle,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
