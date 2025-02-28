import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../export_casekarao.dart';

class PersonalInformationScreen extends StatefulWidget {
  const PersonalInformationScreen({super.key});

  @override
  State<PersonalInformationScreen> createState() =>
      _PersonalInformationScreenState();
}

class _PersonalInformationScreenState extends State<PersonalInformationScreen> {
  final _formKey = GlobalKey<FormState>();
  FocusNode node1 = FocusNode();
  FocusNode node2 = FocusNode();
  FocusNode node3 = FocusNode();
  FocusNode node4 = FocusNode();
  FocusNode node5 = FocusNode();
  FocusNode node6 = FocusNode();

  final _phoneNumberController = TextEditingController();
  final _emailController = TextEditingController();
  final _fullNameController = TextEditingController();
  final _dateController = TextEditingController();
  final _monthController = TextEditingController();
  final _yearController = TextEditingController();

  @override
  void initState() {
    node1.addListener(() {
      if (!node1.hasFocus) {
        formatPhoneNumber();
      }
    });
    super.initState();
  }

  void formatPhoneNumber() {
    _phoneNumberController.text = _phoneNumberController.text.replaceAll(
      " ",
      "",
    );
  }

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
                    "David Wastson",
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
                      color: ColorManager.kLightBlueColor.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
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
                  controller: _fullNameController,
                  fillColor: ColorManager.kWhiteColor,
                  focusNode: node1,
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
                  controller: _emailController,
                  fillColor: ColorManager.kWhiteColor,
                  focusNode: node2,
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
                  hintText: AppStrings.phoneHintText,
                  controller: _phoneNumberController,
                  fillColor: ColorManager.kWhiteColor,
                  focusNode: node3,
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
                        hintText: AppStrings.dD,
                        textAlign: TextAlign.center,
                        controller: _dateController,
                        fillColor: ColorManager.kWhiteColor,
                        focusNode: node4,
                        horizontalMergin: 0.0,
                        validator: (String? val) {
                          if (val == null || val.isEmpty) {
                            return "Enter phone number";
                          }
                          return null;
                        },
                      ),
                    ),
                    Flexible(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: CustomTextFormField(
                          hintText: AppStrings.mM,
                          textAlign: TextAlign.center,
                          controller: _monthController,
                          fillColor: ColorManager.kWhiteColor,
                          focusNode: node5,
                          horizontalMergin: 0.0,
                          validator: (String? val) {
                            if (val == null || val.isEmpty) {
                              return "Enter phone number";
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                    Flexible(
                      child: CustomTextFormField(
                        hintText: AppStrings.yYYY,
                        textAlign: TextAlign.center,
                        controller: _yearController,
                        fillColor: ColorManager.kWhiteColor,
                        focusNode: node6,
                        horizontalMergin: 0.0,
                        validator: (String? val) {
                          if (val == null || val.isEmpty) {
                            return "Enter phone number";
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: AppSize.s10.h),
                button(
                  text: AppStrings.submit,
                  onTap: () {
                    if (_phoneNumberController.text.isNotEmpty) {
                      Navigator.pushNamed(
                        context,
                        CustomRouteNames.kOtpVerificationScreenRoute,
                        arguments: OtpScreenArgumentModel.required(
                          phoneNumber: _phoneNumberController.text,
                        ),
                      );
                    } else {
                      CustomSnacksBar.showSnackBar(
                        context,
                        "Please Enter Phone Number ",
                        icon: Icon(
                          Icons.error,
                          color: ColorManager.kWhiteColor,
                        ),
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
