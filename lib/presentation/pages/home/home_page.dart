import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shartflix/core/constants/app_colors.dart';
import 'package:shartflix/core/constants/app_text_styles.dart';
import 'package:shartflix/domain/entities/movie_entity.dart'; // Import MovieEntity
import 'package:shartflix/di.dart';
import 'package:shartflix/presentation/cubits/movie/movie_cubit.dart';
import 'package:shartflix/presentation/animations/login_lottie.dart';
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
                child: ListView.builder(
                  itemCount: state.movieResponse.movies.length,
                  itemBuilder: (context, index) {
                    final MovieEntity movie = state.movieResponse.movies[index];
                    return MovieCard(
                      movie: movie,
                      onFavoriteToggle: () {
                        context.read<MovieCubit>().toggleFavorite(movie.id!);
                      },
                    );
                  },
                ),
              );
            } else if (state is MovieError) {
              return Center(
                child: Text(
                  state.message,
                  style: AppTextStyles.bodyNormalSemiBold.copyWith(
                    color: AppColors.primary,
                  ),
                ),
              );
            }
            return Center(
              child: Column(
                children: [
                  LoginLottie(),
                  Text(
                    'Hello World',
                    style: AppTextStyles.h2.copyWith(color: AppColors.white90),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
