import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../export_casekarao.dart';

class LegalExperienceScreen extends StatefulWidget {
  const LegalExperienceScreen({super.key});

  @override
  State<LegalExperienceScreen> createState() =>
      _LegalExperienceScreenState();
}

class _LegalExperienceScreenState extends State<LegalExperienceScreen> {
  final _formKey = GlobalKey<FormState>();
  FocusNode node1 = FocusNode();
  FocusNode node2 = FocusNode();
  FocusNode node3 = FocusNode();
  FocusNode node4 = FocusNode();
  FocusNode node5 = FocusNode();
  FocusNode node6 = FocusNode();

  final _barLicenseNumberController = TextEditingController();
  final _yearsOfExpController = TextEditingController();
  final _organizationController = TextEditingController();




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.kBackgroundColor,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppSize.sizeWidth(context!) * 0.05,
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
                  AppStrings.personalInformation,
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
                    top: AppSize.s20.h,
                    bottom: AppSize.s6.h,
                  ),
                  child: Text(
                    AppStrings.barLicenseNumberWithIssuingAuthority,
                    style: getmediumStyle(
                      color: ColorManager.kDarkGreyColor,
                      fontSize: ScreenUtil().setSp(AppSize.s12),
                    ),
                  ),
                ),
                CustomTextFormField(
                  hintText: AppStrings.phoneNumberHintText,
                  controller: _barLicenseNumberController,
                  fillColor: ColorManager.kWhiteColor,
                  focusNode: node1,
                  horizontalMergin: 0.0,
                  validator: (String? val) {
                    if (val == null || val.isEmpty) {
                      return "Enter License Number";
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
                    AppStrings.yearsOfExperience,
                    style: getmediumStyle(
                      color: ColorManager.kDarkGreyColor,
                      fontSize: ScreenUtil().setSp(AppSize.s12),
                    ),
                  ),
                ),
                CustomTextFormField(
                  hintText: AppStrings.ex5Years,
                  controller: _yearsOfExpController,
                  fillColor: ColorManager.kWhiteColor,
                  focusNode: node2,
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
                    top: AppSize.s10.h,
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
                  controller: _organizationController,
                  fillColor: ColorManager.kWhiteColor,
                  focusNode: node3,
                  horizontalMergin: 0.0,
                  validator: (String? val) {
                    if (val == null || val.isEmpty) {
                      return "Enter Organization number";
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
                    AppStrings.practiceAreas,
                    style: getmediumStyle(
                      color: ColorManager.kDarkGreyColor,
                      fontSize: ScreenUtil().setSp(AppSize.s12),
                    ),
                  ),
                ),

                CustomTextFormField(
                  hintText: AppStrings.enterTagsHere,
                  controller: _organizationController,
                  fillColor: ColorManager.kWhiteColor,
                  focusNode: node3,
                  horizontalMergin: 0.0,
                  validator: (String? val) {
                    if (val == null || val.isEmpty) {
                      return "Enter Organization number";
                    }
                    return null;
                  },
                ),

                SizedBox(height: AppSize.s10.h),
                button(
                  text: AppStrings.submit,
                  onTap: () {
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
