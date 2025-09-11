import 'package:shartflix/data/models/movie_model.dart';
import 'package:shartflix/domain/repositories/movie_repository.dart';

class GetMovieList {
  final MovieRepository repository;

  GetMovieList(this.repository);

  Future<List<MovieModel>> call() {
    return repository.getMovieList();
  }
}
