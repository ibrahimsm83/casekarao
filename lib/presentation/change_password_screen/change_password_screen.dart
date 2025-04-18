import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../export_casekarao.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  FocusNode node1 = FocusNode();
  FocusNode node2 = FocusNode();
  FocusNode node3 = FocusNode();
  final _oldPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  double _strength = 0; // Strength value for the progress bar
  String _password = "";

  // Function to calculate password strength
  void _checkPasswordStrength(String password) {
    setState(() {
      _password = password;
      int strength = 0;

      // Conditions to check password strength
      if (password.length >= 8) strength++;
      if (RegExp(r'(?=.*[A-Z])').hasMatch(password)) strength++;
      if (RegExp(r'(?=.*\d)').hasMatch(password)) strength++;

      // Convert strength to progress bar value (0.0 to 1.0)
      _strength = strength / 3; // 3 is the max strength level
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.kBackgroundColor,
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
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
                  AppStrings.kChangePassword,
                  style: getsemiboldStyle(
                    color: ColorManager.primary,
                    fontSize: ScreenUtil().setSp(AppSize.s24),
                  ),
                ),
                SizedBox(height: AppSize.s8.h),
                Text(
                  AppStrings.kInOrderToChange,
                  style: getmediumStyle(
                    color: ColorManager.kDarkGreyColor,
                    fontSize: ScreenUtil().setSp(AppSize.s12),
                  ),
                ),
                SizedBox(height: AppSize.s15.h),
                Text(
                  AppStrings.kTOldPassword,
                  style: getsemiboldStyle(
                    color: ColorManager.primary,
                    fontSize: ScreenUtil().setSp(AppSize.s20),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: AppSize.s10.h,
                    bottom: AppSize.s6.h,
                  ),
                  child: Text(
                    AppStrings.kPassword,
                    style: getmediumStyle(
                      color: ColorManager.kDarkGreyColor,
                      fontSize: ScreenUtil().setSp(AppSize.s12),
                    ),
                  ),
                ),
                CustomTextFormField(
                  hintText: AppStrings.kTOldPassword,
                  controller: _oldPasswordController,
                  fillColor: ColorManager.kWhiteColor,
                  focusNode: node1,
                  obscureText: true,
                  horizontalMergin: 0.0,
                  validator: (String? val) {
                    if (val == null || val.isEmpty) {
                      return AppStrings.enterPassword;
                    } else if (val.isValidPassword) {
                      return null;
                    }
                    return AppStrings
                        .enterPassword; //AppStrings.passwordValidator;
                  },
                ),
                SizedBox(height: 30.h),
                Text(
                  AppStrings.kNewPassword,
                  style: getsemiboldStyle(
                    color: ColorManager.primary,
                    fontSize: ScreenUtil().setSp(AppSize.s20),
                  ),
                ),
                SizedBox(height: AppSize.s4.h),
                Text(
                  AppStrings.kPleaseSetYourNewPassword,
                  style: getmediumStyle(
                    color: ColorManager.kDarkGreyColor,
                    fontSize: ScreenUtil().setSp(AppSize.s12),
                  ),
                ),
                SizedBox(height: AppSize.s10.h),

                CustomTextFormField(
                  hintText: AppStrings.kCreateStrongPassword,
                  controller: _newPasswordController,
                  fillColor: ColorManager.kWhiteColor,
                  onChanged: _checkPasswordStrength,
                  focusNode: node2,
                  obscureText: true,
                  horizontalMergin: 0.0,
                  validator: (String? val) {
                    if (val == null || val.isEmpty) {
                      return AppStrings.enterPassword;
                    } else if (val.isValidPassword) {
                      return null;
                    }
                    return AppStrings
                        .enterPassword; //AppStrings.passwordValidator;
                  },
                ),
                SizedBox(height: 10.0),
                CustomTextFormField(
                  hintText: AppStrings.kConfirmPassword,
                  controller: _confirmPasswordController,
                  fillColor: ColorManager.kWhiteColor,
                  focusNode: node3,
                  obscureText: true,
                  horizontalMergin: 0.0,
                  validator: (String? val) {
                    if (val == null || val.isEmpty) {
                      return AppStrings.enterPassword;
                    } else if (val.isValidPassword) {
                      return null;
                    }
                    return AppStrings
                        .enterPassword; //AppStrings.passwordValidator;
                  },
                ),
                SizedBox(height: AppSize.s10.h),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    AppStrings.passwordValidator,
                    style: getRegularStyle(
                      color: ColorManager.kDarkGreyColor,
                      fontSize: ScreenUtil().setSp(11),
                    ),
                  ),
                ),
                SizedBox(height: AppSize.s10.h),
                // Progress Bar for Password Strength
                LinearProgressIndicator(
                  value: _strength,
                  backgroundColor: Colors.grey[300],
                  color:
                      _strength < 0.34
                          ? ColorManager.secondary
                          : _strength < 0.67
                          ? ColorManager.secondary
                          : ColorManager.secondary,
                  minHeight: 8,
                ),
                SizedBox(height: AppSize.sizeHeight(context)*0.1),

                button(
                  text: AppStrings.register,
                  onTap: () {
                    if (_formKey.currentState!.validate()) {

                    // CustomSnacksBar.showSnackBar(
                    //   context,
                    //   "Registered Successfully",
                    //   icon: Icon(
                    //     Icons.check,
                    //     color: ColorManager.kWhiteColor,
                    //   ),
                    // );
                    }
                  },
                ),
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
