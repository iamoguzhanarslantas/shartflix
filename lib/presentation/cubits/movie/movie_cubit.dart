import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shartflix/core/errors/failures.dart';
import 'package:shartflix/data/entities/movie_entity.dart';
import 'package:shartflix/data/entities/movie_response_entity.dart';
import 'package:shartflix/data/usecases/movie/favorite_unfavorite_movie.dart';
import 'package:shartflix/data/usecases/movie/get_favorite_movie_list.dart';
import 'package:shartflix/data/usecases/movie/get_movie_list.dart';

part 'movie_state.dart';

class MovieCubit extends Cubit<MovieState> {
  final GetMovieList _getMovieList;
  final GetFavoriteMovieList _getFavoriteMovieList;
  final FavoriteUnfavoriteMovie _favoriteUnfavoriteMovie;

  MovieCubit({
    required GetMovieList getMovieList,
    required GetFavoriteMovieList getFavoriteMovieList,
    required FavoriteUnfavoriteMovie favoriteUnfavoriteMovie,
  }) : _getMovieList = getMovieList,
       _getFavoriteMovieList = getFavoriteMovieList,
       _favoriteUnfavoriteMovie = favoriteUnfavoriteMovie,
       super(MovieInitial());

  Future<void> fetchAllMovies() async {
    emit(MovieLoading());
    try {
      final allMovies = await _getMovieList.callGetAllMovies();

      emit(
        MovieLoaded(
          MovieResponseEntity(movies: allMovies, totalPages: 1, currentPage: 0),
        ),
      );
    } on Failure catch (e) {
      emit(MovieError(e));
    } catch (e) {
      emit(MovieError(UnknownFailure(e.toString())));
    }
  }

  Future<void> fetchMovieList() async {
    emit(MovieLoading());
    try {
      final movieResponse = await _getMovieList();
      emit(MovieLoaded(movieResponse));
    } on Failure catch (e) {
      emit(MovieError(e));
    } catch (e) {
      emit(MovieError(UnknownFailure(e.toString())));
    }
  }

  Future<void> fetchFavoriteMovieList() async {
    emit(MovieLoading());
    try {
      final movies = await _getFavoriteMovieList();

      final favoriteMovies = movies
          .where((movie) => movie.isFavorite == true)
          .toList();

      emit(
        MovieLoaded(
          MovieResponseEntity(
            movies: favoriteMovies,
            totalPages: 1,
            currentPage: 0,
          ),
        ),
      );
    } on Failure catch (e) {
      emit(MovieError(e));
    } catch (e) {
      emit(MovieError(UnknownFailure(e.toString())));
    }
  }

  Future<void> toggleFavorite(String movieId) async {
    if (state is! MovieLoaded) return;

    final currentMovies = (state as MovieLoaded).movieResponse.movies;
    final movieIndex = currentMovies.indexWhere((movie) => movie.id == movieId);

    if (movieIndex == -1) return;

    final updatedMovies = List<MovieEntity>.from(currentMovies);
    final movieToUpdate = updatedMovies[movieIndex];

    updatedMovies[movieIndex] = MovieEntity(
      id: movieToUpdate.id,
      title: movieToUpdate.title,
      description: movieToUpdate.description,
      images: movieToUpdate.images,
      releaseDate: movieToUpdate.releaseDate,
      voteAverage: movieToUpdate.voteAverage,
      isFavorite: !(movieToUpdate.isFavorite ?? false),
    );

    emit(
      MovieLoaded(
        MovieResponseEntity(
          movies: updatedMovies,
          totalPages: (state as MovieLoaded).movieResponse.totalPages,
          currentPage: (state as MovieLoaded).movieResponse.currentPage,
        ),
      ),
    );

    try {
      await _favoriteUnfavoriteMovie(movieId);
    } on Failure catch (e) {
      updatedMovies[movieIndex] = movieToUpdate;
      emit(
        MovieLoaded(
          MovieResponseEntity(
            movies: updatedMovies,
            totalPages: (state as MovieLoaded).movieResponse.totalPages,
            currentPage: (state as MovieLoaded).movieResponse.currentPage,
          ),
        ),
      );
      emit(MovieError(e));
    } catch (e) {
      updatedMovies[movieIndex] = movieToUpdate;
      emit(
        MovieLoaded(
          MovieResponseEntity(
            movies: updatedMovies,
            totalPages: (state as MovieLoaded).movieResponse.totalPages,
            currentPage: (state as MovieLoaded).movieResponse.currentPage,
          ),
        ),
      );
      emit(MovieError(UnknownFailure(e.toString())));
    }
  }

  int getTotalPages() {
    if (state is MovieLoaded) {
      return (state as MovieLoaded).movieResponse.totalPages;
    }
    return 0;
  }

  int getCurrentPage() {
    if (state is MovieLoaded) {
      return (state as MovieLoaded).movieResponse.currentPage;
    }
    return 0;
  }
}
