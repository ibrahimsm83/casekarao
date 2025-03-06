import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../export_casekarao.dart';

class OtpScreen extends StatefulWidget {
  String? phoneNumber;

  OtpScreen({super.key, this.phoneNumber});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  TextEditingController textEditingController = TextEditingController();
  StreamController<ErrorAnimationType>? errorController;
  bool hasError = false;
  String currentText = "";
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
  }

  // snackBar Widget
  snackBar(String? message) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message!), duration: const Duration(seconds: 2)),
    );
  }

  @override
  void dispose() {
    errorController!.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.kBackgroundColor,
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppSize.sizeWidth(context!) * 0.05,
              vertical: 20,
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
                  AppStrings.inputOTPCode,
                  style: getsemiboldStyle(
                    color: ColorManager.primary,
                    fontSize: ScreenUtil().setSp(AppSize.s24),
                  ),
                ),
                SizedBox(height: AppSize.s8.h),
                Text(
                  "${AppStrings.pleaseEnterTheOTPCodeThatWeHaveSentTo}${widget.phoneNumber}",
                  style: getmediumStyle(
                    color: ColorManager.kDarkGreyColor,
                    fontSize: ScreenUtil().setSp(AppSize.s12),
                  ),
                ),
                SizedBox(height: AppSize.sizeHeight(context) * 0.06),
                PinCodeTextField(
                  appContext: context,
                  length: 6,
                  obscureText: true,
                  animationType: AnimationType.fade,
                  keyboardType: TextInputType.number,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  pinTheme: PinTheme(
                    inactiveColor: ColorManager.kWhiteColor,
                    inactiveFillColor: ColorManager.kWhiteColor,
                    selectedFillColor: ColorManager.kWhiteColor,
                    shape: PinCodeFieldShape.box,
                    activeColor: ColorManager.kWhiteColor,
                    errorBorderColor: ColorManager.kRedColor,
                    borderRadius: BorderRadius.circular(12.r),
                    fieldHeight: 50,
                    fieldWidth: 50,
                    activeFillColor: ColorManager.kWhiteColor,
                  ),
                  animationDuration: Duration(milliseconds: 300),
                  enableActiveFill: true,
                  errorAnimationController: errorController,
                  controller: textEditingController,
                  onCompleted: (v) {
                    print("Completed");
                  },
                  onChanged: (value) {
                    print(value);
                    setState(() {
                      currentText = value;
                    });
                  },
                  // beforeTextPaste: (text) {
                  //   print("Allowing to paste $text");
                  //   //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                  //   //but you can show anything you want here, like your pop up saying wrong paste format or etc
                  //   return true;
                  // },
                ),

                SizedBox(height: AppSize.sizeHeight(context) * 0.2),
                button(
                  text: AppStrings.continues,
                  onTap: () {
                    if (currentText.length != 6 || currentText != "000000") {
                      errorController!.add(ErrorAnimationType.shake);
                      // Triggering error shake animation
                      setState(() => hasError = true);
                      CustomSnacksBar.showSnackBar(
                        context,
                        "Enter OTP code  000000",
                        icon: Icon(
                          Icons.check,
                          color: ColorManager.kWhiteColor,
                        ),
                      );
                    } else {
                      setState(() {
                        hasError = false;
                        CustomSnacksBar.showSnackBar(
                          context,
                          "OTP Verified!!",
                          icon: Icon(
                            Icons.check,
                            color: ColorManager.kWhiteColor,
                          ),
                        );
                        Navigator.pushNamed(
                          context,
                          CustomRouteNames.kSetupProfileScreenRoute,
                        );
                      });
                    }
                  },
                ),
                button(
                  text: AppStrings.resendCode,
                  color: ColorManager.kWhiteColor,
                  fontColor: ColorManager.primary,
                  onTap: () {
                    CustomSnacksBar.showSnackBar(
                      context,
                      "OTP sent successfully",
                      icon: Icon(Icons.check, color: ColorManager.kWhiteColor),
                    );
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
