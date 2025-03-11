import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../export_casekarao.dart';

class CaseDetailsScreen extends StatelessWidget {
  const CaseDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.kBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: Padding(
            padding: const EdgeInsets.only(left: 5.0, bottom: 5.0),
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
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppSize.sizeWidth(context!) * 0.03,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: AppSize.sizeHeight(context) * 0.01),
              Text(
                AppStrings.kMurderCase,
                style: getsemiboldStyle(
                  color: ColorManager.primary,
                  fontSize: ScreenUtil().setSp(AppSize.s24),
                ),
              ),
              SizedBox(height: AppSize.s8.h),
              Text(
                AppStrings.kLoremIpsum,
                style: getmediumStyle(
                  color: ColorManager.kDarkGreyColor,
                  fontSize: ScreenUtil().setSp(AppSize.s12),
                ),
              ),
              SizedBox(height: AppSize.s12.h),
              caseCard(
                cdm: DataList.caseDetailsList.first,
                onDocumentsTap: () {
                  Navigator.pushNamed(
                    context,
                    CustomRouteNames.kDocumentsScreenRoute,
                  );
                },
                onCaseDisTap: () {
                  Navigator.pushNamed(
                    context,
                    CustomRouteNames.kCaseDiscussionScreenRoute,
                  );
                },
              ),
              caseCard(
                cdm: DataList.caseDetailsList[1],
                onDocumentsTap: () {
                  Navigator.pushNamed(
                    context,
                    CustomRouteNames.kDocumentsScreenRoute,
                  );
                },
                onCaseDisTap: () {
                  Navigator.pushNamed(
                    context,
                    CustomRouteNames.kCaseDiscussionScreenRoute,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget caseCard({
    required CaseDetailsModel cdm,
    Function()? onDocumentsTap,
    Function()? onCaseDisTap,
  }) {
    return Card(
      color: ColorManager.kWhiteColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: EdgeInsets.only(bottom: 10),
      elevation: 3,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  cdm.mileStoneNumber,
                  style: getsemiboldStyle(
                    color: ColorManager.primary,
                    fontSize: ScreenUtil().setSp(AppSize.s16),
                  ),
                ),
                Text(
                  cdm.mileStoneStatus,
                  style: getmediumStyle(
                    color:
                        cdm.mileStoneStatus == "Milestone Completed"
                            ? ColorManager.secondary
                            : ColorManager.kGreenColor,
                    fontSize: ScreenUtil().setSp(AppSize.s12),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.0),
            Text(
              cdm.caseName,
              style: getsemiboldStyle(
                color: ColorManager.primary,
                fontSize: ScreenUtil().setSp(AppSize.s16),
              ),
            ),
            SizedBox(height: 4.h),
            Text(
              cdm.caseDesc,
              style: getRegularStyle(
                color: ColorManager.primary,
                fontSize: ScreenUtil().setSp(AppSize.s10),
              ),
            ),

            ///Buttons
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: onDocumentsTap,
                      child: Container(
                        decoration: BoxDecoration(
                          color: ColorManager.kBackgroundColor,
                          borderRadius: BorderRadius.all(Radius.circular(8.r)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8.0,
                            vertical: 5.0,
                          ),
                          child: Row(
                            children: [
                              SvgPicture.asset(ImageAssets.kDocumentsIcon),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  AppStrings.kDocuments,
                                  style: getRegularStyle(
                                    color: ColorManager.primary,
                                  ),
                                ),
                              ),
                              Container(
                                width: 17.w,
                                height: 17.h,
                                decoration: BoxDecoration(
                                  color: ColorManager.secondary, // Circle color
                                  shape: BoxShape.circle,
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  cdm.docCount.toString(), // Display count
                                  style: getRegularStyle(
                                    color: ColorManager.kWhiteColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 5.w),
                  Expanded(
                    child: InkWell(
                      onTap: onCaseDisTap,
                      child: Container(
                        decoration: BoxDecoration(
                          color: ColorManager.kBackgroundColor,
                          borderRadius: BorderRadius.all(Radius.circular(8.r)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8.0,
                            vertical: 5.0,
                          ),
                          child: Row(
                            children: [
                              SvgPicture.asset(ImageAssets.kCaseDiscIcon),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  AppStrings.kCaseDiscussion,
                                  style: getRegularStyle(
                                    color: ColorManager.primary,
                                  ),
                                ),
                              ),
                              Container(
                                width: 17.w,
                                // Circle size
                                height: 17.h,
                                decoration: BoxDecoration(
                                  color: ColorManager.secondary, // Circle color
                                  shape: BoxShape.circle,
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  cdm.caseDiscussionCount.toString(),
                                  // Display count
                                  style: getRegularStyle(
                                    color: ColorManager.kWhiteColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Text(
              "PKR ${cdm.amount}",
              style: getsemiboldStyle(
                color: ColorManager.primary,
                fontSize: ScreenUtil().setSp(AppSize.s12),
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  cdm.paymentStatus,
                  style: getsemiboldStyle(
                    color: ColorManager.kGreenColor,
                    fontSize: ScreenUtil().setSp(AppSize.s12),
                  ),
                ),
                Text(
                  "MileStone expire in ${cdm.expiryDays} days",
                  style: getRegularStyle(
                    color: ColorManager.primary,
                    fontSize: ScreenUtil().setSp(AppSize.s12),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
