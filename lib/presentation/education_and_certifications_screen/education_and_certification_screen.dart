import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../export_casekarao.dart';

class EducationAndCertificationScreen extends StatefulWidget {
  const EducationAndCertificationScreen({super.key});

  @override
  State<EducationAndCertificationScreen> createState() => _EducationAndCertificationScreenState();
}

class _EducationAndCertificationScreenState extends State<EducationAndCertificationScreen> {
  final _formKey = GlobalKey<FormState>();
  FocusNode node1 = FocusNode();
  FocusNode node2 = FocusNode();
  FocusNode node3 = FocusNode();
  FocusNode node4 = FocusNode();

  final _lawSchoolAttendedController = TextEditingController();
  final _degreeController = TextEditingController();
  final _yearsOfGraduationController = TextEditingController();
  final _additionalCertificateController = TextEditingController();

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
                  controller: _lawSchoolAttendedController,
                  fillColor: ColorManager.kWhiteColor,
                  focusNode: node1,
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
                  controller: _degreeController,
                  fillColor: ColorManager.kWhiteColor,
                  focusNode: node2,
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
                  hintText: AppStrings.ex2012,
                  controller: _yearsOfGraduationController,
                  fillColor: ColorManager.kWhiteColor,
                  focusNode: node3,
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
                  controller: _additionalCertificateController,
                  fillColor: ColorManager.kWhiteColor,
                  focusNode: node4,
                  horizontalMergin: 0.0,
                  validator: (String? val) {
                    if (val == null || val.isEmpty) {
                      return "Enter Certification name";
                    }
                    return null;
                  },
                ),
                SizedBox(height: AppSize.s20.h),

                button(text: AppStrings.submit, onTap: () {

                  if (!_formKey.currentState!.validate()) {
                    Navigator.pushNamed(
                      context,
                      CustomRouteNames.kBusinessAndAvailabilityScreenRoute,
                    );
                  }
                }),

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
  Widget heading(String text1,String text2){
    return
      Padding(
        padding: EdgeInsets.only(
          top: AppSize.s20.h,
          bottom: AppSize.s6.h,
        ),
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
}
