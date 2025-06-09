import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../export_casekarao.dart';
import '../../controller/login_controller.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      init: LoginController(),
      builder: (controller) {
        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            backgroundColor: ColorManager.kBackgroundColor,
            body: SingleChildScrollView(
              child: Form(
                key: controller.loginFormKey,
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
                  Padding(
                    padding: EdgeInsets.only(top: 16.w, bottom: 16.h),
                    child: Container(
                      height: 64.h,
                      width: 64.h,
                      decoration: BoxDecoration(
                        color: ColorManager.primary,
                        borderRadius: BorderRadius.all(Radius.circular(16.r)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SvgPicture.asset(ImageAssets.ckIcon),
                      ),
                    ),
                  ),
                  SizedBox(height: AppSize.sizeHeight(context) * 0.01),
                  Text(
                    AppStrings.loginToYourAccount,
                    style: getsemiboldStyle(
                      color: ColorManager.primary,
                      fontSize: ScreenUtil().setSp(AppSize.s24),
                    ),
                  ),
                  SizedBox(height: AppSize.s4.h),
                  Text(
                    AppStrings.createAnAccountByFillingInTheDataBelow,
                    style: getmediumStyle(
                      color: ColorManager.kDarkGreyColor,
                      fontSize: ScreenUtil().setSp(AppSize.s14),
                    ),
                  ),
                  //SizedBox(height: AppSize.s20.h),
                  Padding(
                    padding: EdgeInsets.only(
                      top: AppSize.s20.h,
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
                    hintText: AppStrings.phoneNumberHintText,
                    controller: controller.phoneNumberController,
                    fillColor: ColorManager.kWhiteColor,
                    focusNode: controller.phoneNumberFocusNode,
                    horizontalMergin: 0.0,
                    validator: (String? val) {
                      if (val == null || val.isEmpty) {
                        return "Enter Phone Number";
                      }
                      return null;
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: AppSize.s15.h,
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
                      } else {
                        return null;
                      }
                    },
                  ),
          
                  SizedBox(height: AppSize.sizeHeight(context) * 0.04),
                  _buildButton(
                    text: AppStrings.login,
                    onTap: controller.login,
                  ),
                  SizedBox(height: AppSize.s10.h),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      AppStrings.or,
                      textAlign: TextAlign.center,
                      style: getRegularStyle(
                        color: ColorManager.kDarkGreyColor,
                        fontSize: ScreenUtil().setSp(AppSize.s14),
                      ),
                    ),
                  ),
                  SizedBox(height: AppSize.s10.h),
                  _buildButton(
                    text: AppStrings.continueWithApple,
                    iconPath: ImageAssets.appleIcon,
                    onTap: () {},
                    color: ColorManager.kWhiteColor,
                    fontColor: ColorManager.primary,
                  ),
                  _buildButton(
                    text: AppStrings.continueWithGoogle,
                    iconPath: ImageAssets.googleIcon,
                    onTap: () {},
                    color: ColorManager.kWhiteColor,
                    fontColor: ColorManager.primary,
                  ),
                  CustomTextSpan(
                    text1: AppStrings.dontHaveAnAccount,
                    text2: AppStrings.createAccount,
                    onTap: controller.goToCreateAccount,
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
