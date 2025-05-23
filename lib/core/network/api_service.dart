import 'dart:io';

import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:path/path.dart';

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

  /// Make a DELETE request
  Future<ApiResponse<T>> delete<T>(
    String endpoint, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    T Function(dynamic)? fromJson,
  }) async {
    return _networkManager.delete<T>(
      endpoint,
      data: data,
      queryParameters: queryParameters,
      fromJson: fromJson,
    );
  }

  /// Upload a single file with additional data
  Future<ApiResponse<T>> uploadFile<T>(
    String endpoint, {
    required File file,
    required String fileField,
    Map<String, dynamic>? data,
    T Function(dynamic)? fromJson,
    void Function(int, int)? onSendProgress,
  }) async {
    // Create form data
    final formData = FormData();
    
    // Add file
    final fileName = basename(file.path);
    final fileExtension = extension(file.path).replaceAll('.', '');
    
    // Determine MIME type based on file extension
    String contentType;
    switch (fileExtension.toLowerCase()) {
      case 'jpg':
      case 'jpeg':
        contentType = 'image/jpeg';
        break;
      case 'png':
        contentType = 'image/png';
        break;
      case 'pdf':
        contentType = 'application/pdf';
        break;
      case 'doc':
        contentType = 'application/msword';
        break;
      case 'docx':
        contentType = 'application/vnd.openxmlformats-officedocument.wordprocessingml.document';
        break;
      default:
        contentType = 'application/octet-stream';
    }
    
    formData.files.add(
      MapEntry(
        fileField,
        await MultipartFile.fromFile(
          file.path,
          filename: fileName,
          contentType: MediaType.parse(contentType),
        ),
      ),
    );
    
    // Add additional data
    if (data != null) {
      data.forEach((key, value) {
        formData.fields.add(MapEntry(key, value.toString()));
      });
    }
    
    return _networkManager.multipart<T>(
      endpoint,
      formData: formData,
      fromJson: fromJson,
      onSendProgress: onSendProgress,
    );
  }

  /// Upload multiple files with additional data
  Future<ApiResponse<T>> uploadMultipleFiles<T>(
    String endpoint, {
    required List<File> files,
    required String fileField,
    Map<String, dynamic>? data,
    T Function(dynamic)? fromJson,
    void Function(int, int)? onSendProgress,
  }) async {
    // Create form data
    final formData = FormData();
    
    // Add files
    for (var i = 0; i < files.length; i++) {
      final file = files[i];
      final fileName = basename(file.path);
      final fileExtension = extension(file.path).replaceAll('.', '');
      
      // Determine MIME type based on file extension
      String contentType;
      switch (fileExtension.toLowerCase()) {
        case 'jpg':
        case 'jpeg':
          contentType = 'image/jpeg';
          break;
        case 'png':
          contentType = 'image/png';
          break;
        case 'pdf':
          contentType = 'application/pdf';
          break;
        case 'doc':
          contentType = 'application/msword';
          break;
        case 'docx':
          contentType = 'application/vnd.openxmlformats-officedocument.wordprocessingml.document';
          break;
        default:
          contentType = 'application/octet-stream';
      }
      
      formData.files.add(
        MapEntry(
          '$fileField[$i]',
          await MultipartFile.fromFile(
            file.path,
            filename: fileName,
            contentType: MediaType.parse(contentType),
          ),
        ),
      );
    }
    
    // Add additional data
    if (data != null) {
      data.forEach((key, value) {
        formData.fields.add(MapEntry(key, value.toString()));
      });
    }
    
    return _networkManager.multipart<T>(
      endpoint,
      formData: formData,
      fromJson: fromJson,
      onSendProgress: onSendProgress,
    );
  }
}
