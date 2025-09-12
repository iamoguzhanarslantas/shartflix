import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart'; // Import for debugPrint
import 'package:shartflix/core/network/dio_client.dart';
import 'package:shartflix/data/models/movie_list_response_model.dart';
import 'package:shartflix/data/models/movie_model.dart';
import 'package:shartflix/data/models/user_model.dart';

abstract class RemoteDataSource {
  Future<UserModel> login(String email, String password);
  Future<UserModel> register(String email, String password, String username);
  Future<UserModel> getUserProfile();
  Future<void> uploadPhoto(String imagePath);
  Future<MovieListResponseModel> getMovieList({int page = 1});
  Future<List<MovieModel>> getAllMovies(); // New method to fetch all movies
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
      if (kDebugMode) {
        debugPrint('Raw Login Response Data: ${response.data}');
      }
      return UserModel.fromJson(response.data);
    } on DioException catch (e) {
      if (kDebugMode) {
        debugPrint('Login DioException: ${e.message}');
        debugPrint('Response data: ${e.response?.data}');
        debugPrint('Response status code: ${e.response?.statusCode}');
      }
      String errorMessage = 'Login failed';
      if (e.response?.data is Map && e.response?.data['response'] is Map) {
        final responseData = e.response?.data['response'];
        if (responseData['message'] == 'INVALID_CREDENTIALS') {
          errorMessage =
              'Kullanıcı bulunamadı veya şifre yanlış.'; // Translated message
        } else {
          errorMessage = responseData['message'] ?? errorMessage;
        }
      } else {
        errorMessage = e.response?.data['message'] ?? errorMessage;
      }
      throw Exception(errorMessage);
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
        data: {
          'email': email,
          'password': password,
          'name': username,
        }, // Assuming 'name' is the correct field for the API
      );
      if (kDebugMode) {
        debugPrint('Raw Register Response Data: ${response.data}');
      }
      return UserModel.fromJson(response.data);
    } on DioException catch (e) {
      if (kDebugMode) {
        debugPrint('Registration DioException: ${e.message}');
        debugPrint('Response data: ${e.response?.data}');
        debugPrint('Response status code: ${e.response?.statusCode}');
      }
      String errorMessage = 'Registration failed';
      if (e.response?.data is Map && e.response?.data['response'] is Map) {
        errorMessage = e.response?.data['response']['message'] ?? errorMessage;
      } else {
        errorMessage = e.response?.data['message'] ?? errorMessage;
      }
      throw Exception(errorMessage);
    }
  }

  @override
  Future<UserModel> getUserProfile() async {
    try {
      final response = await _dioClient.dio.get('/user/profile');
      if (kDebugMode) {
        debugPrint('Raw User Profile Response Data: ${response.data}');
      }
      return UserModel.fromJson(response.data);
    } on DioException catch (e) {
      if (kDebugMode) {
        debugPrint('User Profile DioException: ${e.message}');
        debugPrint('Response data: ${e.response?.data}');
        debugPrint('Response status code: ${e.response?.statusCode}');
      }
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
      if (kDebugMode) {
        debugPrint('Photo upload DioException: ${e.message}');
        debugPrint('Response data: ${e.response?.data}');
        debugPrint('Response status code: ${e.response?.statusCode}');
      }
      throw Exception(e.response?.data['message'] ?? 'Failed to upload photo');
    }
  }

  @override
  Future<MovieListResponseModel> getMovieList({int page = 1}) async {
    try {
      final response = await _dioClient.dio.get(
        '/movie/list',
        queryParameters: {'page': page},
      );
      if (kDebugMode) {
        debugPrint('Raw Movie list Response Data: ${response.data}');
        final movieListResponse = MovieListResponseModel.fromJson(response.data);
        debugPrint('Parsed MovieListResponseModel: movies.length=${movieListResponse.movies.length}, totalPages=${movieListResponse.totalPages}, currentPage=${movieListResponse.currentPage}');
      }
      return MovieListResponseModel.fromJson(response.data);
    } on DioException catch (e) {
      if (kDebugMode) {
        debugPrint('Movie list DioException: ${e.message}');
        debugPrint('Response data: ${e.response?.data}');
        debugPrint('Response status code: ${e.response?.statusCode}');
      }
      throw Exception(
        e.response?.data['message'] ?? 'Failed to get movie list',
      );
    }
  }

  @override
  Future<List<MovieModel>> getAllMovies() async {
    List<MovieModel> allMovies = [];
    int currentPage = 1;
    int totalPages = 1; // Initialize to 1 to enter the loop

    while (currentPage <= totalPages) {
      try {
        final response = await _dioClient.dio.get(
          '/movie/list',
          queryParameters: {'page': currentPage},
        );
        final movieListResponse = MovieListResponseModel.fromJson(
          response.data,
        );
        allMovies.addAll(movieListResponse.movies);
        totalPages = movieListResponse.totalPages;
        currentPage++;
      } on DioException catch (e) {
        if (kDebugMode) {
          debugPrint('Get all movies DioException: ${e.message}');
          debugPrint('Response data: ${e.response?.data}');
          debugPrint('Response status code: ${e.response?.statusCode}');
        }
        throw Exception(
          e.response?.data['message'] ?? 'Failed to get all movies',
        );
      }
    }
    return allMovies;
  }

  @override
  Future<List<MovieModel>> getFavoriteMovieList() async {
    try {
      final response = await _dioClient.dio.get('/movie/favorites');
      if (kDebugMode) {
        debugPrint('Raw Favorite Movie list Response Data: ${response.data}');
      }
      List<dynamic>? favoriteMovieListData;

      if (response.data is Map &&
          response.data['data'] is Map &&
          response.data['data']['movies'] is List) {
        favoriteMovieListData = response.data['data']['movies'] as List;
      } else if (response.data is Map && response.data['data'] is List) {
        favoriteMovieListData = response.data['data'] as List;
      } else if (response.data is Map && response.data['movies'] is List) {
        favoriteMovieListData = response.data['movies'] as List;
      } else if (response.data is Map && response.data['results'] is List) {
        favoriteMovieListData = response.data['results'] as List;
      } else if (response.data is Map &&
          response.data['response'] is Map &&
          response.data['response']['data'] is List) {
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
        return favoriteMovieListData
            .map((e) => MovieModel.fromJson(e))
            .toList();
      }
      throw Exception(
        'Invalid response format for favorite movie list: No list found in response.',
      );
    } on DioException catch (e) {
      if (kDebugMode) {
        debugPrint('Favorite movie list DioException: ${e.message}');
        debugPrint('Response data: ${e.response?.data}');
        debugPrint('Response status code: ${e.response?.statusCode}');
      }
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
      if (kDebugMode) {
        debugPrint('Favorite/Unfavorite DioException: ${e.message}');
        debugPrint('Response data: ${e.response?.data}');
        debugPrint('Response status code: ${e.response?.statusCode}');
      }
      throw Exception(
        e.response?.data['message'] ?? 'Failed to favorite/unfavorite movie',
      );
    }
  }
}
