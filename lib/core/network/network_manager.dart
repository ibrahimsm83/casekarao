import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'api_response.dart';

// A network manager for API communication
class NetworkManager {
  static final NetworkManager _instance = NetworkManager._internal();
  factory NetworkManager() => _instance;

  late Dio _dio;
  static const String _baseUrl = 'https://staging.casekarao.com/api';
  static const int _timeout = 30000; // 30 seconds
  static const String _authTokenKey = 'auth_token';
  static const String _userKey = 'user_data';

  NetworkManager._internal() {
    _dio = Dio(
      BaseOptions(
        baseUrl: _baseUrl,
        connectTimeout: Duration(milliseconds: _timeout),
        receiveTimeout: Duration(milliseconds: _timeout),
        responseType: ResponseType.json,
        contentType: Headers.jsonContentType,
      ),
    );

    // Add logging interceptor
    _dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
      ),
    );

    // Add auth token interceptor
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = await getAuthToken();
          if (token != null && token.isNotEmpty) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          return handler.next(options);
        },
      ),
    );
  }

  /// Get the authentication token from shared preferences
  Future<String?> getAuthToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_authTokenKey);
  }

  /// Save the authentication token to shared preferences
  Future<bool> saveAuthToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setString(_authTokenKey, token);
  }

  /// Clear the authentication token from shared preferences
  Future<bool> clearAuthToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.remove(_authTokenKey);
  }

  /// Save user data to shared preferences
  Future<bool> saveUserData(Map<String, dynamic> userData) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setString(_userKey, jsonEncode(userData));
  }

  /// Get user data from shared preferences
  Future<Map<String, dynamic>?> getUserData() async {
    final prefs = await SharedPreferences.getInstance();
    final userDataString = prefs.getString(_userKey);
    if (userDataString != null) {
      return jsonDecode(userDataString) as Map<String, dynamic>;
    }
    return null;
  }

  /// Clear user data from shared preferences
  Future<bool> clearUserData() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.remove(_userKey);
  }

  /// Make a GET request
  Future<ApiResponse<T>> get<T>(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
    T Function(dynamic)? fromJson,
  }) async {
    try {
      print('REQUEST [GET] => $endpoint');
      if (queryParameters != null) {
        print('Query Parameters: $queryParameters');
      }

      final response = await _dio.get(
        endpoint,
        queryParameters: queryParameters,
      );

      print('RESPONSE [${response.statusCode}] <= $endpoint');
      print('Response Data: ${response.data}');

      return _handleResponse<T>(response, fromJson);
    } catch (e) {
      return _handleError<T>(e);
    }
  }

  /// Make a POST request
  Future<ApiResponse<T>> post<T>(
    String endpoint, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    T Function(dynamic)? fromJson,
  }) async {
    try {
      print('REQUEST [POST] => $endpoint');
      if (data != null) {
        print('Request Data: $data');
      }
      if (queryParameters != null) {
        print('Query Parameters: $queryParameters');
      }

      final response = await _dio.post(
        endpoint,
        data: data,
        queryParameters: queryParameters,
      );

      print('RESPONSE [${response.statusCode}] <= $endpoint');
      print('Response Data: ${response.data}');

      return _handleResponse<T>(response, fromJson);
    } catch (e) {
      return _handleError<T>(e);
    }
  }

  /// Make a PUT request
  Future<ApiResponse<T>> put<T>(
    String endpoint, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    T Function(dynamic)? fromJson,
  }) async {
    try {
      print('REQUEST [PUT] => $endpoint');
      if (data != null) {
        print('Request Data: $data');
      }
      if (queryParameters != null) {
        print('Query Parameters: $queryParameters');
      }

      final response = await _dio.put(
        endpoint,
        data: data,
        queryParameters: queryParameters,
      );

      print('RESPONSE [${response.statusCode}] <= $endpoint');
      print('Response Data: ${response.data}');

      return _handleResponse<T>(response, fromJson);
    } catch (e) {
      return _handleError<T>(e);
    }
  }

  /// Upload a file with form data
  Future<ApiResponse<T>> uploadFile<T>(
    String endpoint, {
    required File file,
    required String fileField,
    Map<String, dynamic>? data,
    T Function(dynamic)? fromJson,
  }) async {
    try {
      print('REQUEST [MULTIPART] => $endpoint');

      // Create form data
      final formData = FormData();

      // Add file
      final fileName = file.path.split('/').last;
      formData.files.add(
        MapEntry(
          fileField,
          await MultipartFile.fromFile(file.path, filename: fileName),
        ),
      );

      // Add additional data
      if (data != null) {
        data.forEach((key, value) {
          formData.fields.add(MapEntry(key, value.toString()));
        });
      }

      final response = await _dio.post(
        endpoint,
        data: formData,
      );

      print('RESPONSE [${response.statusCode}] <= $endpoint');
      print('Response Data: ${response.data}');

      return _handleResponse<T>(response, fromJson);
    } catch (e) {
      return _handleError<T>(e);
    }
  }

  /// Handle the API response
  ApiResponse<T> _handleResponse<T>(
    Response response,
    T Function(dynamic)? fromJson,
  ) {
    if (response.statusCode! >= 200 && response.statusCode! < 300) {
      final data = response.data;
      if (fromJson != null) {
        try {
          final parsedData = fromJson(data);
          return ApiResponse<T>.completed(parsedData);
        } catch (e) {
          print('Error parsing response: $e');
          return ApiResponse<T>.error('Error parsing response: $e');
        }
      } else if (T == dynamic || data is T) {
        return ApiResponse<T>.completed(data as T);
      } else {
        return ApiResponse<T>.error('Response data type mismatch');
      }
    } else {
      return ApiResponse<T>.error(
        'Request failed with status: ${response.statusCode}',
        statusCode: response.statusCode,
      );
    }
  }

  /// Handle errors from the API request
  ApiResponse<T> _handleError<T>(dynamic error) {
    if (error is DioException) {
      print('ERROR: ${error.message}');
      if (error.response != null) {
        print('ERROR RESPONSE: ${error.response?.data}');
      }

      switch (error.type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.sendTimeout:
        case DioExceptionType.receiveTimeout:
          return ApiResponse<T>.error(
            'Connection timeout. Please check your internet connection.',
            statusCode: 408,
          );

        case DioExceptionType.badResponse:
          final statusCode = error.response?.statusCode;
          final responseData = error.response?.data;
          String errorMessage = 'Server error';

          if (responseData != null && responseData is Map<String, dynamic>) {
            errorMessage = responseData['message'] ?? errorMessage;
          }

          if (statusCode == 401) {
            // Handle unauthorized - clear token and user data
            clearAuthToken();
            clearUserData();
          }

          return ApiResponse<T>.error(
            errorMessage,
            statusCode: statusCode,
          );

        case DioExceptionType.unknown:
          if (error.error is SocketException) {
            return ApiResponse<T>.error(
              'No internet connection. Please check your network.',
              statusCode: 0,
            );
          }
          return ApiResponse<T>.error(
            'An unexpected error occurred: ${error.message}',
            statusCode: 0,
          );

        default:
          return ApiResponse<T>.error(
            'An unexpected error occurred: ${error.message}',
            statusCode: 0,
          );
      }
    } else {
      return ApiResponse<T>.error(
        'An unexpected error occurred: $error',
        statusCode: 0,
      );
    }
  }
}
