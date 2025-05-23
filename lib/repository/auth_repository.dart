import 'dart:io';

import '../core/network/api_response.dart';
import '../core/network/api_service.dart';
import '../model/auth_user_model.dart';

class AuthRepository {
  final ApiService _apiService = ApiService();

  /// Login with email and password
  Future<ApiResponse<AuthUserModel>> login({
    required String email,
    required String password,
  }) async {
    final response = await _apiService.post<AuthUserModel>(
      '/auth/login',
      data: {
        'email': email,
        'password': password,
      },
      fromJson: (json) {
        final userData = json['data'];
        // Save token for future requests
        _apiService.saveAuthToken(userData['token']);
        // Save user data
        _apiService.saveUserData(userData);
        return AuthUserModel.fromJson(userData);
      },
    );
    return response;
  }

  /// Register a new user
  Future<ApiResponse<AuthUserModel>> register({
    required String name,
    required String email,
    required String password,
    String? phone,
  }) async {
    final response = await _apiService.post<AuthUserModel>(
      '/auth/register',
      data: {
        'name': name,
        'email': email,
        'password': password,
        'phone': phone,
      },
      fromJson: (json) {
        final userData = json['data'];
        // Save token for future requests
        _apiService.saveAuthToken(userData['token']);
        // Save user data
        _apiService.saveUserData(userData);
        return AuthUserModel.fromJson(userData);
      },
    );
    return response;
  }

  /// Logout the user
  Future<ApiResponse<bool>> logout() async {
    final response = await _apiService.post<bool>(
      '/auth/logout',
      fromJson: (json) => true,
    );

    if (response.status == Status.COMPLETED) {
      // Clear token and user data
      await _apiService.clearAuthToken();
      await _apiService.clearUserData();
    }

    return response;
  }

  /// Update user profile
  Future<ApiResponse<AuthUserModel>> updateProfile({
    required String name,
    String? phone,
  }) async {
    final response = await _apiService.put<AuthUserModel>(
      '/auth/profile',
      data: {
        'name': name,
        'phone': phone,
      },
      fromJson: (json) {
        final userData = json['data'];
        // Update user data
        _apiService.saveUserData(userData);
        return AuthUserModel.fromJson(userData);
      },
    );
    return response;
  }

  /// Upload profile image
  Future<ApiResponse<AuthUserModel>> uploadProfileImage({
    required File image,
  }) async {
    final response = await _apiService.uploadFile<AuthUserModel>(
      '/auth/profile/image',
      file: image,
      fileField: 'profile_image',
      fromJson: (json) {
        final userData = json['data'];
        // Update user data
        _apiService.saveUserData(userData);
        return AuthUserModel.fromJson(userData);
      },
      onSendProgress: (sent, total) {
        final progress = (sent / total) * 100;
        print('Upload progress: $progress%');
      },
    );
    return response;
  }

  /// Get user profile
  Future<ApiResponse<AuthUserModel>> getProfile() async {
    final response = await _apiService.get<AuthUserModel>(
      '/auth/profile',
      fromJson: (json) {
        final userData = json['data'];
        return AuthUserModel.fromJson(userData);
      },
    );
    return response;
  }

  /// Change password
  Future<ApiResponse<bool>> changePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    final response = await _apiService.put<bool>(
      '/auth/password',
      data: {
        'current_password': currentPassword,
        'new_password': newPassword,
      },
      fromJson: (json) => true,
    );
    return response;
  }

  /// Forgot password
  Future<ApiResponse<bool>> forgotPassword({
    required String email,
  }) async {
    final response = await _apiService.post<bool>(
      '/auth/forgot-password',
      data: {
        'email': email,
      },
      fromJson: (json) => true,
    );
    return response;
  }

  /// Reset password
  Future<ApiResponse<bool>> resetPassword({
    required String token,
    required String email,
    required String password,
  }) async {
    final response = await _apiService.post<bool>(
      '/auth/reset-password',
      data: {
        'token': token,
        'email': email,
        'password': password,
      },
      fromJson: (json) => true,
    );
    return response;
  }

  /// Check if user is logged in
  Future<bool> isLoggedIn() async {
    final token = await _apiService.getAuthToken();
    return token != null && token.isNotEmpty;
  }

  /// Get current user
  Future<AuthUserModel?> getCurrentUser() async {
    final userData = await _apiService.getUserData();
    if (userData != null) {
      return AuthUserModel.fromJson(userData);
    }
    return null;
  }
}
