import 'package:shartflix/data/repositories/i_movie_repository.dart';

class FavoriteUnfavoriteMovie {
  final IMovieRepository repository;

  FavoriteUnfavoriteMovie(this.repository);

  Future<void> call(String movieId) {
    return repository.favoriteUnfavoriteMovie(movieId);
  }
}
