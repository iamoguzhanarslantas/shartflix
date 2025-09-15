import 'package:flutter/material.dart';
import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shartflix/data/entities/movie_entity.dart';
import 'package:shartflix/presentation/cubits/favorite_movie/favorite_movie_cubit.dart';
import 'package:shartflix/presentation/cubits/movie/movie_cubit.dart';

class MovieCacheAndFavorite {
  final BuildContext context;

  MovieCacheAndFavorite(this.context);

  Future<void> precacheNextImage(String imageUrl) async {
    if (imageUrl.isEmpty) return;

    try {
      await precacheImage(
        NetworkImage(imageUrl),
        context,
        onError: (exception, stackTrace) {
          if (exception.toString().contains('404')) {
            log('Image not found (404) for: $imageUrl', name: 'HomePage');
          } else {
            log(
              'Network Image Load Exception for: $imageUrl\nError: $exception',
              error: exception,
              stackTrace: stackTrace,
              name: 'HomePage',
            );
          }
        },
      );
    } catch (e, st) {
      log(
        'Precache image failed for: $imageUrl\nError: $e',
        error: e,
        stackTrace: st,
        name: 'HomePage',
      );
    }
  }

  Future<void> toggleFavorite(MovieEntity movie) async {
    await context.read<MovieCubit>().toggleFavorite(movie.id!);
    if (context.mounted) {
      context.read<FavoriteMovieCubit>().fetchFavoriteMovies();
    }
  }
}
