import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../export_casekarao.dart';

class CNICUploadScreen extends StatefulWidget {
  const CNICUploadScreen({super.key});

  @override
  State<CNICUploadScreen> createState() => _CNICUploadScreenState();
}

class _CNICUploadScreenState extends State<CNICUploadScreen> {
  bool isFrontSide = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.kBackgroundColor,
      body: Padding(
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
              AppStrings.govtIssuedCNICUpload,
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
            SizedBox(height: AppSize.sizeHeight(context) * 0.05),
            InkWell(
              onTap: (){
                Navigator.pushNamed(
                  context,
                  CustomRouteNames.kBarIdCardUploadScreenRoute,
                );
              },
              child: Container(
                width: AppSize.sizeWidth(context),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(13.r),
                  color: ColorManager.secondary,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Center(
                    child: Text(
                      isFrontSide
                          ? AppStrings.scanFrontSideOfYourCNIC
                          : AppStrings.scanBackSideOfYourCNIC,
                      style: getmediumStyle(color: ColorManager.kWhiteColor),
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(height: AppSize.sizeHeight(context) * 0.05),
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: AppSize.sizeWidth(context),
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(13.r),
                      color: ColorManager.kWhiteColor,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(ImageAssets.scanIcon),
                        Text(
                          AppStrings.holdStill,
                          style: getmediumStyle(color: ColorManager.primary),
                        ),
                      ],
                    ),
                  ),
                ),

                InkWell(
                  onTap: () {
                    setState(() {
                      if (isFrontSide) {
                        isFrontSide = false;
                      } else {
                        isFrontSide = true;
                      }
                    });
                  },
                  child: Container(
                    width: AppSize.sizeWidth(context),
                    height: 215,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(13.r),
                      color: Colors.transparent,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SvgPicture.asset(ImageAssets.leftTopCornerIcon),
                            SvgPicture.asset(ImageAssets.rightTopCornerIcon),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SvgPicture.asset(ImageAssets.leftBottomCornerIcon),
                            SvgPicture.asset(ImageAssets.rightBottomCornerIcon),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: AppSize.s8.h),
            Text(
              AppStrings
                  .alignYourGovernmentIssuedCNICWithinTheMarkersForAutomaticScanning,
              textAlign: TextAlign.center,
              style: getmediumStyle(
                color: ColorManager.kDarkGreyColor,
                fontSize: ScreenUtil().setSp(AppSize.s12),
              ),
            ),
            SizedBox(height: 5.h),
          ],
        ),
      ),
    );
  }
}
