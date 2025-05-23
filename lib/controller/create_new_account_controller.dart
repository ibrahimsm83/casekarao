import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/network/api_response.dart';
import '../core/network/api_service.dart';
import '../model/auth_user_model.dart';

class CreateNewAccountController extends GetxController {
  // API service
  final ApiService _apiService = ApiService();

  // API response
  final Rx<ApiResponse<AuthUserModel>> _registerResponse =
      ApiResponse<AuthUserModel>.initial().obs;

  // Getter for register response
  ApiResponse<AuthUserModel> get registerResponse => _registerResponse.value;
  // Form key
  final formKey = GlobalKey<FormState>();

  // Focus nodes
  final FocusNode fullNameFocusNode = FocusNode();
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode phoneFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();

  // Text controllers
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Observable variables
  final RxDouble _passwordStrength = 0.0.obs;
  final RxString _password = "".obs;

  // Getters
  double get passwordStrength => _passwordStrength.value;
  String get password => _password.value;

  @override
  void onInit() {
    super.onInit();
    // Add listener to phone focus node
    phoneFocusNode.addListener(() {
      if (!phoneFocusNode.hasFocus) {
        formatPhoneNumber();
      }
    });

    // Add listener to password controller
    passwordController.addListener(() {
      checkPasswordStrength(passwordController.text);
    });
  }

  // Format phone number
  void formatPhoneNumber() {
    phoneNumberController.text = phoneNumberController.text.replaceAll(" ", "");
  }

  // Check password strength
  void checkPasswordStrength(String password) {
    _password.value = password;
    int strength = 0;

    // Conditions to check password strength
    if (password.length >= 8) strength++;
    if (RegExp(r'(?=.*[A-Z])').hasMatch(password)) strength++;
    if (RegExp(r'(?=.*\d)').hasMatch(password)) strength++;

    // Convert strength to progress bar value (0.0 to 1.0)
    _passwordStrength.value = strength / 3; // 3 is the max strength level
  }

  // Register user
  Future<void> register({bool isLawyer = false}) async {
    if (formKey.currentState!.validate()) {
      // Set loading state
      _registerResponse.value = ApiResponse<AuthUserModel>.loading();

      try {
        // Prepare request data
        final data = {
          'name': fullNameController.text.trim(),
          'email': emailController.text.trim(),
          'phone': phoneNumberController.text.trim(),
          'password': passwordController.text,
          'user_type': isLawyer ? 2 : 1, // 2 for lawyer, 1 for regular user
        };

        // Make API call
        final response = await _apiService.post<AuthUserModel>(
          isLawyer ? '/lawyer/register' : '/user/register',
          data: data,
          fromJson: (json) {
            if (json['status'] != false) {
              // Save token
              final apiToken = json['data']['api_token'] ?? json['api_token'];
              if (apiToken != null) {
                _apiService.saveAuthToken(apiToken.toString());
              }

              // Save user data
              _apiService.saveUserData(json['data']);

              // Return user model
              return AuthUserModel.fromJson(json['data']);
            } else {
              Get.snackbar(
            'Error',
            json['message'],
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green,
            colorText: Colors.white,
          );
            return AuthUserModel.fromJson(json['data']);
            }
          },
        );

        // Update response
        _registerResponse.value = response;

        // Handle successful registration
        if (response.status == Status.COMPLETED) {
          Get.snackbar(
            'Success',
            'Registration successful!',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green,
            colorText: Colors.white,
          );

          // Navigate to OTP verification if needed
          // Get.toNamed('/otp-verification', arguments: {'phone': phoneNumberController.text});
        }
      } catch (e) {
        // Handle error
        _registerResponse.value = ApiResponse<AuthUserModel>.error(
          'An error occurred during registration: $e',
        );

        Get.snackbar(
          'Error',
          'Registration failed: ${_registerResponse.value.message}',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    }
  }

  @override
  void onClose() {
    // Dispose controllers and focus nodes
    fullNameController.dispose();
    emailController.dispose();
    phoneNumberController.dispose();
    passwordController.dispose();

    fullNameFocusNode.dispose();
    emailFocusNode.dispose();
    phoneFocusNode.dispose();
    passwordFocusNode.dispose();

    super.onClose();
  }
}
