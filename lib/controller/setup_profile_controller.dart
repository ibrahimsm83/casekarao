// import 'package:casekarao/core/network/network_managers.dart';  
// import 'package:casekarao/controller/user_role_controller.dart';
import 'package:casekarao/utils/share_preference.dart';
import 'package:casekarao/utils/toast_service.dart';
import 'package:get/get.dart';
import '../core/network/network_managers.dart';
// import 'create_new_account_controller.dart';
// import '../model/auth_user_model.dart';
// import '../presentation/resources/route_management/custom_route_name.dart';
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
        Get.toNamed(CustomRouteNames.kOptionalDetailsScreenRoute);
        break;
    }
  }

  Future<void> optionalDetails( String bio, String languages) async {
    final data = {
        'bio':bio,
        'languages':languages,
        'type': type,
        // 'api_token': profileData.value!.apiToken,
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

          // if (isUserRoleController.isUser) {
          //   Get.toNamed(CustomRouteNames.kDashboardScreenRoute);
          // } else {
          //   Get.toNamed(
          //     CustomRouteNames.kSetupProfileScreenRoute,
          //     arguments: user,
          //   );
          // }
          // Show success message
          GetToast.show('Success', responce: response);
          update();
        } else {
          // Handle API error response
          GetToast.show("Error", responce: response);
        }
      } catch (e) {
        GetToast.show("Error", e: e,);
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
