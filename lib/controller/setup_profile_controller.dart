// import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import '../model/auth_user_model.dart';
// import '../presentation/resources/route_management/custom_route_name.dart';
import '../export_casekarao.dart';

class SetupProfileController extends GetxController {
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

  @override
  void onInit() {
    super.onInit();

    // Get user data from arguments
    if (Get.arguments != null && Get.arguments is UserModel) {
      profileData.value = Get.arguments as UserModel;
      // UserModel data = Get.arguments.copyWith();
      //profileData.value = userData;
      // profileData.value = data;
    }

    // Check if coming from completed profile
    // if (Get.arguments != null && Get.arguments is bool) {
    //   isCompleteAllRequiredFields = Get.arguments as bool;
    //   if (isCompleteAllRequiredFields) {
    //     selectedItems = List.from(items); // Select all items
    //   }
    // }
  }

  /// Toggle selection of profile setup item (same as existing)
  // void toggleSelection(String item) {
  //   if (selectedItems.contains(item)) {
  //     selectedItems.remove(item);
  //   } else {
  //     selectedItems.add(item);
  //   }
  //   update(); // Update UI
  // }

  /// Check if item is selected
  bool isSelected(String item) {
    return selectedItems.contains(item);
  }

  /// Navigate to specific profile section
  void navigateToSection(String item) {
    switch (item) {
      case AppStrings.personalInformation:
        Get.toNamed(CustomRouteNames.kPersonalInformationScreenRoute);
        break;
      case AppStrings.legalExperience:
        Get.toNamed(CustomRouteNames.kLegalExperienceScreenRoute);
        break;
      case AppStrings.educationAndCertifications:
        Get.toNamed(CustomRouteNames.kEducationAndCertificationScreenRoute);
        break;
      case AppStrings.businessAndAvailability:
        Get.toNamed(CustomRouteNames.kBusinessAndAvailabilityScreenRoute);
        break;
      case AppStrings.governmentIssuedIDUpload:
        Get.toNamed(CustomRouteNames.kCNICUploadScreenRoute);
        break;
      case AppStrings.barIDCardUpload:
        Get.toNamed(CustomRouteNames.kBarIdCardUploadScreenRoute);
        break;
      case AppStrings.selfieForIdentityVerification:
        Get.toNamed(CustomRouteNames.kIdentityVerificationScreenRoute);
        break;
      default:
        Get.toNamed(CustomRouteNames.kOptionalDetailsScreenRoute);
        break;
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

  /// Navigate back
  void goBack() {
    Get.back();
  }

  /// Get completion status message
  // String get completionMessage {
  //   if (selectedItems.isEmpty) {
  //     return "Select profile sections to complete";
  //   } else if (selectedItems.length == items.length) {
  //     return "All sections completed! Ready for review.";
  //   } else {
  //     return "${selectedItems.length}/${items.length} sections completed";
  //   }
  // }

  // /// Check if user can proceed
  // bool get canProceed {
  //   return selectedItems.isNotEmpty;
  // }

  // /// Get user name for display
  // String get userName {
  //   return userData?.data.name ?? 'User';
  // }

  // /// Get user email for display
  // String get userEmail {
  //   return userData?.data.email ?? '';
  // }
}
