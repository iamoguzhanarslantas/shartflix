import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shartflix/core/constants/app_colors.dart';
import 'package:shartflix/data/entities/movie_entity.dart';
import 'package:shartflix/presentation/cubits/favorite_movie/favorite_movie_cubit.dart';
import 'package:shartflix/presentation/cubits/movie/movie_cubit.dart';
import 'package:shartflix/presentation/widgets/movie/movie_cache.dart';
import 'package:shartflix/presentation/widgets/movie/movie_fetch_widget.dart';
import 'package:shartflix/presentation/widgets/movie/movie_card.dart';
import 'package:shartflix/di.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/home';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = MovieCache(context);
    return BlocProvider(
      create: (context) => sl<MovieCubit>()..fetchAllMovies(),
      child: Scaffold(
        backgroundColor: AppColors.black,
        body: BlocBuilder<MovieCubit, MovieState>(
          builder: (context, state) {
            if (state is MovieLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is MovieLoaded) {
              return RefreshIndicator(
                onRefresh: () async =>
                    await context.read<MovieCubit>().fetchAllMovies(),
                child: PageView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: state.movieResponse.movies.length,
                  itemBuilder: (context, index) {
                    final MovieEntity movie = state.movieResponse.movies[index];
                    if (index + 1 < state.movieResponse.movies.length) {
                      final nextImageUrl =
                          state.movieResponse.movies[index + 1].images!.last;
                      controller.precacheNextImage(nextImageUrl);
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
              return MovieFetchWidget(failure: state.failure);
            }
            return const Center(child: SizedBox());
          },
        ),
      ),
    );
  }
}
