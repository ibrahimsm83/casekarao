import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../export_casekarao.dart';

class LetsGetStartedView extends StatefulWidget {
  const LetsGetStartedView({super.key});

  @override
  State<LetsGetStartedView> createState() => _LetsGetStartedViewState();
}

class _LetsGetStartedViewState extends State<LetsGetStartedView> {
  final UserRoleController _userRoleController = Get.find<UserRoleController>();

  @override
  void initState() {
    super.initState();
    // Show the user type selection popup when the screen loads
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showUserTypeSelectionDialog();
    });
  }

  void _showUserTypeSelectionDialog() async {
    // Use AppHelper to check if we have internet connection
    // final hasInternet = await AppHelper.hasInternetConnection();

    // if (!mounted) return; // Check if widget is still mounted

    // if (!hasInternet) {
    //   // Show a snackbar if there's no internet connection
    //   AppHelper.showSnackBar(
    //     'No internet connection. Please check your network.',
    //     isError: true,
    //   );
    // }

    // Show the dialog regardless of internet connection
    showDialog(
      context: context,
      barrierDismissible: false, // User must select an option
      builder: (BuildContext context) {
        return _buildUserTypeSelectionDialog();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.kBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: AppSize.sizeHeight(context) * 0.05),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Container(
                height: 290.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(22.0.r)),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(ImageAssets.letStartedImage),
                  ),
                ),
              ),
            ),
            SizedBox(height: AppSize.sizeHeight(context) * 0.03),
            Text(
              AppStrings.letsGetStarted,
              style: getboldStyle(
                color: ColorManager.primary,
                fontSize: ScreenUtil().setSp(AppSize.s28),
              ),
            ),
            SizedBox(height: AppSize.s10.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                AppStrings.createAKaseKaraoAccountOrLogin,
                textAlign: TextAlign.center,
                style: getmediumStyle(
                  color: ColorManager.primary,
                  fontSize: ScreenUtil().setSp(AppSize.s14),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: button(
                text: AppStrings.continueWithPhoneNumber,
                iconPath: ImageAssets.phoneIcon,
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    CustomRouteNames.kCreateNewAccountScreenRoute,
                    arguments: {'isPhoneOnly': true},
                  );
                },
              ),
            ),
            Text(
              AppStrings.or,
              textAlign: TextAlign.center,
              style: getRegularStyle(
                color: ColorManager.primary,
                fontSize: ScreenUtil().setSp(AppSize.s14),
              ),
            ),
            button(
              text: AppStrings.continueWithApple,
              iconPath: ImageAssets.appleIcon,
              onTap: () {},
              color: ColorManager.kWhiteColor,
              fontColor: ColorManager.primary,
            ),
            button(
              text: AppStrings.continueWithGoogle,
              iconPath: ImageAssets.googleIcon,
              onTap: () {},
              color: ColorManager.kWhiteColor,
              fontColor: ColorManager.primary,
            ),
            CustomTextSpan(
              text1: AppStrings.alreadyHaveAnAccount,
              text2: AppStrings.login,
              onTap: () {
                Navigator.pushNamed(
                  context,
                  CustomRouteNames.kLoginScreenRoute,
                );
              },
            ),
            SizedBox(height: 5.h),
          ],
        ),
      ),
    );
  }

  Widget button({
    Function()? onTap,
    String? text,
    Color? color,
    Color? fontColor,
    String? iconPath,
  }) {
    return CustomButton(
      color: color ?? ColorManager.primary,
      iconPath: iconPath,
      isLeadingIcon: iconPath != null,
      text: text ?? "",
      style: getmediumStyle(
        color: fontColor ?? ColorManager.kWhiteColor,
        fontSize: AppSize.s14.sp,
      ),
      onTap: onTap,
    );
  }

  Widget _buildUserTypeSelectionDialog() {
    String? selectedUserType;

    return StatefulBuilder(
      builder: (context, setState) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: ColorManager.kWhiteColor,
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Select User Type',
                  style: getsemiboldStyle(
                    color: ColorManager.primary,
                    fontSize: FontSize.s16.sp,
                  ),
                ),
                SizedBox(height: 20.h),
                // Dropdown for user type selection
                SizedBox(
                  height: 45.h,
                  child: DropdownButtonFormField<String>(
                    value: selectedUserType,
                    style: getRegularStyle(color: ColorManager.primary),
                    dropdownColor: ColorManager.kWhiteColor,
                    icon: Padding(
                      padding: EdgeInsets.only(right: 8.0),
                      child: SvgPicture.asset(
                        ImageAssets.arrowDownIcon,
                        colorFilter: ColorFilter.mode(
                          ColorManager.kGreyColor,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: ColorManager.kWhiteColor,
                      contentPadding: EdgeInsets.only(left: 10.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0.r),
                        borderSide: BorderSide(color: ColorManager.secondary),
                      ),
                      hintText: "Select user type",
                      hintStyle: getRegularStyle(
                        color: ColorManager.kHintTextColor,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0.r),
                        borderSide: BorderSide(
                          color: ColorManager.kTitleBgColor,
                      ),),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0.r),
                        borderSide: BorderSide(
                          color: ColorManager.kTitleBgColor,
                      ),)
                    ),
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedUserType = newValue;
                      });
                    },
                    items:
                        ["User", "Lawyer"].map((String userType) {
                          return DropdownMenuItem<String>(
                            value: userType,
                            child: Text(userType),
                          );
                        }).toList(),
                  ),
                ),
                SizedBox(height: 20.h),
                // Done button
                button(
                  text: "Done",
                  color: ColorManager.primary,
                  onTap: () {
                    if (selectedUserType != null) {
                      // Set the global user type
                      final isUserRole = selectedUserType == "User";

                      // Update both the controller and AppHelper
                      _userRoleController.isUser = isUserRole;
                     // AppHelper.saveUserRole(isUserRole);

                      // Show success message
                      // AppHelper.showSnackBar(
                      //   'User type set to $selectedUserType',
                      //   isError: false,
                      // );

                      Navigator.of(context).pop();
                    } else {
                      // Show error message if no selection is made
                      // AppHelper.showSnackBar(
                      //   'Please select a user type',
                      //   isError: true,
                      // );
                    }
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
