import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../export_casekarao.dart';
import '../../controller/setup_profile_controller.dart';

class PersonalInformationScreen extends StatelessWidget {
  const PersonalInformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SetupProfileController>(
      init: SetupProfileController(),
      builder: (controller) {
        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            backgroundColor: ColorManager.kBackgroundColor,
            body: SingleChildScrollView(
              child: Form(
                key: controller.personalInfoFormKey,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppSize.sizeWidth(context) * 0.05,
                  ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: AppSize.sizeHeight(context) * 0.05),
                  InkWell(
                    onTap: controller.goBack,
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
                    AppStrings.personalInformation,
                    style: getsemiboldStyle(
                      color: ColorManager.primary,
                      fontSize: ScreenUtil().setSp(AppSize.s24),
                    ),
                  ),
                  SizedBox(height: AppSize.s1_5),
                  Text(
                    AppStrings
                        .createYourLawyerProfileWithAccurateDetailsToHelpUsersFindYouEasily,
                    style: getmediumStyle(
                      color: ColorManager.kDarkGreyColor,
                      fontSize: ScreenUtil().setSp(AppSize.s12),
                    ),
                  ),
                  SizedBox(height: AppSize.s8.h),
                  Align(
                    alignment: Alignment.center,
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage(
                        ImageAssets.userImage,
                      ), // Local image
                    ),
                  ),
                  SizedBox(height: AppSize.s8.h),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      controller.profileData.value?.data.name ?? "User",
                      style: getsemiboldStyle(
                        color: ColorManager.primary,
                        fontSize: ScreenUtil().setSp(AppSize.s16),
                      ),
                    ),
                  ),
                  SizedBox(height: AppSize.s8.h),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      decoration: BoxDecoration(
                        color: ColorManager.kLightBlueColor.withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8.0,
                              ),
                              child: SvgPicture.asset(ImageAssets.cameraIcon),
                            ),
                            Text(
                              AppStrings.uploadImage,
                              style: getRegularStyle(
                                color: ColorManager.secondary,
                                fontSize: ScreenUtil().setSp(AppSize.s16),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: AppSize.s8.h),
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
                        return "Enter full name";
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
                      AppStrings.emailAddress,
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
                      AppStrings.phoneNumber,
                      style: getmediumStyle(
                        color: ColorManager.kDarkGreyColor,
                        fontSize: ScreenUtil().setSp(AppSize.s12),
                      ),
                    ),
                  ),
          
                  CustomTextFormField(
                    keyboardType: TextInputType.number,
                    enabled: false,
                    hintText: AppStrings.phoneHintText,
                    controller: controller.phoneNumberController,
                    fillColor: ColorManager.kWhiteColor,
                    focusNode: controller.phoneNumberFocusNode,
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
                      AppStrings.dateOfBirth,
                      style: getmediumStyle(
                        color: ColorManager.kDarkGreyColor,
                        fontSize: ScreenUtil().setSp(AppSize.s12),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Flexible(
                        child: CustomTextFormField(
                          keyboardType: TextInputType.number,
                          hintText: AppStrings.dD,
                          textAlign: TextAlign.center,
                          controller: controller.dateController,
                          fillColor: ColorManager.kWhiteColor,
                          focusNode: controller.dateFocusNode,
                          horizontalMergin: 0.0,
                          validator: (String? val) {
                            if (val == null || val.isEmpty) {
                              return "Enter date";
                            }
                            return null;
                          },
                        ),
                      ),
                      Flexible(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.0),
                          child: CustomTextFormField(
                            keyboardType: TextInputType.number,
                            hintText: AppStrings.mM,
                            textAlign: TextAlign.center,
                            controller: controller.monthController,
                            fillColor: ColorManager.kWhiteColor,
                            focusNode: controller.monthFocusNode,
                            horizontalMergin: 0.0,
                            validator: (String? val) {
                              if (val == null || val.isEmpty) {
                                return "Enter month";
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                      Flexible(
                        child: CustomTextFormField(
                          keyboardType: TextInputType.number,
                          hintText: AppStrings.yYYY,
                          textAlign: TextAlign.center,
                          controller: controller.yearController,
                          fillColor: ColorManager.kWhiteColor,
                          focusNode: controller.yearFocusNode,
                          horizontalMergin: 0.0,
                          validator: (String? val) {
                            if (val == null || val.isEmpty) {
                              return "Enter year";
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: AppSize.s10.h),
                  _buildButton(
                    text: AppStrings.submit,
                    onTap: controller.submitPersonalInfo,
                  ),
          
                  SizedBox(height: 5.h),
                ],
              ),
            ),
          ),
                ),
              ),
        );
      },
    );
  }

  Widget _buildButton({
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

}
