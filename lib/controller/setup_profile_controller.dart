import 'package:casekarao/utils/share_preference.dart';
import 'package:casekarao/utils/toast_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../core/network/network_managers.dart';
import '../export_casekarao.dart';

class SetupProfileController extends GetxController {
  final isUserRoleController = Get.put(UserRoleController());
  final NetworkManagers networkManager = Get.find();
  // Profile setup items (same as existing)
  List<String> items = [
    AppStrings.personalInformation,
    AppStrings.legalExperience,
    AppStrings.educationAndCertifications,
    AppStrings.businessAndAvailability,
    AppStrings.governmentIssuedIDUpload,
    AppStrings.barIDCardUpload,
    AppStrings.selfieForIdentityVerification,
    AppStrings.optionalDetails + AppStrings.enhancingProfile,
  ];

  // Selected items list (same as existing)
  List<String> selectedItems = [];

  // User data passed from previous screen
  //late UserModel userData;
  Rx<UserModel?> profileData = Rx<UserModel?>(null);

  // Check if all required fields are completed
  bool isCompleteAllRequiredFields = false;
  String type = '';

  //Optional Details ScreenRoute variable here
  final bioController = TextEditingController();
  String? selectedType;

  // Personal Information form controllers
  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final dateController = TextEditingController();
  final monthController = TextEditingController();
  final yearController = TextEditingController();

  // Personal Information focus nodes
  final fullNameFocusNode = FocusNode();
  final emailFocusNode = FocusNode();
  final phoneNumberFocusNode = FocusNode();
  final dateFocusNode = FocusNode();
  final monthFocusNode = FocusNode();
  final yearFocusNode = FocusNode();

  // Personal Information form key
  final personalInfoFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    // Get user data from arguments
    if (Get.arguments != null && Get.arguments is UserModel) {
      profileData.value = Get.arguments as UserModel;
    }
  }

  /// Check if item is selected
  bool isSelected(String item) {
    return selectedItems.contains(item);
  }

  /// Navigate to specific profile section
  void navigateToSection(String item) {
    switch (item) {
      case AppStrings.personalInformation:
        _populatePersonalInfoFields();
        type = 'profile';
        Get.toNamed(CustomRouteNames.kPersonalInformationScreenRoute);
        break;
      case AppStrings.legalExperience:
        type = 'legal';
        Get.toNamed(CustomRouteNames.kLegalExperienceScreenRoute);
        break;
      case AppStrings.educationAndCertifications:
        type = 'education';
        Get.toNamed(CustomRouteNames.kEducationAndCertificationScreenRoute);
        break;
      case AppStrings.businessAndAvailability:
        type = 'availability';
        Get.toNamed(CustomRouteNames.kBusinessAndAvailabilityScreenRoute);
        break;
      case AppStrings.governmentIssuedIDUpload:
        type = 'gov_id';
        Get.toNamed(CustomRouteNames.kCNICUploadScreenRoute);
        break;
      case AppStrings.barIDCardUpload:
        type = 'bar_id';
        Get.toNamed(CustomRouteNames.kBarIdCardUploadScreenRoute);
        break;
      case AppStrings.selfieForIdentityVerification:
        type = 'selfie';
        Get.toNamed(CustomRouteNames.kIdentityVerificationScreenRoute);
        break;
      default:
        type = 'optional';
        bioController.text = profileData.value!.data.bio;
        selectedType =  profileData.value!.data.languages;
        Get.toNamed(CustomRouteNames.kOptionalDetailsScreenRoute);
        break;
    }
  }

  /// Submit personal information
  Future<void> submitPersonalInfo() async {
    if (!personalInfoFormKey.currentState!.validate()) {
      return;
    }

    // Format date of birth
    String dob = '';
    if (dateController.text.isNotEmpty &&
        monthController.text.isNotEmpty &&
        yearController.text.isNotEmpty) {
      dob = '${yearController.text}-${monthController.text.padLeft(2, '0')}-${dateController.text.padLeft(2, '0')}';
    }

    final data = {
      'name': fullNameController.text.trim(),
      'email': emailController.text.trim(),
      'phone': phoneNumberController.text.trim(),
      'dob': dob,
      'type': 'profile',
    };

    try {
      final response = await networkManager.postRequest(
        isUserRoleController.isUser
            ? '/client/setup-profile'
            : '/lawyer/setup-profile',
        data,
      );

      if (response.data['status'] == true && response.data['data'] != null) {
        response.data['data']['isUser'] = isUserRoleController.isUser;
        UserModel user = UserModel.fromJson(response.data);
        profileData.value = user;

        SharedPreferencesHelper.saveAuthToken(user.data.apiToken);
        SharedPreferencesHelper.saveUser(user);
        SharedPreferencesHelper.saveUserRole(isUserRoleController.isUser);

        GetToast.show('Success', responce: response);

        // Navigate back to setup profile screen
        Get.back();
        update();
      } else {
        GetToast.show("Error", responce: response);
      }
    } catch (e) {
      GetToast.show("Error", e: e);
    }
  }

  Future<void> optionalDetails() async {
    final data = {
      'bio': bioController.text,
      'languages': selectedType,
      'type': type,
    };
    try {
      final response = await networkManager.postRequest(
        isUserRoleController.isUser
            ? '/client/setup-profile'
            : '/lawyer/setup-profile',
        data, // Convert model to JSON
      );

      if (response.data['status'] == true && response.data['data'] != null) {
        response.data['data']['isUser'] = isUserRoleController.isUser;
        UserModel user = UserModel.fromJson(
          response.data,
        ); // Pass response.data, not response
        profileData.value = user;
        SharedPreferencesHelper.saveAuthToken(user.data.apiToken);
        SharedPreferencesHelper.saveUser(user);
        SharedPreferencesHelper.saveUserRole(isUserRoleController.isUser);

        // Show success message
        GetToast.show('Success', responce: response);
        update();
      } else {
        // Handle API error response
        GetToast.show("Error", responce: response);
      }
    } catch (e) {
      GetToast.show("Error", e: e);
    }
  }

  /// Save and continue to next step
  void saveAndContinue() {
    if (isCompleteAllRequiredFields) {
      // If all fields are completed, go to application review
      Get.toNamed(CustomRouteNames.kApplicationUnderReviewScreenRoute);
    } else {
      // Start with personal information
      Get.toNamed(CustomRouteNames.kPersonalInformationScreenRoute);
    }
  }

  /// Populate personal information fields from user data
  void _populatePersonalInfoFields() {
    if (profileData.value != null) {
      fullNameController.text = profileData.value!.data.name;
      emailController.text = profileData.value!.data.email;
      phoneNumberController.text = profileData.value!.data.phone;

      // Parse date of birth if available
      if (profileData.value!.data.dob != null && profileData.value!.data.dob.toString().isNotEmpty) {
        final dobParts = profileData.value!.data.dob.toString().split('-');
        if (dobParts.length == 3) {
          yearController.text = dobParts[0];
          monthController.text = dobParts[1];
          dateController.text = dobParts[2];
        }
      }
    }
  }

  /// Navigate back
  void goBack() {
    Get.back();
  }

  @override
  void onClose() {
    // Dispose personal information controllers
    fullNameController.dispose();
    emailController.dispose();
    phoneNumberController.dispose();
    dateController.dispose();
    monthController.dispose();
    yearController.dispose();
    bioController.dispose();

    // Dispose personal information focus nodes
    fullNameFocusNode.dispose();
    emailFocusNode.dispose();
    phoneNumberFocusNode.dispose();
    dateFocusNode.dispose();
    monthFocusNode.dispose();
    yearFocusNode.dispose();

    super.onClose();
  }
}
