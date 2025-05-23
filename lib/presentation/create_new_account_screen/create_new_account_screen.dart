import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../export_casekarao.dart';

class CreateNewAccountScreen extends StatefulWidget {
  const CreateNewAccountScreen({super.key});

  @override
  State<CreateNewAccountScreen> createState() => _CreateNewAccountScreenState();
}

class _CreateNewAccountScreenState extends State<CreateNewAccountScreen> {
  // Initialize the controller
  final CreateNewAccountController controller = Get.put(CreateNewAccountController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.kBackgroundColor,
      body: SingleChildScrollView(
        child: Form(
          key: controller.formKey,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppSize.sizeWidth(context) * 0.05,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: AppSize.sizeHeight(context) * 0.05),
                InkWell(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    height: 44.h,
                    width: 44.h,
                    decoration: BoxDecoration(
                      color: ColorManager.kWhiteColor,
                      borderRadius: BorderRadius.all(Radius.circular(16.r)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: SvgPicture.asset(ImageAssets.backArrowIcon),
                    ),
                  ),
                ),
                SizedBox(height: AppSize.sizeHeight(context) * 0.01),
                Text(
                  AppStrings.letsCreateNewAccount,
                  style: getsemiboldStyle(
                    color: ColorManager.primary,
                    fontSize: ScreenUtil().setSp(AppSize.s24),
                  ),
                ),
                SizedBox(height: AppSize.s8.h),
                Text(
                  AppStrings.createAnAccountByFillingInTheDataBelow,
                  style: getmediumStyle(
                    color: ColorManager.kDarkGreyColor,
                    fontSize: ScreenUtil().setSp(AppSize.s14),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: AppSize.s20.h,
                    bottom: AppSize.s6.h,
                  ),
                  child: Text(
                    AppStrings.fullName,
                    style: getmediumStyle(
                      color: ColorManager.kDarkGreyColor,
                      fontSize: ScreenUtil().setSp(AppSize.s12),
                    ),
                  ),
                ),
                CustomTextFormField(
                  hintText: AppStrings.fullNameHintText,
                  controller: controller.fullNameController,
                  fillColor: ColorManager.kWhiteColor,
                  focusNode: controller.fullNameFocusNode,
                  horizontalMergin: 0.0,
                  validator: (String? val) {
                    if (val == null || val.isEmpty) {
                      return "Enter name";
                    }
                    return null;
                  },
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: AppSize.s10.h,
                    bottom: AppSize.s6.h,
                  ),
                  child: Text(
                    AppStrings.email,
                    style: getmediumStyle(
                      color: ColorManager.kDarkGreyColor,
                      fontSize: ScreenUtil().setSp(AppSize.s12),
                    ),
                  ),
                ),
                CustomTextFormField(
                  hintText: AppStrings.emailHintText,
                  controller: controller.emailController,
                  fillColor: ColorManager.kWhiteColor,
                  focusNode: controller.emailFocusNode,
                  horizontalMergin: 0.0,
                  validator: (String? val) {
                    if (val == null || val.isEmpty) {
                      return AppStrings.enterEmailAddress;
                    } else if (val.isValidEmail) {
                      return null;
                    }
                    return 'Invalid Email';
                  },
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: AppSize.s10.h,
                    bottom: AppSize.s6.h,
                  ),
                  child: Text(
                    AppStrings.phone,
                    style: getmediumStyle(
                      color: ColorManager.kDarkGreyColor,
                      fontSize: ScreenUtil().setSp(AppSize.s12),
                    ),
                  ),
                ),

                CustomTextFormField(
                  hintText: AppStrings.phoneHintText,
                  controller: controller.phoneNumberController,
                  fillColor: ColorManager.kWhiteColor,
                  focusNode: controller.phoneFocusNode,
                  horizontalMergin: 0.0,
                  validator: (String? val) {
                    if (val == null || val.isEmpty) {
                      return "Enter phone number";
                    }
                    return null;
                  },
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: AppSize.s10.h,
                    bottom: AppSize.s6.h,
                  ),
                  child: Text(
                    AppStrings.password,
                    style: getmediumStyle(
                      color: ColorManager.kDarkGreyColor,
                      fontSize: ScreenUtil().setSp(AppSize.s12),
                    ),
                  ),
                ),
                CustomTextFormField(
                  hintText: AppStrings.password,
                  controller: controller.passwordController,
                  fillColor: ColorManager.kWhiteColor,
                  focusNode: controller.passwordFocusNode,
                  obscureText: true,
                  horizontalMergin: 0.0,
                  validator: (String? val) {
                    if (val == null || val.isEmpty) {
                      return AppStrings.enterPassword;
                    } else if (val.isValidPassword) {
                      return null;
                    }
                    return AppStrings
                        .enterPassword; //AppStrings.passwordValidator;
                  },
                ),
                SizedBox(height: AppSize.s10.h),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    AppStrings.passwordValidator,
                    style: getRegularStyle(
                      color: ColorManager.kDarkGreyColor,
                      fontSize: ScreenUtil().setSp(AppSize.s12),
                    ),
                  ),
                ),
                SizedBox(height: AppSize.s10.h),
                // Progress Bar for Password Strength
                Obx(() => LinearProgressIndicator(
                  borderRadius: BorderRadius.circular(10),
                  value: controller.passwordStrength,
                  backgroundColor: Colors.grey[300],
                  color:
                      controller.passwordStrength < 0.34
                          ? ColorManager.secondary
                          : controller.passwordStrength < 0.67
                          ? ColorManager.secondary
                          : ColorManager.secondary,
                  minHeight: 8,
                )),
                SizedBox(height: AppSize.s10.h),
                // Register button with loading state
                Obx(() {
                  final registerStatus = controller.registerResponse.status;

                  return button(
                    text: registerStatus == Status.LOADING
                        ? "Registering..."
                        : AppStrings.register,
                    onTap: registerStatus == Status.LOADING
                        ? null
                        : () {
                            if (controller.formKey.currentState!.validate()) {
                              if (controller.phoneNumberController.text.isNotEmpty) {
                                // Call register with isLawyer=true for lawyer registration
                                controller.register(isLawyer: true);
                              } else {
                                CustomSnacksBar.showSnackBar(
                                  context,
                                  "Please Enter Phone Number",
                                  icon: Icon(
                                    Icons.error,
                                    color: ColorManager.kWhiteColor,
                                  ),
                                );
                              }
                            }
                          },
                  );
                }),

                // Display registration status message
                Obx(() {
                  final response = controller.registerResponse;

                  if (response.status == Status.COMPLETED) {
                    // Registration successful - show nothing here as we already show a snackbar
                    return SizedBox(height: 10.h);
                  } else if (response.status == Status.ERROR) {
                    // Show error message
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.h),
                      child: Text(
                        "Error: ${response.message}",
                        style: getRegularStyle(
                          color: Colors.red,
                          fontSize: ScreenUtil().setSp(AppSize.s12),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    );
                  } else {
                    return SizedBox(height: 10.h);
                  }
                }),
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

                Row(
                  children: [
                    Flexible(
                      child: button(
                        text: AppStrings.apple,
                        iconPath: ImageAssets.appleIcon,
                        onTap: () {},
                        color: ColorManager.kWhiteColor,
                        fontColor: ColorManager.primary,
                      ),
                    ),
                    SizedBox(width: AppSize.s10.w),
                    Flexible(
                      child: button(
                        text: AppStrings.google,
                        iconPath: ImageAssets.googleIcon,
                        onTap: () {},
                        color: ColorManager.kWhiteColor,
                        fontColor: ColorManager.primary,
                      ),
                    ),
                  ],
                ),

                textSpan(
                  text1: AppStrings.byProceedingYouAgreeToThe,
                  text2: "${AppStrings.termsAndConditions} and\t${AppStrings.privacyPolicy}",
                  onTap: () {
                    // Navigator.pushNamed(
                    //   context,
                    //   CustomRouteNames.kLoginScreenRoute,
                    // );
                  },
                ),
                SizedBox(height: 5.h),
              ],
            ),
          ),
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
      horizontalMargin: 0.0,
      iconPath: iconPath,
      isLeadingIcon: true,
      text: text ?? "",

      style: getmediumStyle(
        color: fontColor ?? ColorManager.kWhiteColor,
        fontSize: AppSize.s14.sp,
      ),
      onTap: onTap,
    );
  }

  Widget textSpan({
    String? text1,
    String? text2,
    BuildContext? context,
    Function()? onTap,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppPadding.p14,
        vertical: AppPadding.p10,
      ),
      alignment: Alignment.center,
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          text: text1,
          style: getRegularStyle(
            color: ColorManager.kDarkGreyColor,
            fontSize: ScreenUtil().setSp(AppSize.s12),
          ),
          children: <TextSpan>[
            TextSpan(
              text: text2,
              style: TextStyle(
                color: ColorManager.primary,
                fontFamily: FontConstants.fontFamily,
                fontWeight: FontWeightManager.bold,
                fontSize: ScreenUtil().setSp(AppSize.s12),
              ),
              recognizer: TapGestureRecognizer()..onTap = onTap,
            ),
          ],
        ),
      ),
    );
  }
}
