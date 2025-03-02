import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../export_casekarao.dart';

class ApplicationUnderReviewScreen extends StatelessWidget {
  const ApplicationUnderReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppSize.sizeWidth(context!) * 0.05,
          ),
          child: Column(
            children: [
              SizedBox(height: AppSize.sizeHeight(context) * 0.05),
              Align(
                alignment: Alignment.topLeft,
                child: InkWell(
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
              ),

              Container(
                height: 74.h,
                width: 74.w,
                decoration: BoxDecoration(
                  color: ColorManager.kLightBlueColor.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(22.r),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SvgPicture.asset(ImageAssets.clipboardIcon),
                ),
              ),
              SizedBox(height: AppSize.sizeHeight(context) * 0.01),
              Text(
                AppStrings.yourApplicationIsUnderReview,
                style: getsemiboldStyle(
                  color: ColorManager.primary,
                  fontSize: ScreenUtil().setSp(AppSize.s22),
                ),
              ),
              Text(
                AppStrings.thankYouForSubmittingYourDetails,
                style: getRegularStyle(
                  color: ColorManager.primary,
                  fontSize: ScreenUtil().setSp(AppSize.s14),
                ),
              ),
              Text(
                AppStrings
                    .ourTeamIsCurrentlyReviewingYourInformationToEnsureComplianceWithOurStandards,
                textAlign: TextAlign.center,
                style: getRegularStyle(
                  color: ColorManager.primary,
                  fontSize: ScreenUtil().setSp(AppSize.s14),
                ),
              ),
              SizedBox(height: AppSize.s10.h),
              Container(
                width: AppSize.sizeWidth(context),
                decoration: BoxDecoration(
                  color: ColorManager.kWhiteColor,
                  borderRadius: BorderRadius.all(Radius.circular(13.r)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppStrings.whatHappensNext,
                        style: getsemiboldStyle(
                          color: ColorManager.primary,
                          fontSize: ScreenUtil().setSp(AppSize.s14),
                        ),
                      ),
                      SizedBox(height: 10.h),
                      whatHappens(),
                      SizedBox(height: 10.h),
                      Row(
                        children: [
                          Icon(
                            Icons.check_box,
                            color: ColorManager.kGreenColor,
                          ), // Small dot icon
                          SizedBox(width: 10.0),
                          Text(
                            AppStrings.ifApproved,
                            style: getboldStyle(
                              color: ColorManager.primary,
                              fontSize: ScreenUtil().setSp(AppSize.s12),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(
                          AppStrings
                              .yourProfileWillBeVisibleToUsersAllowingThemToConnectWithYou,
                          style: getRegularStyle(
                            color: ColorManager.primary,
                            fontSize: ScreenUtil().setSp(AppSize.s12),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Icon(Icons.close, color: ColorManager.kRedColor),
                          // Small dot icon
                          SizedBox(width: 10.0),
                          Text(
                            AppStrings.ifRejected,
                            style: getboldStyle(
                              color: ColorManager.primary,
                              fontSize: ScreenUtil().setSp(AppSize.s12),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(
                          AppStrings.wellNotifyYouWithReasonsAndStepsToReapply,
                          style: getRegularStyle(
                            color: ColorManager.primary,
                            fontSize: ScreenUtil().setSp(AppSize.s12),
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(
                          AppStrings
                              .forAnyQueriesFeelFreeToContactOurSupportTeamStayTuned,
                          textAlign: TextAlign.center,
                          style: getsemiboldStyle(
                            color: ColorManager.primary,
                            fontSize: ScreenUtil().setSp(AppSize.s14),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: AppSize.sizeHeight(context) * 0.03),
              button(
                text: AppStrings.contactSupportTeam,
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    CustomRouteNames.kLetsGetStartedScreenRouteRoute,
                  );
                },
              ),

              SizedBox(height: 5.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget whatHappens() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(Icons.circle, size: 8, color: Colors.black), // Small dot icon
            SizedBox(width: 10.0),
            Flexible(
              child: Text(
                AppStrings
                    .ourAdminWillVerifyYourCredentialsAndSubmittedDocuments,
                style: getRegularStyle(
                  color: ColorManager.primary,
                  fontSize: ScreenUtil().setSp(AppSize.s12),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 10.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(Icons.circle, size: 8, color: Colors.black),
            SizedBox(width: 10.0),
            Flexible(
              child: Text(
                AppStrings.approvalTypicallyTakes2448Hours,
                style: getRegularStyle(
                  color: ColorManager.primary,
                  fontSize: ScreenUtil().setSp(AppSize.s12),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 10.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(Icons.circle, size: 8, color: Colors.black),
            SizedBox(width: 10.0),
            Flexible(
              child: Text(
                AppStrings
                    .youReceiveANotificationOnceYourProfileIsApprovedOrIfAnyUpdatesAreNeeded,
                style: getRegularStyle(
                  color: ColorManager.primary,
                  fontSize: ScreenUtil().setSp(AppSize.s12),
                ),
              ),
            ),
          ],
        ),
      ],
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
