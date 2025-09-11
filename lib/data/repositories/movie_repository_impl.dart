import 'package:shartflix/data/datasources/remote_data_source.dart';
import 'package:shartflix/data/models/movie_model.dart';
import 'package:shartflix/domain/repositories/movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  final RemoteDataSource remoteDataSource;

  MovieRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<MovieModel>> getMovieList() {
    return remoteDataSource.getMovieList();
  }

  @override
  Future<List<MovieModel>> getFavoriteMovieList() {
    return remoteDataSource.getFavoriteMovieList();
  }

  @override
  Future<void> favoriteUnfavoriteMovie(String movieId) {
    return remoteDataSource.favoriteUnfavoriteMovie(movieId);
  }
}
