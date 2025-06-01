import 'dart:async';
import 'package:casekarao/export_casekarao.dart';
import 'package:casekarao/utils/share_preference.dart';
import 'package:casekarao/utils/toast_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../model/new_user_model.dart';
import 'package:casekarao/core/network/network_managers.dart';

// import '../presentation/resources/route_management/custom_route_name.dart';
//  import '../utils/custom_snacks_bar.dart';

class OtpController extends GetxController {
  final TextEditingController textEditingController = TextEditingController();
  final isUserRoleController = Get.put(UserRoleController());
  final NetworkManagers networkManager = Get.find();

  // Stream controller for error animations (same as existing)
  StreamController<ErrorAnimationType>? errorController;

  // Form key (same as existing)
  final otpFormKey = GlobalKey<FormState>();

  // Simple variables (same as existing)
  String currentText = "";
  bool hasError = false;

  // User data passed from registration
  NewUser? userData;

  @override
  void onInit() {
    super.onInit();
    errorController = StreamController<ErrorAnimationType>.broadcast();

    // Get user data from arguments (same as widget.data)
    if (Get.arguments != null && Get.arguments is NewUser) {
      userData = Get.arguments as NewUser;
    }
  }

  /// Verify OTP (same as existing continue button logic)
  Future<void> verifyOtp() async {
    if (currentText.length != 6) {
      errorController!.add(ErrorAnimationType.shake);
      CustomSnacksBar.showSnackBar(
        Get.context!,
        "Enter OTP code  000000",
        icon: Icon(Icons.check, color: Colors.white),
      );
    } else {
      final data = {
        'otp_token': textEditingController.text.trim(),
        'api_token': userData!.apiToken,
      };
      try {
        final response = await networkManager.postRequest(
          isUserRoleController.isUser
              ? '/client/verify-token'
              : '/lawyer/verify-token',
          data, // Convert model to JSON
        );

        if (response.data['status'] == true && response.data['data'] != null) {
          response.data['data']['isUser'] = isUserRoleController.isUser;
          UserModel user = UserModel.fromJson(
            response.data,
          ); // Pass response.data, not response

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
  }

  /// Resend OTP (same as existing resend button logic)
  Future<void> resendOtp() async {
    final data = {'api_token': userData!.apiToken};
    try {
      final response = await networkManager.postRequest(
        isUserRoleController.isUser
            ? '/user/resend-otp-token'
            : '/lawyer/resend-otp-token',
        data, // Convert model to JSON
      );
      if (response.data['status'] == true && response.data['data'] != null) {
        GetToast.show('Success', responce: response);
      } else {
        // Handle API error response
        GetToast.show("Error", responce: response);
      }
    } catch (e) {
      GetToast.show("Error", e: e);
    }
  }

  @override
  void onClose() {
    //textEditingController.dispose();
    errorController?.close();
    super.onClose();
  }

  /// Handle OTP input changes (same as existing onChanged)
  void onOtpChanged(String value) {
    currentText = value;
  }

  /// Navigate back
  void goBack() {
    Get.back();
  }
}
