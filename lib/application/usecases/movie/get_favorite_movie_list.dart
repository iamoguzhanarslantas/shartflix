import 'package:shartflix/domain/entities/movie_entity.dart';
import 'package:shartflix/domain/repositories/movie_repository.dart';

class GetFavoriteMovieList {
  final MovieRepository repository;

  GetFavoriteMovieList(this.repository);

  Future<List<MovieEntity>> call() {
    return repository.getFavoriteMovieList();
  }
}
