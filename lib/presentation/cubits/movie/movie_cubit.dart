import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart'; // Import for debugPrint
import 'package:shartflix/data/models/movie_list_response_model.dart';
import 'package:shartflix/data/models/movie_model.dart';
import 'package:shartflix/domain/usecases/movie/favorite_unfavorite_movie.dart';
import 'package:shartflix/domain/usecases/movie/get_favorite_movie_list.dart';
import 'package:shartflix/domain/usecases/movie/get_movie_list.dart';

part 'movie_state.dart';

class MovieCubit extends Cubit<MovieState> {
  final GetMovieList _getMovieList;
  final GetFavoriteMovieList _getFavoriteMovieList;
  final FavoriteUnfavoriteMovie _favoriteUnfavoriteMovie;

  MovieCubit({
    required GetMovieList getMovieList,
    required GetFavoriteMovieList getFavoriteMovieList,
    required FavoriteUnfavoriteMovie favoriteUnfavoriteMovie,
  })  : _getMovieList = getMovieList,
        _getFavoriteMovieList = getFavoriteMovieList,
        _favoriteUnfavoriteMovie = favoriteUnfavoriteMovie,
        super(MovieInitial());

  Future<void> fetchAllMovies() async {
    emit(MovieLoading());
    try {
      final allMovies = await _getMovieList.callGetAllMovies();
      // Wrap the list of all movies in a MovieListResponseModel for consistency
      emit(MovieLoaded(MovieListResponseModel(movies: allMovies, totalPages: 1, currentPage: 0)));
    } catch (e) {
      emit(MovieError(e.toString()));
    }
  }

  Future<void> fetchMovieList() async {
    emit(MovieLoading());
    try {
      final movieResponse = await _getMovieList();
      emit(MovieLoaded(movieResponse));
    } catch (e) {
      emit(MovieError(e.toString()));
    }
  }

  Future<void> fetchFavoriteMovieList() async {
    emit(MovieLoading());
    try {
      final movies = await _getFavoriteMovieList();
      // For favorite list, we still expect a List<MovieModel>, so we wrap it in a MovieListResponseModel
      emit(MovieLoaded(MovieListResponseModel(movies: movies, totalPages: 1, currentPage: 0)));
      debugPrint('Favorite movie list: ${movies.map((e) => e.toJson()).toList()}'); // Added for requested output
    } catch (e) {
      emit(MovieError(e.toString()));
    }
  }

  Future<void> toggleFavorite(String movieId) async {
    if (state is! MovieLoaded) return;

    final currentMovies = (state as MovieLoaded).movieResponse.movies;
    final movieIndex = currentMovies.indexWhere((movie) => movie.id == movieId);

    if (movieIndex == -1) return; // Movie not found in the current list

    final updatedMovies = List<MovieModel>.from(currentMovies);
    final movieToUpdate = updatedMovies[movieIndex];

    // Optimistically update the favorite status
    updatedMovies[movieIndex] = MovieModel(
      id: movieToUpdate.id,
      title: movieToUpdate.title,
      description: movieToUpdate.description,
      posterUrl: movieToUpdate.posterUrl,
      releaseDate: movieToUpdate.releaseDate,
      voteAverage: movieToUpdate.voteAverage,
      isFavorite: !(movieToUpdate.isFavorite ?? false), // Toggle favorite status
    );

    // Emit the optimistically updated list wrapped in MovieListResponseModel
    emit(MovieLoaded(MovieListResponseModel(
      movies: updatedMovies,
      totalPages: (state as MovieLoaded).movieResponse.totalPages,
      currentPage: (state as MovieLoaded).movieResponse.currentPage,
    )));

    try {
      await _favoriteUnfavoriteMovie(movieId);
      // If API call succeeds, the optimistic update is confirmed.
      // No need to re-fetch the entire list.
      debugPrint('Movie action: ${movieToUpdate.isFavorite ?? false ? 'unfavorited' : 'favorited'} movie: ${movieToUpdate.toJson()}');
    } catch (e) {
      // If API call fails, revert the optimistic update
      updatedMovies[movieIndex] = movieToUpdate; // Revert to original state
      emit(MovieLoaded(MovieListResponseModel(
        movies: updatedMovies,
        totalPages: (state as MovieLoaded).movieResponse.totalPages,
        currentPage: (state as MovieLoaded).movieResponse.currentPage,
      ))); // Emit the reverted list
      emit(MovieError(e.toString())); // Also emit an error
    }
  }

  int getTotalPages() {
    if (state is MovieLoaded) {
      return (state as MovieLoaded).movieResponse.totalPages;
    }
    return 0; // Default value if not loaded
  }

  int getCurrentPage() {
    if (state is MovieLoaded) {
      return (state as MovieLoaded).movieResponse.currentPage;
    }
    return 0; // Default value if not loaded
  }
}
