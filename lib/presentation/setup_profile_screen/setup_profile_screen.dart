import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
// import '../../controller/setup_profile_controller.dart';
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
          // floatingActionButton: FloatingActionButton(
          //   onPressed: () {
          //     // Show Alice HTTP inspector
          //     AliceHelper.showInspector();
          //   },
          //   backgroundColor: ColorManager.secondary,
          //   tooltip: 'Show Network Inspector',
          //   child: Icon(
          //     Icons.network_check,
          //     color: ColorManager.kWhiteColor,
          //   ),
          // ),
          body: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppSize.sizeWidth(context) * 0.05,
            ),
            child: SingleChildScrollView(
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
                  ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: <Widget>[
                      listTile(onTap: () {controller.navigateToSection(AppStrings.personalInformation);}, title: AppStrings.personalInformation, val: controller.profileData.value!.data.isPersonalInfo),
                      listTile(onTap: () {  controller.navigateToSection(AppStrings.legalExperience);}, title: AppStrings.legalExperience, val: controller. profileData.value!.data.isLegalExperience),
                      listTile(onTap: () {  controller.navigateToSection(AppStrings.educationAndCertifications);}, title: AppStrings.educationAndCertifications,  val:  controller.profileData.value!.data.isEducation),
                      listTile(onTap: () {  controller.navigateToSection(AppStrings.businessAndAvailability);}, title: AppStrings.businessAndAvailability,  val:  controller.profileData.value!.data.isBusiness),
                      listTile(onTap: () {  controller.navigateToSection(AppStrings.governmentIssuedIDUpload);}, title: AppStrings.governmentIssuedIDUpload,  val:  controller.profileData.value!.data.isGovIdUploaded),
                      listTile(onTap: () {  controller.navigateToSection(AppStrings.barIDCardUpload);}, title: AppStrings.barIDCardUpload,  val:  controller.profileData.value!.data.isBaridUploaded),
                      listTile(onTap: () {  controller.navigateToSection(AppStrings.selfieForIdentityVerification);}, title: AppStrings.selfieForIdentityVerification,  val:  controller.profileData.value!.data.isSelfie),
                      listTile(onTap: () {  controller.navigateToSection(AppStrings.optionalDetails + AppStrings.enhancingProfile);}, title: AppStrings.optionalDetails + AppStrings.enhancingProfile,  val:  controller.profileData.value!.data.isOptionalDetails),
                    ],
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
                    onTap: 
                    controller.profileData.value!.data.isProfileCompleted == 1?
                    controller.saveAndContinue:null,
                    color: controller.profileData.value!.data.isProfileCompleted == 1
                            ? ColorManager.primary
                            : ColorManager.kGreyColor,
                  ),
                  SizedBox(height: AppSize.s8.h),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget listTile({Function()? onTap, String? title, int? val}) {
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
                val == 1 ? ColorManager.kGreenColor : ColorManager.kBackgroundColor,
          ),
          child: Icon(
            Icons.check,
            size: 20,
            color: val == 1  ? ColorManager.kWhiteColor : ColorManager.kGreyColor,
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
