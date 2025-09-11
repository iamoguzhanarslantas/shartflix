import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shartflix/core/constants/app_colors.dart';
import 'package:shartflix/core/constants/app_text_styles.dart';
import 'package:shartflix/data/models/movie_model.dart';
import 'package:shartflix/di.dart';
import 'package:go_router/go_router.dart'; // Import go_router
import 'package:shartflix/presentation/cubits/movie/movie_cubit.dart';
import 'package:shartflix/presentation/animations/login_lottie.dart';
import 'package:shartflix/presentation/pages/profile/profile_page.dart';
import 'package:shartflix/presentation/widgets/movie/movie_card.dart'; // Import MovieCard

class HomePage extends StatelessWidget {
  static const routeName = '/home';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<MovieCubit>()..fetchMovieList(),
      child: Scaffold(
        backgroundColor: AppColors.black,
        appBar: AppBar(
          title: Text(
            'Shartflix',
            style: AppTextStyles.h4.copyWith(color: AppColors.white90),
          ),
          backgroundColor: AppColors.black,
          elevation: 0,
          actions: [
            IconButton(
              icon: const Icon(Icons.person, color: AppColors.white),
              onPressed: () {
                // Navigate to the profile page
                context.go(ProfilePage.routeName);
              },
            ),
          ],
        ),
        body: SafeArea(
          child: BlocBuilder<MovieCubit, MovieState>(
            builder: (context, state) {
              if (state is MovieLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is MovieLoaded) {
                return RefreshIndicator(
                  onRefresh: () async {
                    await context.read<MovieCubit>().fetchMovieList();
                  },
                  child: ListView.builder(
                    itemCount: state.movies.length,
                    itemBuilder: (context, index) {
                      final MovieModel movie = state.movies[index];
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
                      style: AppTextStyles.h2.copyWith(
                        color: AppColors.white90,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
