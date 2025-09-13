import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shartflix/domain/entities/movie_entity.dart';
import 'package:shartflix/domain/entities/movie_response_entity.dart';
import 'package:shartflix/application/usecases/movie/favorite_unfavorite_movie.dart';
import 'package:shartflix/application/usecases/movie/get_favorite_movie_list.dart';
import 'package:shartflix/application/usecases/movie/get_movie_list.dart';

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
      // Wrap the list of all movies in a MovieResponseEntity for consistency
      emit(MovieLoaded(MovieResponseEntity(movies: allMovies, totalPages: 1, currentPage: 0)));
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
      // For favorite list, we wrap it in a MovieResponseEntity
      emit(MovieLoaded(MovieResponseEntity(movies: movies, totalPages: 1, currentPage: 0)));
    } catch (e) {
      emit(MovieError(e.toString()));
    }
  }

  Future<void> toggleFavorite(String movieId) async {
    if (state is! MovieLoaded) return;

    final currentMovies = (state as MovieLoaded).movieResponse.movies;
    final movieIndex = currentMovies.indexWhere((movie) => movie.id == movieId);

    if (movieIndex == -1) return; // Movie not found in the current list

    final updatedMovies = List<MovieEntity>.from(currentMovies);
    final movieToUpdate = updatedMovies[movieIndex];

    // Optimistically update the favorite status
    updatedMovies[movieIndex] = MovieEntity(
      id: movieToUpdate.id,
      title: movieToUpdate.title,
      description: movieToUpdate.description,
      images: movieToUpdate.images,
      releaseDate: movieToUpdate.releaseDate,
      voteAverage: movieToUpdate.voteAverage,
      isFavorite: !(movieToUpdate.isFavorite ?? false), // Toggle favorite status
    );

    // Emit the optimistically updated list wrapped in MovieResponseEntity
    emit(MovieLoaded(MovieResponseEntity(
      movies: updatedMovies,
      totalPages: (state as MovieLoaded).movieResponse.totalPages,
      currentPage: (state as MovieLoaded).movieResponse.currentPage,
    )));

    try {
      await _favoriteUnfavoriteMovie(movieId);
      // If API call succeeds, the optimistic update is confirmed.
      // No need to re-fetch the entire list.
    } catch (e) {
      // If API call fails, revert the optimistic update
      updatedMovies[movieIndex] = movieToUpdate; // Revert to original state
      emit(MovieLoaded(MovieResponseEntity(
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
