import 'package:shartflix/data/models/movie_list_response_model.dart';
import 'package:shartflix/data/models/movie_model.dart';

abstract class MovieRepository {
  Future<MovieListResponseModel> getMovieList();
  Future<List<MovieModel>> getAllMovies(); // New method
  Future<List<MovieModel>> getFavoriteMovieList();
  Future<void> favoriteUnfavoriteMovie(String movieId);
}
