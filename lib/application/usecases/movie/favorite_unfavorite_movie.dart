import 'package:shartflix/domain/repositories/movie_repository.dart';

class FavoriteUnfavoriteMovie {
  final MovieRepository repository;

  FavoriteUnfavoriteMovie(this.repository);

  Future<void> call(String movieId) {
    return repository.favoriteUnfavoriteMovie(movieId);
  }
}
