// import 'dart:io';

// import 'package:get/get.dart';

// import '../core/network/api_response.dart';
// import '../model/auth_user_model.dart';
// import '../repository/auth_repository.dart';

// class AuthController extends GetxController {
//   final AuthRepository _authRepository = AuthRepository();

//   // Observable variables
//   final Rx<ApiResponse<AuthUserModel>> _loginResponse = ApiResponse<AuthUserModel>.initial().obs;
//   final Rx<ApiResponse<AuthUserModel>> _registerResponse = ApiResponse<AuthUserModel>.initial().obs;
//   final Rx<ApiResponse<bool>> _logoutResponse = ApiResponse<bool>.initial().obs;
//   final Rx<ApiResponse<AuthUserModel>> _profileResponse = ApiResponse<AuthUserModel>.initial().obs;
//   final Rx<ApiResponse<AuthUserModel>> _updateProfileResponse = ApiResponse<AuthUserModel>.initial().obs;
//   final Rx<ApiResponse<AuthUserModel>> _uploadProfileImageResponse = ApiResponse<AuthUserModel>.initial().obs;
//   final Rx<ApiResponse<bool>> _changePasswordResponse = ApiResponse<bool>.initial().obs;
//   final Rx<ApiResponse<bool>> _forgotPasswordResponse = ApiResponse<bool>.initial().obs;
//   final Rx<ApiResponse<bool>> _resetPasswordResponse = ApiResponse<bool>.initial().obs;

//   // Getters
//   ApiResponse<AuthUserModel> get loginResponse => _loginResponse.value;
//   ApiResponse<AuthUserModel> get registerResponse => _registerResponse.value;
//   ApiResponse<bool> get logoutResponse => _logoutResponse.value;
//   ApiResponse<AuthUserModel> get profileResponse => _profileResponse.value;
//   ApiResponse<AuthUserModel> get updateProfileResponse => _updateProfileResponse.value;
//   ApiResponse<AuthUserModel> get uploadProfileImageResponse => _uploadProfileImageResponse.value;
//   ApiResponse<bool> get changePasswordResponse => _changePasswordResponse.value;
//   ApiResponse<bool> get forgotPasswordResponse => _forgotPasswordResponse.value;
//   ApiResponse<bool> get resetPasswordResponse => _resetPasswordResponse.value;

//   // Login
//   Future<void> login({
//     required String email,
//     required String password,
//   }) async {
//     _loginResponse.value = ApiResponse<AuthUserModel>.loading();

//     final response = await _authRepository.login(
//       email: email,
//       password: password,
//     );

//     _loginResponse.value = response;
//   }

//   // Register
//   Future<void> register({
//     required String name,
//     required String email,
//     required String password,
//     String? phone,
//   }) async {
//     _registerResponse.value = ApiResponse<AuthUserModel>.loading();

//     final response = await _authRepository.register(
//       name: name,
//       email: email,
//       password: password,
//       phone: phone,
//     );

//     _registerResponse.value = response;
//   }

//   // Logout
//   Future<void> logout() async {
//     _logoutResponse.value = ApiResponse<bool>.loading();

//     final response = await _authRepository.logout();

//     _logoutResponse.value = response;
//   }

//   // Get profile
//   Future<void> getProfile() async {
//     _profileResponse.value = ApiResponse<AuthUserModel>.loading();

//     final response = await _authRepository.getProfile();

//     _profileResponse.value = response;
//   }

//   // Update profile
//   Future<void> updateProfile({
//     required String name,
//     String? phone,
//   }) async {
//     _updateProfileResponse.value = ApiResponse<AuthUserModel>.loading();

//     final response = await _authRepository.updateProfile(
//       name: name,
//       phone: phone,
//     );

//     _updateProfileResponse.value = response;
//   }

//   // Upload profile image
//   Future<void> uploadProfileImage({
//     required File image,
//   }) async {
//     _uploadProfileImageResponse.value = ApiResponse<AuthUserModel>.loading();

//     final response = await _authRepository.uploadProfileImage(
//       image: image,
//     );

//     _uploadProfileImageResponse.value = response;
//   }

//   // Change password
//   Future<void> changePassword({
//     required String currentPassword,
//     required String newPassword,
//   }) async {
//     _changePasswordResponse.value = ApiResponse<bool>.loading();

//     final response = await _authRepository.changePassword(
//       currentPassword: currentPassword,
//       newPassword: newPassword,
//     );

//     _changePasswordResponse.value = response;
//   }

//   // Forgot password
//   Future<void> forgotPassword({
//     required String email,
//   }) async {
//     _forgotPasswordResponse.value = ApiResponse<bool>.loading();

//     final response = await _authRepository.forgotPassword(
//       email: email,
//     );

//     _forgotPasswordResponse.value = response;
//   }

//   // Reset password
//   Future<void> resetPassword({
//     required String token,
//     required String email,
//     required String password,
//   }) async {
//     _resetPasswordResponse.value = ApiResponse<bool>.loading();

//     final response = await _authRepository.resetPassword(
//       token: token,
//       email: email,
//       password: password,
//     );

//     _resetPasswordResponse.value = response;
//   }

//   // Check if user is logged in
//   Future<bool> isLoggedIn() async {
//     return await _authRepository.isLoggedIn();
//   }

//   // Get current user
//   Future<AuthUserModel?> getCurrentUser() async {
//     return await _authRepository.getCurrentUser();
//   }
// }
