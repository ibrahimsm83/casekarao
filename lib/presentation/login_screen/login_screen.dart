import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../export_casekarao.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  FocusNode node1 = FocusNode();
  FocusNode node2 = FocusNode();
  final _passwordController = TextEditingController();
  final _phoneNumberController = TextEditingController();

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
                SizedBox(height: AppSize.s8.h),
                Text(
                  AppStrings.createAnAccountByFillingInTheDataBelow,
                  style: getmediumStyle(
                    color: ColorManager.kDarkGreyColor,
                    fontSize: ScreenUtil().setSp(AppSize.s12),
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
                  controller: _phoneNumberController,
                  fillColor: ColorManager.kWhiteColor,
                  focusNode: node1,
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
                  controller: _passwordController,
                  fillColor: ColorManager.kWhiteColor,
                  //focusNode: node,
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
                button(
                  text: AppStrings.login,
                  onTap: () {
                    if (!_formKey.currentState!.validate()) {
                      print(_phoneNumberController.text);
                      print(_passwordController.text);
                      //context.go('/Homepage');
                      CustomSnacksBar.showSnackBar(
                        context,
                        "Login Successfully",
                        icon: Icon(
                          Icons.check,
                          color: ColorManager.kWhiteColor,
                        ),
                      );
                      Navigator.pushNamed(
                        context,
                        CustomRouteNames.kDashboardScreenRoute,
                      );
                    }
                  },
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
                CustomTextSpan(
                  text1: AppStrings.dontHaveAnAccount,
                  text2: AppStrings.createAccount,
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      CustomRouteNames.kCreateNewAccountScreenRoute,
                    );
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
}
