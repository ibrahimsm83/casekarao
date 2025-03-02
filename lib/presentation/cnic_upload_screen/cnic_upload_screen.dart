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
            Container(
              width: AppSize.sizeWidth(context),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(13.r),
                color: ColorManager.secondary,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Center(child: Text(AppStrings.scanFrontSideOfYourCNIC,style: getmediumStyle(color: ColorManager.kWhiteColor),)),
              ),
            ),

            SizedBox(height: AppSize.sizeHeight(context) * 0.2),

            SizedBox(height: 5.h),
          ],
        ),
      ),
    );
  }
}
