import 'package:shartflix/data/models/movie_list_response_model.dart';
import 'package:shartflix/data/models/movie_model.dart'; // Import MovieModel
import 'package:shartflix/domain/repositories/movie_repository.dart';

class GetMovieList {
  final MovieRepository repository;

  GetMovieList(this.repository);

  Future<MovieListResponseModel> call() {
    return repository.getMovieList();
  }

  Future<List<MovieModel>> callGetAllMovies() { // New method to get all movies
    return repository.getAllMovies();
  }
}
