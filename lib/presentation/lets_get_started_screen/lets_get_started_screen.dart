import 'package:casekarao/presentation/resources/export_resources.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../export_casekarao.dart';

class LetsGetStartedView extends StatelessWidget {
  const LetsGetStartedView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: AppSize.sizeHeight(context) * 0.05),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10.0,
                vertical: 0.0,
              ),
              child: Container(
                height: 290.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(22.0.r)),
                  image: const DecorationImage(
                    colorFilter: ColorFilter.mode(
                      Colors.black12,
                      BlendMode.darken,
                    ),
                    fit: BoxFit.cover,
                    image: AssetImage(ImageAssets.getStartedImage),
                  ),
                ),
              ),
            ),
            SizedBox(height: AppSize.sizeHeight(context) * 0.03),
            Text(
              AppStrings.letsGetStarted,
              style: getboldStyle(
                color: ColorManager.primary,
                fontSize: ScreenUtil().setSp(AppSize.s28),
              ),
            ),
            SizedBox(height: AppSize.s10.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                AppStrings.createAKaseKaraoAccountOrLogin,
                textAlign: TextAlign.center,
                style: getRegularStyle(
                  color: ColorManager.primary,
                  fontSize: ScreenUtil().setSp(AppSize.s14),
                ),
              ),
            ),

            SizedBox(height: AppSize.sizeHeight(context) * 0.04),
            button(
              text: AppStrings.continueWithPhoneNumber,
              iconPath: ImageAssets.phoneIcon,
              onTap: () {},
            ),
            Text(
              AppStrings.or,
              textAlign: TextAlign.center,
              style: getRegularStyle(
                color: ColorManager.kDarkGreyColor,
                fontSize: ScreenUtil().setSp(AppSize.s14),
              ),
            ),
            button(
              text: AppStrings.continueWithApple,
              iconPath: ImageAssets.appleIcon,
              onTap: () {},
              color: ColorManager.kWhiteColor,
              fontColor: ColorManager.primary,
            ),
            button(
              text: AppStrings.continueWithGoogle,
              iconPath: ImageAssets.googleIcon,
              onTap: () {},
              color: ColorManager.kWhiteColor,
              fontColor: ColorManager.primary,
            ),
            textspan(
              text1: AppStrings.alreadyHaveAnAccount,
              text2: AppStrings.login,
              onTap: () {
                // Navigator.pushNamed(
                //   context,
                //   CustomRouteNames.kSignUpScreenRoute,
                // );
              },
            ),
            SizedBox(height: 5.h),
          ],
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
      iconPath: iconPath!,
      isLeadingIcon: true,
      text: text ?? "",
      style: getmediumStyle(
        color: fontColor ?? ColorManager.kWhiteColor,
        fontSize: AppSize.s14.sp,
      ),
      onTap: onTap,
    );
  }

  Widget textspan({
    String? text1,
    String? text2,
    BuildContext? context,
    Function()? onTap,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppPadding.p14,
        vertical: AppPadding.p20,
      ),
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
                color: ColorManager.secondary,
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
