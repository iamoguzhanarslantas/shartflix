import 'package:dio/dio.dart';
import 'package:shartflix/core/network/dio_client.dart';
import 'package:shartflix/data/models/movie_model.dart';
import 'package:shartflix/data/models/user_model.dart';

abstract class RemoteDataSource {
  Future<UserModel> login(String email, String password);
  Future<UserModel> register(String email, String password, String username);
  Future<UserModel> getUserProfile();
  Future<void> uploadPhoto(String imagePath);
  Future<List<MovieModel>> getMovieList();
  Future<List<MovieModel>> getFavoriteMovieList();
  Future<void> favoriteUnfavoriteMovie(String movieId);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final DioClient _dioClient;

  RemoteDataSourceImpl(this._dioClient);

  @override
  Future<UserModel> login(String email, String password) async {
    try {
      final response = await _dioClient.dio.post(
        '/user/login',
        data: {'email': email, 'password': password},
      );
      return UserModel.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception(e.response?.data['message'] ?? 'Login failed');
    }
  }

  @override
  Future<UserModel> register(
    String email,
    String password,
    String username,
  ) async {
    try {
      final response = await _dioClient.dio.post(
        '/user/register',
        data: {'email': email, 'password': password, 'username': username},
      );
      return UserModel.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception(e.response?.data['message'] ?? 'Registration failed');
    }
  }

  @override
  Future<UserModel> getUserProfile() async {
    try {
      final response = await _dioClient.dio.get('/user/profile');
      return UserModel.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception(e.response?.data['message'] ?? 'Failed to get profile');
    }
  }

  @override
  Future<void> uploadPhoto(String imagePath) async {
    try {
      String fileName = imagePath.split('/').last;
      FormData formData = FormData.fromMap({
        "file": await MultipartFile.fromFile(imagePath, filename: fileName),
      });

      await _dioClient.dio.post(
        '/user/upload_photo',
        data: formData,
        options: Options(
          headers: {Headers.contentTypeHeader: "multipart/form-data"},
        ),
      );
    } on DioException catch (e) {
      print('Photo upload DioException: ${e.message}');
      print('Response data: ${e.response?.data}');
      print('Response status code: ${e.response?.statusCode}');
      throw Exception(e.response?.data['message'] ?? 'Failed to upload photo');
    }
  }

  @override
  Future<List<MovieModel>> getMovieList() async {
    try {
      final response = await _dioClient.dio.get('/movie/list');
      print('Raw Movie list Response Data: ${response.data}'); // Always print raw data
      List<dynamic>? movieListData;

      if (response.data is Map && response.data['data'] is Map && response.data['data']['movies'] is List) {
        movieListData = response.data['data']['movies'] as List;
      } else if (response.data is Map && response.data['data'] is List) { // Keep this as a fallback for other APIs
        movieListData = response.data['data'] as List;
      } else if (response.data is Map && response.data['movies'] is List) {
        movieListData = response.data['movies'] as List;
      } else if (response.data is Map && response.data['results'] is List) {
        movieListData = response.data['results'] as List;
      } else if (response.data is Map && response.data['response'] is Map && response.data['response']['data'] is List) {
        movieListData = response.data['response']['data'] as List;
      } else if (response.data is List) {
        movieListData = response.data as List;
      } else if (response.data is Map) { // Generic fallback for a list within a map
        for (var value in response.data.values) {
          if (value is List) {
            movieListData = value;
            break;
          }
        }
      }

      if (movieListData != null) {
        return movieListData.map((e) => MovieModel.fromJson(e)).toList();
      }
      throw Exception('Invalid response format for movie list: No list found in response.');
    } on DioException catch (e) {
      print('Movie list DioException: ${e.message}');
      print('Response data: ${e.response?.data}');
      print('Response status code: ${e.response?.statusCode}');
      throw Exception(
        e.response?.data['message'] ?? 'Failed to get movie list',
      );
    }
  }

  @override
  Future<List<MovieModel>> getFavoriteMovieList() async {
    try {
      final response = await _dioClient.dio.get('/movie/favorites');
      print('Raw Favorite Movie list Response Data: ${response.data}'); // Always print raw data
      List<dynamic>? favoriteMovieListData;

      if (response.data is Map && response.data['data'] is Map && response.data['data']['movies'] is List) {
        favoriteMovieListData = response.data['data']['movies'] as List;
      } else if (response.data is Map && response.data['data'] is List) {
        favoriteMovieListData = response.data['data'] as List;
      } else if (response.data is Map && response.data['movies'] is List) {
        favoriteMovieListData = response.data['movies'] as List;
      } else if (response.data is Map && response.data['results'] is List) {
        favoriteMovieListData = response.data['results'] as List;
      } else if (response.data is Map && response.data['response'] is Map && response.data['response']['data'] is List) {
        favoriteMovieListData = response.data['response']['data'] as List;
      } else if (response.data is List) {
        favoriteMovieListData = response.data as List;
      } else if (response.data is Map) {
        for (var value in response.data.values) {
          if (value is List) {
            favoriteMovieListData = value;
            break;
          }
        }
      }

      if (favoriteMovieListData != null) {
        return favoriteMovieListData.map((e) => MovieModel.fromJson(e)).toList();
      }
      throw Exception('Invalid response format for favorite movie list: No list found in response.');
    } on DioException catch (e) {
      print('Favorite movie list DioException: ${e.message}');
      print('Response data: ${e.response?.data}');
      print('Response status code: ${e.response?.statusCode}');
      throw Exception(
        e.response?.data['message'] ?? 'Failed to get favorite movie list',
      );
    }
  }

  @override
  Future<void> favoriteUnfavoriteMovie(String movieId) async {
    try {
      await _dioClient.dio.post('/movie/favorite/$movieId');
    } on DioException catch (e) {
      throw Exception(
        e.response?.data['message'] ?? 'Failed to favorite/unfavorite movie',
      );
    }
  }
}
