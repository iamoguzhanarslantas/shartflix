import 'package:shartflix/data/models/movie_model.dart';

abstract class MovieRepository {
  Future<List<MovieModel>> getMovieList();
  Future<List<MovieModel>> getFavoriteMovieList();
  Future<void> favoriteUnfavoriteMovie(String movieId);
}
