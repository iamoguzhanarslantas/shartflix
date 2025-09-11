import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
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

  Future<void> fetchMovieList() async {
    emit(MovieLoading());
    try {
      final movies = await _getMovieList();
      emit(MovieLoaded(movies));
    } catch (e) {
      emit(MovieError(e.toString()));
    }
  }

  Future<void> fetchFavoriteMovieList() async {
    emit(MovieLoading());
    try {
      final movies = await _getFavoriteMovieList();
      emit(MovieLoaded(movies));
    } catch (e) {
      emit(MovieError(e.toString()));
    }
  }

  Future<void> toggleFavorite(String movieId) async {
    if (state is! MovieLoaded) return;

    final currentMovies = (state as MovieLoaded).movies;
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

    emit(MovieLoaded(updatedMovies)); // Emit the optimistically updated list

    try {
      await _favoriteUnfavoriteMovie(movieId);
      // If API call succeeds, the optimistic update is confirmed.
      // No need to re-fetch the entire list.
    } catch (e) {
      // If API call fails, revert the optimistic update
      updatedMovies[movieIndex] = movieToUpdate; // Revert to original state
      emit(MovieLoaded(updatedMovies)); // Emit the reverted list
      emit(MovieError(e.toString())); // Also emit an error
    }
  }
}
