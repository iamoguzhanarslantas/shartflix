import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shartflix/core/errors/failures.dart';
import 'package:shartflix/data/entities/movie_entity.dart';
import 'package:shartflix/data/usecases/movie/favorite_unfavorite_movie.dart';
import 'package:shartflix/data/usecases/movie/get_favorite_movie_list.dart';

part 'favorite_movie_state.dart';

class FavoriteMovieCubit extends Cubit<FavoriteMovieState> {
  final GetFavoriteMovieList _getFavoriteMovieList;
  final FavoriteUnfavoriteMovie _favoriteUnfavoriteMovie;

  FavoriteMovieCubit({
    required GetFavoriteMovieList getFavoriteMovieList,
    required FavoriteUnfavoriteMovie favoriteUnfavoriteMovie,
  })  : _getFavoriteMovieList = getFavoriteMovieList,
        _favoriteUnfavoriteMovie = favoriteUnfavoriteMovie,
        super(FavoriteMovieInitial());

  Future<void> fetchFavoriteMovies() async {
    emit(FavoriteMovieLoading());
    try {
      final movies = await _getFavoriteMovieList();
      emit(FavoriteMovieLoaded(movies));
    } on Failure catch (e) {
      emit(FavoriteMovieError(e));
    } catch (e) {
      emit(FavoriteMovieError(UnknownFailure(e.toString())));
    }
  }

  Future<void> toggleFavorite(String movieId) async {
    if (state is! FavoriteMovieLoaded) return;

    try {
      await _favoriteUnfavoriteMovie(movieId);
      // After successful toggle, re-fetch the favorite list to ensure it's up-to-date.
      await fetchFavoriteMovies();
    } on Failure catch (e) {
      emit(FavoriteMovieError(e));
    } catch (e) {
      emit(FavoriteMovieError(UnknownFailure(e.toString())));
    }
  }
}
