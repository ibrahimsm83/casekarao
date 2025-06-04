import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../export_casekarao.dart';
import '../../controller/setup_profile_controller.dart';

class EducationAndCertificationScreen extends StatelessWidget {
  const EducationAndCertificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SetupProfileController>(
      init: SetupProfileController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: ColorManager.kBackgroundColor,
          body: SingleChildScrollView(
            child: Form(
              key: controller.educationFormKey,
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
                  AppStrings.educationAndCertifications,
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
                Padding(
                  padding: EdgeInsets.only(
                    top: AppSize.s10.h,
                    bottom: AppSize.s6.h,
                  ),
                  child: Text(
                    AppStrings.lawSchoolAttended,
                    style: getmediumStyle(
                      color: ColorManager.kDarkGreyColor,
                      fontSize: ScreenUtil().setSp(AppSize.s12),
                    ),
                  ),
                ),
                CustomTextFormField(
                  hintText: AppStrings.exLawSchool,
                  controller: controller.lawSchoolController,
                  fillColor: ColorManager.kWhiteColor,
                  focusNode: controller.lawSchoolFocusNode,
                  horizontalMergin: 0.0,
                  validator: (String? val) {
                    if (val == null || val.isEmpty) {
                      return "Enter law school";
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
                    AppStrings.degreeEarned,
                    style: getmediumStyle(
                      color: ColorManager.kDarkGreyColor,
                      fontSize: ScreenUtil().setSp(AppSize.s12),
                    ),
                  ),
                ),

                CustomTextFormField(
                  hintText: AppStrings.exLaw,
                  controller: controller.degreeController,
                  fillColor: ColorManager.kWhiteColor,
                  focusNode: controller.degreeFocusNode,
                  horizontalMergin: 0.0,
                  validator: (String? val) {
                    if (val == null || val.isEmpty) {
                      return "Enter Degree law";
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
                    AppStrings.yearOfGraduation,
                    style: getmediumStyle(
                      color: ColorManager.kDarkGreyColor,
                      fontSize: ScreenUtil().setSp(AppSize.s12),
                    ),
                  ),
                ),

                CustomTextFormField(
                  keyboardType: TextInputType.number,
                  hintText: AppStrings.ex2012,
                  controller: controller.graduationYearController,
                  fillColor: ColorManager.kWhiteColor,
                  focusNode: controller.graduationYearFocusNode,
                  horizontalMergin: 0.0,
                  validator: (String? val) {
                    if (val == null || val.isEmpty) {
                      return "Enter years of Gradution";
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
                    AppStrings.additionalCertificationsIfAny,
                    style: getmediumStyle(
                      color: ColorManager.kDarkGreyColor,
                      fontSize: ScreenUtil().setSp(AppSize.s12),
                    ),
                  ),
                ),

                CustomTextFormField(
                  hintText: AppStrings.exCertificateName,
                  controller: controller.certificationsController,
                  fillColor: ColorManager.kWhiteColor,
                  focusNode: controller.certificationsFocusNode,
                  horizontalMergin: 0.0,
                  validator: (String? val) {
                    if (val == null || val.isEmpty) {
                      return "Enter Certification name";
                    }
                    return null;
                  },
                ),
                SizedBox(height: AppSize.s20.h),

                _buildButton(
                  text: AppStrings.submit,
                  onTap: controller.submitEducationAndCertification,
                ),

                SizedBox(height: 5.h),
              ],
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
}
