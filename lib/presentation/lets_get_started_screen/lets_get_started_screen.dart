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
      body: Column(
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
              //child: Text("hello"),
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

          SizedBox(height: AppSize.sizeHeight(context)*0.05),
          button(
              text: AppStrings.login,
              color: ColorManager.primary,
              context: context,
              onTap: () {
                // if (userController.userRole.value == UserRole.Patient) {
                //   Navigator.pushNamed(
                //     context,
                //     CustomRouteNames.kDashboardScreenRoute,
                //   );
                // } else {
                //   Navigator.pushNamed(
                //     context,
                //     CustomRouteNames.kDashboardScreenRoute,
                //   );
                // }
                // CustomSnacksBar.showSnackBar(
                //   context,
                //   "HealthCare Dashboard Not Found",
                //   icon: Icon(
                //     Icons.check,
                //     color: ColorManager.kWhiteColor,
                //   ),
                // );
                //}

                //  if (_formKey.currentState!.validate()) {
                //   print(_emailController.text);
                //   print(_passwordController.text);
                //
                //   CustomSnacksBar.showSnackBar(
                //     context,
                //     "Login Successfully",
                //     icon: Icon(
                //       Icons.check,
                //       color: ColorManager.kWhiteColor,
                //     ),
                //   );
                // }
              }),
          SizedBox(height: 10.h),
          textspan(
              text1: AppStrings.alreadyHaveAnAccount,
              text2: AppStrings.login,
              onTap: () {
                // Navigator.pushNamed(
                //   context,
                //   CustomRouteNames.kSignUpScreenRoute,
                // );
              }),
        ],
      ),
    );
  }
  Widget button(
      {Function()? onTap, String? text, Color? color, BuildContext? context}) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: AppSize.sizeWidth(context!) * 0.05, vertical: 8.0),
      child: CustomButton(
          color: color!,
          text: text ?? "",
          style: getboldStyle(
            color: ColorManager.kWhiteColor,
            fontSize: AppSize.s14.sp,
          ),
          onTap: onTap),
    );
  }

  Widget textspan(
      {String? text1,
        String? text2,
        BuildContext? context,
        Function()? onTap}) {
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: AppPadding.p14, vertical: AppPadding.p20),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          text: text1,
          style: getRegularStyle(
              color: ColorManager.kGreyColor,
              fontSize: ScreenUtil().setSp(AppSize.s12)),
          children: <TextSpan>[
            TextSpan(
                text: text2,
                style: TextStyle(
                    color: ColorManager.secondary,
                    fontFamily: FontConstants.fontFamily,
                    fontWeight: FontWeightManager.bold,
                    fontSize: ScreenUtil().setSp(AppSize.s12)),
                recognizer: TapGestureRecognizer()..onTap = onTap)
          ],
        ),
      ),
    );
  }
}
