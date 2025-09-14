import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart'; // Import for debugPrint
import 'package:shartflix/core/network/dio_client.dart';
import 'package:shartflix/core/errors/failures.dart'; // Import Failure types
import 'package:shartflix/data/models/movie_list_response_model.dart';
import 'package:shartflix/data/models/movie_model.dart';
import 'package:shartflix/data/models/user_model.dart';

abstract class RemoteDataSource {
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
      String errorMessage = 'Login failed';
      if (e.response?.data is Map && e.response?.data['response'] is Map) {
        final responseData = e.response?.data['response'];
        if (responseData['message'] == 'INVALID_CREDENTIALS') {
          errorMessage = 'Kullanıcı bulunamadı veya şifre yanlış.';
        } else {
          errorMessage = responseData['message'] ?? errorMessage;
        }
      } else {
        errorMessage = e.response?.data['message'] ?? errorMessage;
      }
      throw _handleDioException(e, errorMessage, 'Login');
    } on Exception catch (e) {
      throw UnknownFailure(e.toString());
    }
  }

  @override
  Future<UserModel> register(String email, String password, String name) async {
    try {
      final response = await _dioClient.dio.post(
        '/user/register',
        data: {'email': email, 'password': password, 'name': name},
      );
      if (kDebugMode) {
        debugPrint('Raw Register Response Data: ${response.data}');
      }
      return UserModel.fromJson(response.data);
    } on DioException catch (e) {
      String errorMessage = 'Registration failed';
      if (e.response?.data is Map && e.response?.data['response'] is Map) {
        errorMessage = e.response?.data['response']['message'] ?? errorMessage;
      } else {
        errorMessage = e.response?.data['message'] ?? errorMessage;
      }
      throw _handleDioException(e, errorMessage, 'Registration');
    } on Exception catch (e) {
      throw UnknownFailure(e.toString());
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
      throw _handleDioException(e, 'Failed to get profile', 'User Profile');
    } on Exception catch (e) {
      throw UnknownFailure(e.toString());
    }
  }

  @override
  Future<void> uploadUserPhoto(String imagePath) async {
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
      throw _handleDioException(e, 'Failed to upload photo', 'Photo upload');
    } on Exception catch (e) {
      throw UnknownFailure(e.toString());
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
        final movieListResponse = MovieListResponseModel.fromJson(
          response.data,
        );
        debugPrint(
          'Parsed MovieListResponseModel: movies.length=${movieListResponse.movies.length}, totalPages=${movieListResponse.totalPages}, currentPage=${movieListResponse.currentPage}',
        );
      }
      return MovieListResponseModel.fromJson(response.data);
    } on DioException catch (e) {
      throw _handleDioException(e, 'Failed to get movie list', 'Movie list');
    } on Exception catch (e) {
      throw UnknownFailure(e.toString());
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
        throw _handleDioException(
          e,
          'Failed to get all movies',
          'Get all movies',
        );
      } on Exception catch (e) {
        throw UnknownFailure(e.toString());
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
      throw _handleDioException(
        e,
        'Failed to get favorite movie list',
        'Favorite movie list',
      );
    } on Exception catch (e) {
      throw UnknownFailure(e.toString());
    }
  }

  @override
  Future<void> favoriteUnfavoriteMovie(String movieId) async {
    try {
      await _dioClient.dio.post('/movie/favorite/$movieId');
    } on DioException catch (e) {
      throw _handleDioException(
        e,
        'Failed to favorite/unfavorite movie',
        'Favorite/Unfavorite',
      );
    } on Exception catch (e) {
      throw UnknownFailure(e.toString());
    }
  }

  @override
  Future<void> updateUserProfilePhoto(String? photoUrl) async {
    try {
      await _dioClient.dio.put(
        '/user/profile/photo', // Assuming an endpoint to update photo URL
        data: {'photoUrl': photoUrl},
      );
    } on DioException catch (e) {
      throw _handleDioException(
        e,
        'Failed to update profile photo',
        'Update Profile Photo',
      );
    } on Exception catch (e) {
      throw UnknownFailure(e.toString());
    }
  }

  Failure _handleDioException(
    DioException e,
    String defaultMessage,
    String logTag,
  ) {
    if (kDebugMode) {
      debugPrint('$logTag DioException: ${e.message}');
      debugPrint('Response data: ${e.response?.data}');
      debugPrint('Response status code: ${e.response?.statusCode}');
    }

    String errorMessage = defaultMessage;
    if (e.response?.data is Map) {
      if (e.response?.data['response'] is Map) {
        errorMessage =
            e.response?.data['response']['message'] ?? defaultMessage;
      } else {
        errorMessage = e.response?.data['message'] ?? defaultMessage;
      }
    }

    if (e.type == DioExceptionType.connectionError ||
        e.type == DioExceptionType.receiveTimeout ||
        e.type == DioExceptionType.sendTimeout) {
      return NetworkFailure(errorMessage);
    } else if (e.response?.statusCode != null &&
        e.response!.statusCode! >= 500) {
      return ServerFailure(errorMessage);
    } else if (e.response?.statusCode != null &&
        e.response!.statusCode! >= 400) {
      // For 4xx errors, it's often a client-side issue or specific API error
      // We can refine this further if needed, but for now, treat as server failure
      return ServerFailure(errorMessage);
    } else {
      return UnknownFailure(errorMessage);
    }
  }
}
