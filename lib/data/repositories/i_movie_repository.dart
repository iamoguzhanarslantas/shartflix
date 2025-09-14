import 'package:shartflix/data/entities/movie_entity.dart';
import 'package:shartflix/data/entities/movie_response_entity.dart';

abstract class IMovieRepository {
  Future<MovieResponseEntity> getMovieList();
  Future<List<MovieEntity>> getAllMovies(); // New method
  Future<List<MovieEntity>> getFavoriteMovieList();
  Future<void> favoriteUnfavoriteMovie(String movieId);
}
