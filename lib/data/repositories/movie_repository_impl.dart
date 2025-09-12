import 'package:shartflix/data/datasources/remote_data_source.dart';
import 'package:shartflix/data/models/movie_list_response_model.dart';
import 'package:shartflix/data/models/movie_model.dart';
import 'package:shartflix/domain/repositories/movie_repository.dart';
import 'package:shartflix/domain/entities/movie_entity.dart';
import 'package:shartflix/domain/entities/movie_response_entity.dart';

class MovieRepositoryImpl implements MovieRepository {
  final RemoteDataSource remoteDataSource;

  MovieRepositoryImpl(this.remoteDataSource);

  @override
  Future<MovieResponseEntity> getMovieList() async {
    final responseModel = await remoteDataSource.getMovieList();
    return MovieResponseEntity(
      movies: responseModel.movies.map((model) => model.toEntity()).toList(),
      totalPages: responseModel.totalPages,
      currentPage: responseModel.currentPage,
    );
  }

  @override
  Future<List<MovieEntity>> getAllMovies() async {
    final movieModels = await remoteDataSource.getAllMovies();
    return movieModels.map((model) => model.toEntity()).toList();
  }

  @override
  Future<List<MovieEntity>> getFavoriteMovieList() async {
    final movieModels = await remoteDataSource.getFavoriteMovieList();
    return movieModels.map((model) => model.toEntity()).toList();
  }

  @override
  Future<void> favoriteUnfavoriteMovie(String movieId) {
    return remoteDataSource.favoriteUnfavoriteMovie(movieId);
  }
}
