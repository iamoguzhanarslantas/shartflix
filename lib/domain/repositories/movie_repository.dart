import 'package:shartflix/domain/entities/movie_entity.dart';
import 'package:shartflix/domain/entities/movie_response_entity.dart';

abstract class MovieRepository {
  Future<MovieResponseEntity> getMovieList();
  Future<List<MovieEntity>> getAllMovies(); // New method
  Future<List<MovieEntity>> getFavoriteMovieList();
  Future<void> favoriteUnfavoriteMovie(String movieId);
}
