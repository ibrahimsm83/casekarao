import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../export_casekarao.dart';

class LegalExperienceScreen extends StatefulWidget {
  const LegalExperienceScreen({super.key});

  @override
  State<LegalExperienceScreen> createState() => _LegalExperienceScreenState();
}

class _LegalExperienceScreenState extends State<LegalExperienceScreen> {
  final _formKey = GlobalKey<FormState>();
  FocusNode node1 = FocusNode();
  FocusNode node2 = FocusNode();
  FocusNode node3 = FocusNode();
  FocusNode node4 = FocusNode();

  final _barLicenseNumberController = TextEditingController();
  final _organizationNameController = TextEditingController();
  final _yearsOfExpController = TextEditingController();
  final _organizationController = TextEditingController();
  String? selectedType;

  // List to store practice areas with default values
  List<String> practiceAreas = ["Criminal Law", "Family Law"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.kBackgroundColor,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
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
                heading(
                  AppStrings.barLicenseNumberWithIssuingAuthority,
                  AppStrings.required,
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
                heading(
                  AppStrings.jurisdictionStateOfPractice,
                  AppStrings.required,
                ),
                jurisdiction(),
                heading(AppStrings.yearsOfExperience, AppStrings.optional),
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
                  controller: _organizationNameController,
                  fillColor: ColorManager.kWhiteColor,
                  focusNode: node3,
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
                  controller: _organizationController,
                  fillColor: ColorManager.kWhiteColor,
                  focusNode: node4,
                  horizontalMergin: 0.0,
                  onSubmitted: (value) {
                    final text = value.trim();
                    if (text.isNotEmpty && !practiceAreas.contains(text)) {
                      setState(() {
                        practiceAreas.add(text);
                        _organizationController.clear();
                      });
                    }
                  },
                ),

                SizedBox(height: 10.h),

                // Display practice area chips
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Wrap(
                    spacing: 8.0,
                    runSpacing: 8.0,
                    children:
                        practiceAreas.map((area) => buildChip(area)).toList(),
                  ),
                ),

                SizedBox(height: AppSize.s20.h),
                button(
                  text: AppStrings.submit,
                  onTap: () {
                    bool isValid = _formKey.currentState!.validate();

                    if (isValid) {
                      Navigator.pushNamed(
                        context,
                        CustomRouteNames.kEducationAndCertificationScreenRoute,
                      );
                    }
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

  Widget heading(String text1, String text2) {
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

  Widget jurisdiction() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0.0),
      child: SizedBox(
        height: 45,
        child: DropdownButtonFormField<String>(
          value: selectedType,
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
            setState(() {
              selectedType = newValue;
            });
          },
          items:
              [
                AppStrings.jurisdictionStateOfPractice1,
                AppStrings.selectJurisdiction1,
                AppStrings.selectJurisdiction2,
              ].map((String lang) {
                return DropdownMenuItem<String>(value: lang, child: Text(lang));
              }).toList(),
        ),
      ),
    );
  }

  // Build a chip widget with a cross/delete icon
  Widget buildChip(String label) {
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
                  setState(() {
                    practiceAreas.removeWhere((area) => area == label);
                  });
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
