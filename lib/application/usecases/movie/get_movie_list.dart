import 'package:shartflix/domain/entities/movie_entity.dart';
import 'package:shartflix/domain/entities/movie_response_entity.dart';
import 'package:shartflix/domain/repositories/movie_repository.dart';

class GetMovieList {
  final MovieRepository repository;

  GetMovieList(this.repository);

  Future<MovieResponseEntity> call() {
    return repository.getMovieList();
  }

  Future<List<MovieEntity>> callGetAllMovies() {
    return repository.getAllMovies();
  }
}
