import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../controller/setup_profile_controller.dart';
import '../../export_casekarao.dart';

class SetupProfileScreen extends StatelessWidget {
  const SetupProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SetupProfileController>(
      init: SetupProfileController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: ColorManager.kBackgroundColor,
          body: Padding(
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
                  AppStrings.setupProfile,
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
                Flexible(
                  child: ListView(
                    children: <Widget>[
                      listTile(onTap: () {controller.navigateToSection(AppStrings.personalInformation);}, title: AppStrings.personalInformation, data: controller.userData),
                      listTile(onTap: () {  controller.navigateToSection(AppStrings.legalExperience);}, title: AppStrings.legalExperience, data: controller.userData),
                      listTile(onTap: () {  controller.navigateToSection(AppStrings.educationAndCertifications);}, title: AppStrings.educationAndCertifications, data: controller.userData),
                      listTile(onTap: () {  controller.navigateToSection(AppStrings.businessAndAvailability);}, title: AppStrings.businessAndAvailability, data: controller.userData),
                      listTile(onTap: () {  controller.navigateToSection(AppStrings.governmentIssuedIDUpload);}, title: AppStrings.governmentIssuedIDUpload, data: controller.userData),
                      listTile(onTap: () {  controller.navigateToSection(AppStrings.barIDCardUpload);}, title: AppStrings.barIDCardUpload, data: controller.userData),
                      listTile(onTap: () {  controller.navigateToSection(AppStrings.selfieForIdentityVerification);}, title: AppStrings.selfieForIdentityVerification, data: controller.userData),
                      listTile(onTap: () {  controller.navigateToSection(AppStrings.optionalDetails + AppStrings.enhancingProfile);}, title: AppStrings.optionalDetails + AppStrings.enhancingProfile, data: controller.userData),
                    ],
                  ),
                ),
                SizedBox(height: AppSize.s8.h),
                Text(
                  AppStrings.noteCompleteAllRequired,
                  style: getmediumStyle(
                    color: ColorManager.kDarkGreyColor,
                    fontSize: ScreenUtil().setSp(AppSize.s12),
                  ),
                ),
                _button(
                  text: AppStrings.saveAndContinue,
                  onTap: controller.saveAndContinue,
                ),
                SizedBox(height: AppSize.s8.h),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget listTile({Function()? onTap, String? title, UserModel? data}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      //padding: const EdgeInsets.all(8.0),
      child: ListTile(
        onTap: onTap,
        // minTileHeight parameter removed as it's not supported in this Flutter version
        tileColor: ColorManager.kWhiteColor,
        title: Text(
          title ?? "",
          style: getmediumStyle(color: ColorManager.primary, fontSize: 14.sp),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s14.r), // Set border radius
        ),
        trailing: Container(
          padding: EdgeInsets.all(0),
          height: 20.h,
          width: 20.w,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color:
                true ? ColorManager.kGreenColor : ColorManager.kBackgroundColor,
          ),
          child: Icon(
            Icons.check,
            size: 20,
            color: true ? ColorManager.kWhiteColor : ColorManager.kGreyColor,
          ),
        ),
      ),
    );
  }

  Widget _button({
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
