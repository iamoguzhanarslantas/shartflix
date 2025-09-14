import 'package:shartflix/core/errors/failures.dart'; // Import Failure types
import 'package:shartflix/data/repositories/i_remote_data_source.dart';
import 'package:shartflix/data/repositories/i_movie_repository.dart';
import 'package:shartflix/data/entities/movie_entity.dart';
import 'package:shartflix/data/entities/movie_response_entity.dart';

class MovieRepositoryImpl implements IMovieRepository {
  final IRemoteDataSource remoteDataSource;

  MovieRepositoryImpl(this.remoteDataSource);

  @override
  Future<MovieResponseEntity> getMovieList() async {
    try {
      final responseModel = await remoteDataSource.getMovieList();
      return MovieResponseEntity(
        movies: responseModel.movies.map((model) => model.toEntity()).toList(),
        totalPages: responseModel.totalPages,
        currentPage: responseModel.currentPage,
      );
    } on Failure {
      rethrow;
    } catch (e) {
      throw UnknownFailure(e.toString());
    }
  }

  @override
  Future<List<MovieEntity>> getAllMovies() async {
    try {
      final movieModels = await remoteDataSource.getAllMovies();
      return movieModels.map((model) => model.toEntity()).toList();
    } on Failure {
      rethrow;
    } catch (e) {
      throw UnknownFailure(e.toString());
    }
  }

  @override
  Future<List<MovieEntity>> getFavoriteMovieList() async {
    try {
      final movieModels = await remoteDataSource.getFavoriteMovieList();
      return movieModels.map((model) => model.toEntity()).toList();
    } on Failure {
      rethrow;
    } catch (e) {
      throw UnknownFailure(e.toString());
    }
  }

  @override
  Future<void> favoriteUnfavoriteMovie(String movieId) async {
    try {
      return await remoteDataSource.favoriteUnfavoriteMovie(movieId);
    } on Failure {
      rethrow;
    } catch (e) {
      throw UnknownFailure(e.toString());
    }
  }
}
