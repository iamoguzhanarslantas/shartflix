import 'package:shartflix/data/entities/movie_entity.dart';
import 'package:shartflix/data/repositories/i_movie_repository.dart';

class GetFavoriteMovieList {
  final IMovieRepository repository;

  GetFavoriteMovieList(this.repository);

  Future<List<MovieEntity>> call() {
    return repository.getFavoriteMovieList();
  }
}
