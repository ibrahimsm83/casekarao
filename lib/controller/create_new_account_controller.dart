// import 'package:casekarao/core/network/network_manager.dart';
import 'package:casekarao/core/network/network_managers.dart';
import 'package:casekarao/model/new_user_model.dart';
// import 'package:casekarao/model/user_object_model.dart';
import 'package:casekarao/utils/loading_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import '../core/network/api_response.dart';
import '../core/network/api_service.dart';
import '../model/auth_user_model.dart';
import '../presentation/resources/route_management/custom_route_name.dart';
import 'user_role_controller.dart';

class CreateNewAccountController extends GetxController {
  final NetworkManagers networkManager = Get.find();
  final isUserRoleController = Get.put(UserRoleController());
  NewUser? user; // Make it nullable to avoid LateInitializationError
  final RxString errorMessage = RxString('');
  // Getter to safely access user data
  bool get isUserLoggedIn => user != null;
  String? get userToken => user?.data.apiToken;
  String? get userName => user?.data.name;

  // API service
  final ApiService _apiService = ApiService();

  // // API response
  // final Rx<ApiResponse<AuthUserModel>> _registerResponse =
  //     ApiResponse<AuthUserModel>.initial().obs;

  // // Getter for register response
  // ApiResponse<AuthUserModel> get registerResponse => _registerResponse.value;
  // Form key
  final formKey = GlobalKey<FormState>();

  // Focus nodes
  final FocusNode fullNameFocusNode = FocusNode();
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode phoneFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();

  // Text controllers
  final TextEditingController fullNameController = TextEditingController(
    text: "test user",
  );
  final TextEditingController emailController = TextEditingController(
    text: "test@gmail.com",
  );
  final TextEditingController phoneNumberController = TextEditingController(
    text: "12345678",
  );
  final TextEditingController passwordController = TextEditingController(
    text: "Abcd@12345",
  );

  // Observable variables
  final RxDouble _passwordStrength = 0.0.obs;
  final RxString _password = "".obs;

  // Getters
  double get passwordStrength => _passwordStrength.value;
  String get password => _password.value;

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

  Future<void> createUser(context, {bool isLawyer = true}) async {
    //ShowLoading(context).startLoading();

    final data = {
      'name': fullNameController.text.trim(),
      'email': emailController.text.trim(),
      'phone': phoneNumberController.text.trim(),
      'password': passwordController.text,
      'user_type':
          isUserRoleController.isUser
              ? 1
              : 2, // 2 for lawyer, 1 for regular user
    };
    try {
      final response = await networkManager.postRequest(
        isUserRoleController.isUser ? '/user/register' : '/lawyer/register',
        data, // Convert model to JSON
      );

      if (response.data['status'] == true && response.data['data'] != null) {
        // user = NewUser.fromJson(
        //   response.data,
        // ); // Pass response.data, not response

        // await _apiService.saveAuthToken(response.data!.token);
        // await _apiService.saveUserData(response.data!.toJson());

        // Show success message
        getSnacsackBar(response);
        // Get.snackbar(
        //   'Success',
        //   user!.message, //'Registration successful!',
        //   snackPosition: SnackPosition.BOTTOM,
        //   backgroundColor: Colors.green,
        //   colorText: Colors.white,
        // );

        // ShowLoading(context).stopLoading();
      } else {
        // Handle API error response
        getSnacsackBar(response);
        // Get.snackbar(
        //   'Error',
        //   response.data['message'] ?? 'Registration failed',
        //   snackPosition: SnackPosition.BOTTOM,
        //   backgroundColor: Colors.red,
        //   colorText: Colors.white,
        // );
        //ShowLoading(context).stopLoading();
      }
    } catch (e) {
      errorMessage.value = e.toString();
      // Show error snackbar
      getSnacsackBar('Error',);
      // Get.snackbar(
      //   'Error',
      //   errorMessage.value,
      //   snackPosition: SnackPosition.BOTTOM,
      //   backgroundColor: Colors.red,
      //   colorText: Colors.white,
      // );
    } finally {
      //isLoading.value = false;
      EasyLoading.dismiss();
    }
  }

  // Register user
  Future<void> register(context, {bool isLawyer = false}) async {
    if (formKey.currentState!.validate()) {
      ShowLoading(context).startLoading();

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
            // Check if response is a Map
            if (json is Map<String, dynamic>) {
              final status = json['status'];
              final message = json['message'] ?? '';

              // If status is true/success and data exists
              if (status == true && json['data'] != null) {
                return AuthUserModel.fromJson(json['data']);
              } else {
                // Handle error response - throw exception to be caught by NetworkManager
                throw Exception(
                  message.isNotEmpty ? message : 'Registration failed',
                );
              }
            } else {
              // Handle unexpected response format (like List)
              throw Exception(
                'Unexpected response format: ${json.runtimeType}',
              );
            }
          },
        );

        ShowLoading(context).stopLoading();

        // Handle response
        if (response.status == Status.completed && response.data != null) {
          // Save token and user data
          await _apiService.saveAuthToken(response.data!.token);
          await _apiService.saveUserData(response.data!.toJson());

          // Show success message

          Get.snackbar(
            'Success',
            'Registration successful!',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green,
            colorText: Colors.white,
          );

          // Navigate to OTP verification if needed
          // Get.toNamed('/otp-verification', arguments: {'phone': phoneNumberController.text});
          Navigator.pushNamed(
            context,
            CustomRouteNames.kOtpVerificationScreenRoute,
          );
        } else if (response.status == Status.error) {
          Get.snackbar(
            'Error',
            response.message ?? 'Registration failed',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            colorText: Colors.white,
          );
        } else {
          // Show error message
          Get.snackbar(
            'Error',
            response.message ?? 'Registration failed',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            colorText: Colors.white,
          );
        }
      } catch (e) {
        ShowLoading(context).stopLoading();

        // Show error message
        Get.snackbar(
          'Error',
          'Registration failed: $e',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    }
  }

  getSnacsackBar([dynamic response, String? text = '', dynamic e]) {
    Get.snackbar(
      text !='' ? text! :
      (response.data['status']) == true ? 'Success' : 'Error',
      e ??
          response.data['message'] ??
          'sonething went wrong', //'Registration successful!',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor:
          response.data['status'] == true ? Colors.green : Colors.red,
      colorText: Colors.white,
    );
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

// class CustomLoadingBar {
//   static void showLoading({String message = 'Loading...'}) {
//     Get.dialog(
//       Dialog(
//         backgroundColor: Colors.white,
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               const CircularProgressIndicator(),
//               const SizedBox(height: 16),
//               Text(message),
//             ],
//           ),
//         ),
//       ),
//       barrierDismissible: false,
//     );
//   }
//   static void hideLoading() {
//     if (Get.isDialogOpen ?? false) {
//       Get.back();
//     }
//   }
// }
