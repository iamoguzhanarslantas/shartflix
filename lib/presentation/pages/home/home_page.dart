import 'package:flutter/material.dart';
import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shartflix/core/constants/app_colors.dart';
import 'package:shartflix/core/constants/app_text_styles.dart';
import 'package:shartflix/domain/entities/movie_entity.dart'; // Import MovieEntity
import 'package:shartflix/di.dart';
import 'package:shartflix/core/errors/failures.dart'; // Import Failure types
import 'package:shartflix/presentation/cubits/favorite_movie/favorite_movie_cubit.dart';
import 'package:shartflix/presentation/cubits/movie/movie_cubit.dart';
import 'package:shartflix/presentation/widgets/movie/movie_card.dart'; // Import MovieCard

class HomePage extends StatelessWidget {
  static const routeName = '/home';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          sl<MovieCubit>()..fetchAllMovies(), // Changed to fetchAllMovies
      child: Scaffold(
        backgroundColor: AppColors.black,
        body: BlocBuilder<MovieCubit, MovieState>(
          builder: (context, state) {
            if (state is MovieLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is MovieLoaded) {
              return RefreshIndicator(
                onRefresh: () async {
                  await context
                      .read<MovieCubit>()
                      .fetchAllMovies(); // Changed to fetchAllMovies
                },
                child: PageView.builder(
                  scrollDirection:
                      Axis.vertical, // Added for vertical scrolling
                  itemCount: state.movieResponse.movies.length,
                  itemBuilder: (context, index) {
                    final MovieEntity movie = state.movieResponse.movies[index];
                    if (index + 1 < state.movieResponse.movies.length) {
                      final imageUrl =
                          state.movieResponse.movies[index + 1].images!.last;
                      precacheImage(
                        NetworkImage(imageUrl),
                        context,
                        onError: (exception, stackTrace) {
                          log(
                            'Network Image Load Exception: Image precaching failed for: $imageUrl. \n Error: $exception',
                            error: exception,
                            stackTrace: stackTrace,
                            name: 'HomePage',
                          );
                        },
                      );
                    }
                    return MovieCard(
                      movie: movie,
                      onFavoriteToggle: () async {
                        await context.read<MovieCubit>().toggleFavorite(
                          movie.id!,
                        );
                        if (context.mounted) {
                          context
                              .read<FavoriteMovieCubit>()
                              .fetchFavoriteMovies();
                        }
                      },
                    );
                  },
                ),
              );
            } else if (state is MovieError) {
              String errorMessage = 'Bir hata oluştu.';
              if (state.failure is NetworkFailure) {
                errorMessage =
                    'İnternet bağlantısı yok. Lütfen bağlantınızı kontrol edin.';
              } else if (state.failure is ServerFailure) {
                errorMessage = 'Sunucu hatası: ${state.failure.message}';
              } else if (state.failure is CacheFailure) {
                errorMessage =
                    'Veri yüklenirken hata oluştu: ${state.failure.message}';
              } else if (state.failure is UnknownFailure) {
                errorMessage =
                    'Beklenmedik bir hata oluştu: ${state.failure.message}';
              }

              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      errorMessage,
                      textAlign: TextAlign.center,
                      style: AppTextStyles.bodyNormalSemiBold.copyWith(
                        color: AppColors.primary,
                      ),
                    ),
                    SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        context.read<MovieCubit>().fetchAllMovies();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        foregroundColor: AppColors.white,
                      ),
                      child: Text('Yeniden Dene'),
                    ),
                  ],
                ),
              );
            }
            return const Center(child: SizedBox());
          },
        ),
      ),
    );
  }
}
