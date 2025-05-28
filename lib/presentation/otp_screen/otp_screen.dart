import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../controller/otp_controller.dart';
import '../../export_casekarao.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OtpController>(
      init: OtpController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: ColorManager.kBackgroundColor,
          body: Form(
            key: controller.otpFormKey,
            child: SingleChildScrollView(
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
                      "${AppStrings.pleaseEnterTheOTPCodeThatWeHaveSentTo}${controller.userData?.data.phone ?? ''}",
                      style: getmediumStyle(
                        color: ColorManager.kDarkGreyColor,
                        fontSize: ScreenUtil().setSp(AppSize.s12),
                      ),
                    ),
                    SizedBox(height: AppSize.sizeHeight(context) * 0.06),
                    PinCodeTextField(
                      autoDisposeControllers: false,
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
                      animationDuration: const Duration(milliseconds: 300),
                      enableActiveFill: true,
                      errorAnimationController: controller.errorController,
                      controller: controller.textEditingController,
                      onCompleted: (v) => controller.verifyOtp(),
                      onChanged: controller.onOtpChanged,
                    ),
                    SizedBox(height: AppSize.sizeHeight(context) * 0.1),
                    _button(
                      text: AppStrings.continues,
                      onTap: controller.verifyOtp,
                    ),
                    _button(
                      text: AppStrings.resendCode,
                      color: ColorManager.kWhiteColor,
                      fontColor: ColorManager.primary,
                      onTap: controller.resendOtp,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _button({
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
