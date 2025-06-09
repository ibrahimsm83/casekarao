import 'package:casekarao/export_casekarao.dart';
import 'package:casekarao/utils/share_preference.dart';
import 'package:casekarao/utils/toast_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:casekarao/core/network/network_managers.dart';

class LoginController extends GetxController {
  final NetworkManagers networkManager = Get.find();
  final isUserRoleController = Get.find<UserRoleController>();

  // Text controllers for form fields
  final TextEditingController phoneNumberController = TextEditingController(text: "12345678",);
  final TextEditingController passwordController = TextEditingController(text: "Abcd@12345",);

  // Focus nodes
  final FocusNode phoneNumberFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();

  // Form key
  final loginFormKey = GlobalKey<FormState>();

  // @override
  // void onInit() {
  //   super.onInit();
  //   phoneNumberFocusNode.addListener(() {
  //     if (!phoneNumberFocusNode.hasFocus) {
  //       formatPhoneNumber();
  //     }
  //   });
  // }

  // /// Format phone number by removing spaces
  // void formatPhoneNumber() {
  //   phoneNumberController.text = phoneNumberController.text.replaceAll(" ", "");
  // }

  /// Login user
  Future<void> login() async {
    if (!loginFormKey.currentState!.validate()) {
      return;
    }

    final data = {
      'phone': phoneNumberController.text.trim(),
      'password': passwordController.text.trim(),
    };

    try {
      final response = await networkManager.postRequest(
        isUserRoleController.isUser ? '/client/login' : '/lawyer/login',
        data,
      );

      if (response.data['status'] == true && response.data['data'] != null) {
        response.data['data']['isUser'] = isUserRoleController.isUser;
        UserModel user = UserModel.fromJson(response.data);

        SharedPreferencesHelper.saveAuthToken(user.data.apiToken);
        SharedPreferencesHelper.saveUser(user);
        SharedPreferencesHelper.saveUserRole(isUserRoleController.isUser);

        if (isUserRoleController.isUser) {
          Get.toNamed(CustomRouteNames.kDashboardScreenRoute);
        } else {
          Get.toNamed(
            CustomRouteNames.kSetupProfileScreenRoute,
            arguments: user,
          );
        }
        
        GetToast.show('Success', responce: response);
      } else {
        GetToast.show("Error", responce: response);
      }
    } catch (e) {
      GetToast.show("Error", e: e);
    }
  }

  /// Navigate back
  void goBack() {
    Get.back();
  }

  /// Navigate to create account screen
  void goToCreateAccount() {
    Get.toNamed(CustomRouteNames.kCreateNewAccountScreenRoute);
  }

  @override
  void onClose() {
    phoneNumberController.dispose();
    passwordController.dispose();
    phoneNumberFocusNode.dispose();
    passwordFocusNode.dispose();
    super.onClose();
  }
}
