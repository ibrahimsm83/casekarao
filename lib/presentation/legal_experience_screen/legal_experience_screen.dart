import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../export_casekarao.dart';
import '../../controller/setup_profile_controller.dart';

class LegalExperienceScreen extends StatelessWidget {
  const LegalExperienceScreen({super.key});

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
                key: controller.legalExperienceFormKey,
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
                    AppStrings.legalExperience,
                    style: getsemiboldStyle(
                      color: ColorManager.primary,
                      fontSize: ScreenUtil().setSp(AppSize.s24),
                    ),
                  ),
                  SizedBox(height: AppSize.s8.h),
                  Text(
                    AppStrings
                        .createYourLawyerProfileWithAccurateDetailsToHelpUsersFindYouEasily,
                    style: getmediumStyle(
                      color: ColorManager.kDarkGreyColor,
                      fontSize: ScreenUtil().setSp(AppSize.s12),
                    ),
                  ),
                  SizedBox(height: AppSize.s8.h),
                  _buildHeading(
                    AppStrings.barLicenseNumberWithIssuingAuthority,
                    AppStrings.required,
                  ),
                  CustomTextFormField(
                    hintText: AppStrings.phoneNumberHintText,
                    controller: controller.barLicenseNumberController,
                    fillColor: ColorManager.kWhiteColor,
                    focusNode: controller.barLicenseNumberFocusNode,
                    horizontalMergin: 0.0,
                    validator: (String? val) {
                      if (val == null || val.isEmpty) {
                        return "Enter License Number";
                      }
                      return null;
                    },
                  ),
                  _buildHeading(
                    AppStrings.jurisdictionStateOfPractice,
                    AppStrings.required,
                  ),
                  _buildJurisdiction(controller),
                  _buildHeading(AppStrings.yearsOfExperience, AppStrings.optional),
                  CustomTextFormField(
                    hintText: AppStrings.ex5Years,
                    controller: controller.yearsOfExpController,
                    fillColor: ColorManager.kWhiteColor,
                    focusNode: controller.yearsOfExpFocusNode,
                    horizontalMergin: 0.0,
                    validator: (String? val) {
                      if (val == null || val.isEmpty) {
                        return "Enter Years of Experience";
                      }
                      return null;
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: AppSize.s8.h,
                      bottom: AppSize.s6.h,
                    ),
                    child: Text(
                      AppStrings.lawFirmOrganizationNameIfApplicable,
                      style: getmediumStyle(
                        color: ColorManager.kDarkGreyColor,
                        fontSize: ScreenUtil().setSp(AppSize.s12),
                      ),
                    ),
                  ),
      
                  CustomTextFormField(
                    hintText: AppStrings.exCityLawSchoolAndCourt,
                    controller: controller.organizationNameController,
                    fillColor: ColorManager.kWhiteColor,
                    focusNode: controller.organizationNameFocusNode,
                    horizontalMergin: 0.0,
                    validator: (String? val) {
                      if (val == null || val.isEmpty) {
                        return "Enter Organization name";
                      }
                      return null;
                    },
                  ),

                  Padding(
                    padding: EdgeInsets.only(
                      top: AppSize.s8.h,
                      bottom: AppSize.s6.h,
                    ),
                    child: Text(
                      AppStrings.practiceAreas,
                      style: getmediumStyle(
                        color: ColorManager.kDarkGreyColor,
                        fontSize: ScreenUtil().setSp(AppSize.s12),
                      ),
                    ),
                  ),

                  CustomTextFormField(
                    hintText: AppStrings.enterTagsHere,
                    controller: controller.practiceAreasController,
                    fillColor: ColorManager.kWhiteColor,
                    focusNode: controller.practiceAreasFocusNode,
                    horizontalMergin: 0.0,
                    onSubmitted: (value) {
                      controller.addPracticeArea(value);
                    },
                  ),

                  SizedBox(height: 10.h),

                  // Display practice area chips
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Obx(() => Wrap(
                      spacing: 8.0,
                      runSpacing: 8.0,
                      children: controller.practiceAreas
                          .map((area) => _buildChip(area, controller))
                          .toList(),
                    )),
                  ),

                  SizedBox(height: AppSize.s20.h),
                  _buildButton(
                    text: AppStrings.submit,
                    onTap: controller.submitLegalExperience,
                  ),

                  SizedBox(height: 5.h),
                ],
              ),
            ),
          ),
        ),
      ));
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

  Widget _buildHeading(String text1, String text2) {
    return Padding(
      padding: EdgeInsets.only(top: AppSize.s8.h, bottom: AppSize.s6.h),
      child: Row(
        children: [
          Text(
            text1,
            style: getmediumStyle(
              color: ColorManager.kDarkGreyColor,
              fontSize: ScreenUtil().setSp(AppSize.s12),
            ),
          ),
          Text(
            text2,
            style: getmediumStyle(
              color: ColorManager.secondary,
              fontSize: ScreenUtil().setSp(AppSize.s12),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildJurisdiction(SetupProfileController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0.0),
      child: SizedBox(
        height: 45,
        child: Obx(() => DropdownButtonFormField<String>(
          value: controller.selectedJurisdiction.value.isEmpty
              ? null
              : controller.selectedJurisdiction.value,
          style: getRegularStyle(color: ColorManager.primary),
          dropdownColor: ColorManager.kWhiteColor,
          icon: Padding(
            padding: const EdgeInsets.only(right: 8.0),
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
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(color: ColorManager.kWhiteColor),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(color: ColorManager.kWhiteColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(color: ColorManager.kWhiteColor),
            ),
            hintText: AppStrings.selectJurisdiction,
            hintStyle: getRegularStyle(color: ColorManager.kHintTextColor),
            floatingLabelBehavior: FloatingLabelBehavior.never,
          ),
          onChanged: (String? newValue) {
            controller.selectedJurisdiction.value = newValue ?? '';
          },
          items: [
            AppStrings.jurisdictionStateOfPractice1,
            AppStrings.selectJurisdiction1,
            AppStrings.selectJurisdiction2,
          ].map((String lang) {
            return DropdownMenuItem<String>(value: lang, child: Text(lang));
          }).toList(),
        )),
      ),
    );
  }

  Widget _buildChip(String label, SetupProfileController controller) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0, bottom: 8.0),
      child: Container(
        decoration: BoxDecoration(
          color: ColorManager.secondary,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                label,
                style: getRegularStyle(
                  color: ColorManager.kWhiteColor,
                  fontSize: ScreenUtil().setSp(AppSize.s14),
                ),
              ),
              const SizedBox(width: 8.0),
              InkWell(
                onTap: () {
                  controller.removePracticeArea(label);
                },
                child: Icon(
                  Icons.close,
                  size: 16.0,
                  color: ColorManager.kWhiteColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
