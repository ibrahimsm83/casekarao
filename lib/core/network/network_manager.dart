import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'api_exception.dart';
import 'api_response.dart';

/// A class that handles all network operations
class NetworkManager {
  static final NetworkManager _instance = NetworkManager._internal();
  factory NetworkManager() => _instance;

  late Dio _dio;
  final Logger _logger = Logger();
  static const String _baseUrl = 'https://staging.casekarao.com/api'; // Replace with your API base URL
  static const int _connectTimeout = 30000; // 30 seconds
  static const int _receiveTimeout = 30000; // 30 seconds
  static const String _authTokenKey = 'auth_token';
  static const String _userKey = 'user_data';

  NetworkManager._internal() {
    _dio = Dio(
      BaseOptions(
        baseUrl: _baseUrl,
        connectTimeout: Duration(milliseconds: _connectTimeout),
        receiveTimeout: Duration(milliseconds: _receiveTimeout),
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
        maxWidth: 90,
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
    Options? options,
    T Function(dynamic)? fromJson,
  }) async {
    try {
      _logRequest('GET', endpoint, queryParameters: queryParameters);
      
      final response = await _dio.get(
        endpoint,
        queryParameters: queryParameters,
        options: options,
      );
      
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
    Options? options,
    T Function(dynamic)? fromJson,
  }) async {
    try {
      _logRequest('POST', endpoint, data: data, queryParameters: queryParameters);
      
      final response = await _dio.post(
        endpoint,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
      
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
    Options? options,
    T Function(dynamic)? fromJson,
  }) async {
    try {
      _logRequest('PUT', endpoint, data: data, queryParameters: queryParameters);
      
      final response = await _dio.put(
        endpoint,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
      
      return _handleResponse<T>(response, fromJson);
    } catch (e) {
      return _handleError<T>(e);
    }
  }

  /// Make a DELETE request
  Future<ApiResponse<T>> delete<T>(
    String endpoint, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    T Function(dynamic)? fromJson,
  }) async {
    try {
      _logRequest('DELETE', endpoint, data: data, queryParameters: queryParameters);
      
      final response = await _dio.delete(
        endpoint,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
      
      return _handleResponse<T>(response, fromJson);
    } catch (e) {
      return _handleError<T>(e);
    }
  }

  /// Make a multipart request (for file uploads)
  Future<ApiResponse<T>> multipart<T>(
    String endpoint, {
    required FormData formData,
    Map<String, dynamic>? queryParameters,
    Options? options,
    T Function(dynamic)? fromJson,
    void Function(int, int)? onSendProgress,
  }) async {
    try {
      _logRequest('MULTIPART', endpoint, data: 'FormData (see logs for details)');
      _logger.i('FormData fields: ${formData.fields}');
      _logger.i('FormData files: ${formData.files}');
      
      final response = await _dio.post(
        endpoint,
        data: formData,
        queryParameters: queryParameters,
        options: options,
        onSendProgress: onSendProgress,
      );
      
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
    _logResponse(response);
    
    if (response.statusCode! >= 200 && response.statusCode! < 300) {
      final data = response.data;
      if (fromJson != null) {
        try {
          final parsedData = fromJson(data);
          return ApiResponse<T>.completed(parsedData);
        } catch (e) {
          _logger.e('Error parsing response: $e');
          return ApiResponse<T>.error('Error parsing response: $e');
        }
      } else if (T == dynamic || data is T) {
        return ApiResponse<T>.completed(data as T);
      } else {
        _logger.w('Response data type mismatch. Expected $T but got ${data.runtimeType}');
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
    _logError(error);
    
    if (error is DioException) {
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
          
          switch (statusCode) {
            case 400:
              return ApiResponse<T>.error(
                'Bad request: $errorMessage',
                statusCode: statusCode,
              );
            case 401:
              // Handle unauthorized - clear token and user data
              clearAuthToken();
              clearUserData();
              return ApiResponse<T>.error(
                'Unauthorized: $errorMessage',
                statusCode: statusCode,
              );
            case 403:
              return ApiResponse<T>.error(
                'Forbidden: $errorMessage',
                statusCode: statusCode,
              );
            case 404:
              return ApiResponse<T>.error(
                'Not found: $errorMessage',
                statusCode: statusCode,
              );
            case 409:
              return ApiResponse<T>.error(
                'Conflict: $errorMessage',
                statusCode: statusCode,
              );
            case 500:
            default:
              return ApiResponse<T>.error(
                'Server error: $errorMessage',
                statusCode: statusCode,
              );
          }
          
        case DioExceptionType.cancel:
          return ApiResponse<T>.error('Request was cancelled', statusCode: 0);
          
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

  /// Log the request details
  void _logRequest(
    String method,
    String endpoint, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
  }) {
    _logger.i('REQUEST [$method] => $endpoint');
    if (queryParameters != null) {
      _logger.i('Query Parameters: $queryParameters');
    }
    if (data != null && data is! FormData) {
      _logger.i('Request Data: $data');
    }
  }

  /// Log the response details
  void _logResponse(Response response) {
    _logger.i(
      'RESPONSE [${response.statusCode}] <= ${response.requestOptions.path}',
    );
    _logger.i('Response Data: ${response.data}');
  }

  /// Log error details
  void _logError(dynamic error) {
    if (error is DioException) {
      _logger.e(
        'ERROR [${error.response?.statusCode}] <= ${error.requestOptions.path}',
      );
      _logger.e('Error Type: ${error.type}');
      _logger.e('Error Message: ${error.message}');
      _logger.e('Error Response: ${error.response?.data}');
    } else {
      _logger.e('Unexpected Error: $error');
    }
  }
}
