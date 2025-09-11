import 'package:shartflix/data/models/movie_model.dart';
import 'package:shartflix/domain/repositories/movie_repository.dart';

class GetFavoriteMovieList {
  final MovieRepository repository;

  GetFavoriteMovieList(this.repository);

  Future<List<MovieModel>> call() {
    return repository.getFavoriteMovieList();
  }
}
