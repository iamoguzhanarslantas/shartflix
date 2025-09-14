import 'package:shartflix/data/models/movie_list_response_model.dart';
import 'package:shartflix/data/models/movie_model.dart';
import 'package:shartflix/data/models/user_model.dart';

abstract class IRemoteDataSource {
  Future<UserModel> login(String email, String password);
  Future<UserModel> register(String email, String password, String name);
  Future<UserModel> getUserProfile();
  Future<void> uploadUserPhoto(String imagePath);
  Future<MovieListResponseModel> getMovieList({int page = 1});
  Future<List<MovieModel>> getAllMovies(); // New method to fetch all movies
  Future<List<MovieModel>> getFavoriteMovieList();
  Future<void> favoriteUnfavoriteMovie(String movieId);
  Future<void> updateUserProfilePhoto(String? photoUrl); // New method
}
