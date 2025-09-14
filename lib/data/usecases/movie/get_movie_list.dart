import 'package:shartflix/data/entities/movie_entity.dart';
import 'package:shartflix/data/entities/movie_response_entity.dart';
import 'package:shartflix/data/repositories/i_movie_repository.dart';

class GetMovieList {
  final IMovieRepository repository;

  GetMovieList(this.repository);

  Future<MovieResponseEntity> call() {
    return repository.getMovieList();
  }

  Future<List<MovieEntity>> callGetAllMovies() {
    return repository.getAllMovies();
  }
}
