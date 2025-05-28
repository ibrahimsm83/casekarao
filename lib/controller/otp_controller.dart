import 'dart:async';
import 'package:casekarao/controller/user_role_controller.dart';
import 'package:casekarao/utils/toast_service.dart';
import 'package:casekarao/widgets/custom_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../model/new_user_model.dart';
import 'package:casekarao/core/network/network_managers.dart';

// import '../presentation/resources/route_management/custom_route_name.dart';
//  import '../utils/custom_snacks_bar.dart';

class OtpController extends GetxController {
  // Text controller for OTP input (same as existing)
  final TextEditingController textEditingController = TextEditingController();
  final isUserRoleController = Get.put(UserRoleController());
  final NetworkManagers networkManager = Get.find();
  
  // Stream controller for error animations (same as existing)
  StreamController<ErrorAnimationType>? errorController;
  
  // Form key (same as existing)
  final formKey = GlobalKey<FormState>();
  
  // Simple variables (same as existing)
  String currentText = "";
  bool hasError = false;
  
  // User data passed from registration
  NewUser? userData;
  
  @override
  void onInit() {
    super.onInit();
    errorController = StreamController<ErrorAnimationType>();
    
    // Get user data from arguments (same as widget.data)
    if (Get.arguments != null && Get.arguments is NewUser) {
      userData = Get.arguments as NewUser;
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
    //update(); // Update UI
  }
  
  /// Verify OTP (same as existing continue button logic)
  Future<void> verifyOtp() async {
    if (currentText.length != 6) {
       errorController!.add(ErrorAnimationType.shake);
      CustomSnacksBar.showSnackBar(
        Get.context!,
        "Enter OTP code  000000",
        icon: Icon(
          Icons.check,
          color: Colors.white,
        ),
      );
    } else {
      final data = {
      'otp_token': textEditingController.text.trim(),
      'api_token': userData!.apiToken,
    };
    try {
      final response = await networkManager.postRequest(
        isUserRoleController.isUser ? '/user/verify-token' : '/lawyer/verify-token',
        data, // Convert model to JSON
      );

      if (response.data['status'] == true && response.data['data'] != null) {
        // user = NewUser.fromJson(
        //   response.data,
        // ); // Pass response.data, not response

          // Navigator.pushNamed(context,
          //   CustomRouteNames.kOtpVerificationScreenRoute,
          //   arguments: user,
          // );

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
      // hasError = false;
      // //update();
      
      // CustomSnacksBar.showSnackBar(
      //   Get.context!,
      //   "OTP Verified!!",
      //   icon: Icon(
      //     Icons.check,
      //     color: Colors.white,
      //   ),
      // );
      
      // Get.toNamed(
      //   CustomRouteNames.kSetupProfileScreenRoute,
      //   arguments: false,
      // );
    }
  }
  
  /// Resend OTP (same as existing resend button logic)
  void resendOtp() {
    // CustomSnacksBar.showSnackBar(
    //   Get.context!,
    //   "OTP sent successfully",
    //   icon: Icon(Icons.check, color: Colors.white),
    // );
  }
  
  /// Navigate back
  void goBack() {
    Get.back();
  }
}
