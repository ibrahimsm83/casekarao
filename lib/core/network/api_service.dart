import 'dart:io';

import 'api_response.dart';
import 'network_manager.dart';

/// A service class that provides methods to interact with the API
class ApiService {
  final NetworkManager _networkManager = NetworkManager();

  /// Get the authentication token
  Future<String?> getAuthToken() async {
    return _networkManager.getAuthToken();
  }

  /// Save the authentication token
  Future<bool> saveAuthToken(String token) async {
    return _networkManager.saveAuthToken(token);
  }

  /// Clear the authentication token
  Future<bool> clearAuthToken() async {
    return _networkManager.clearAuthToken();
  }

  /// Save user data
  Future<bool> saveUserData(Map<String, dynamic> userData) async {
    return _networkManager.saveUserData(userData);
  }

  /// Get user data
  Future<Map<String, dynamic>?> getUserData() async {
    return _networkManager.getUserData();
  }

  /// Clear user data
  Future<bool> clearUserData() async {
    return _networkManager.clearUserData();
  }

  /// Make a GET request
  Future<ApiResponse<T>> get<T>(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
    T Function(dynamic)? fromJson,
  }) async {
    return _networkManager.get<T>(
      endpoint,
      queryParameters: queryParameters,
      fromJson: fromJson,
    );
  }

  /// Make a POST request
  Future<ApiResponse<T>> post<T>(
    String endpoint, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    T Function(dynamic)? fromJson,
  }) async {
    return _networkManager.post<T>(
      endpoint,
      data: data,
      queryParameters: queryParameters,
      fromJson: fromJson,
    );
  }

  /// Make a PUT request
  Future<ApiResponse<T>> put<T>(
    String endpoint, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    T Function(dynamic)? fromJson,
  }) async {
    return _networkManager.put<T>(
      endpoint,
      data: data,
      queryParameters: queryParameters,
      fromJson: fromJson,
    );
  }

  /// Upload a file with form data
  Future<ApiResponse<T>> uploadFile<T>(
    String endpoint, {
    required File file,
    required String fileField,
    Map<String, dynamic>? data,
    T Function(dynamic)? fromJson,
  }) async {
    return _networkManager.uploadFile<T>(
      endpoint,
      file: file,
      fileField: fileField,
      data: data,
      fromJson: fromJson,
    );
  }
}
