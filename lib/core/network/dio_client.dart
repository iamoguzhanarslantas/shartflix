import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:shartflix/core/services/local_storage_service.dart';

class DioClient {
  final LocalStorageService _localStorageService;
  final Dio _dio;

  DioClient(this._localStorageService) : _dio = Dio(
    BaseOptions(
      baseUrl: 'https://caseapi.servicelabs.tech/',
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 3),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    ),
  ) {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = await _localStorageService.getAuthToken();
          if (token != null) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          return handler.next(options);
        },
        onResponse: (response, handler) {
          // Handle token from login response if available
          if (response.requestOptions.path == '/user/login' ||
              response.requestOptions.path == '/user/register') {
            debugPrint('Login/Register Response Data: ${response.data}');
            // Assuming token is directly in the response data or nested under 'data'
            final token = response.data['token'] ?? response.data['data']?['token'];
            if (token != null) {
              _localStorageService.saveAuthToken(token);
            }
          }
          return handler.next(response);
        },
        onError: (DioException e, handler) {
          // Handle token expiration or other auth errors
          return handler.next(e);
        },
      ),
    );
  }

  Dio get dio => _dio;
}
