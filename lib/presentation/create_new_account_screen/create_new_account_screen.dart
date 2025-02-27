import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../export_casekarao.dart';

class CreateNewAccountScreen extends StatefulWidget {
  const CreateNewAccountScreen({super.key});

  @override
  State<CreateNewAccountScreen> createState() => _CreateNewAccountScreenState();
}

class _CreateNewAccountScreenState extends State<CreateNewAccountScreen> {
  final _formKey = GlobalKey<FormState>();
  FocusNode node1 = FocusNode();
  FocusNode node2 = FocusNode();
  FocusNode node3 = FocusNode();
  FocusNode node4 = FocusNode();
  final _passwordController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _emailController = TextEditingController();
  final _fullNameController = TextEditingController();

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
                  AppStrings.letsCreateNewAccount,
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
                      return "Enter name";
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
                    AppStrings.email,
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
                    AppStrings.phone,
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
                  onChanged: _checkPasswordStrength,
                  focusNode: node4,
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
                      fontSize: ScreenUtil().setSp(AppSize.s12),
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
                SizedBox(height: AppSize.s10.h),
                button(
                  text: AppStrings.register,
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      print(_phoneNumberController.text);
                      print(_passwordController.text);
                      print(_emailController.text);
                      print(_fullNameController.text);

                      CustomSnacksBar.showSnackBar(
                        context,
                        "Registered Successfully",
                        icon: Icon(
                          Icons.check,
                          color: ColorManager.kWhiteColor,
                        ),
                      );
                    }
                  },
                ),
                CustomTextSpan(
                  text1: AppStrings.alreadyHaveAnAccount,
                  text2: AppStrings.login,
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      CustomRouteNames.kLoginScreenRoute,
                    );
                  },
                ),

                Row(
                  children: [
                    Flexible(
                      child: button(
                        text: AppStrings.apple,
                        iconPath: ImageAssets.appleIcon,
                        onTap: () {},
                        color: ColorManager.kWhiteColor,
                        fontColor: ColorManager.primary,
                      ),
                    ),
                    SizedBox(width: AppSize.s10.w),
                    Flexible(
                      child: button(
                        text: AppStrings.google,
                        iconPath: ImageAssets.googleIcon,
                        onTap: () {},
                        color: ColorManager.kWhiteColor,
                        fontColor: ColorManager.primary,
                      ),
                    ),
                  ],
                ),

                textSpan(
                  text1: AppStrings.byProceedingYouAgreeToThe,
                  text2:
                      AppStrings.termsAndConditions +
                      ' and\t' +
                      AppStrings.privacyPolicy,
                  onTap: () {
                    // Navigator.pushNamed(
                    //   context,
                    //   CustomRouteNames.kLoginScreenRoute,
                    // );
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
