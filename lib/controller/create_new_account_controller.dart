import 'package:casekarao/core/network/network_managers.dart';
import 'package:casekarao/export_casekarao.dart';
import 'package:casekarao/model/new_user_model.dart';
import 'package:casekarao/utils/toast_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import '../core/network/api_service.dart';
// import 'user_role_controller.dart';

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
  //final ApiService _apiService = ApiService();
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
        user = NewUser.fromJson(
          response.data,
        ); // Pass response.data, not response

          Navigator.pushNamed(context,
            CustomRouteNames.kOtpVerificationScreenRoute,
            arguments: user,
          );

        // await _apiService.saveAuthToken(response.data!.token);
        // await _apiService.saveUserData(response.data!.toJson());

        // Show success message
        GetToast.show('Success', responce: response);
      } else {
        // Handle API error response
        GetToast.show("Error", responce: response);
      }
    } catch (e) {
      GetToast.show("Error", e: e,);
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