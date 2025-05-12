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
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppSize.sizeWidth(context!) * 0.03,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: AppSize.sizeHeight(context) * 0.01),
            _buildAmountWidget(),
            SizedBox(height: AppSize.s20.h),
            Flexible(
              child: ListView.separated(
                //shrinkWrap: true,
                separatorBuilder: (context, i) => SizedBox(height: 5.0),
                itemCount: DataList.caseDetailsList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: AppSize.sizeWidth(context!) * 0.01,
                    ),
                    child: caseCard(
                      cdm: DataList.caseDetailsList[index],
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
                          arguments: false,
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
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
                  style: getmediumStyle(
                    color: ColorManager.secondary,
                    fontSize: ScreenUtil().setSp(AppSize.s12),
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Container(
                        height: 8,
                        width: 8,
                        decoration: BoxDecoration(
                          color: ColorManager.kGreenColor,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    Text(
                      cdm.mileStoneStatus,
                      style: getmediumStyle(
                        color: ColorManager.kGreenColor,
                        fontSize: ScreenUtil().setSp(AppSize.s10),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 3.0),
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
              maxLines: 4,
              style: getRegularStyle(
                color: ColorManager.primary,
                fontSize: ScreenUtil().setSp(AppSize.s10),
              ),
            ),

            ///Buttons
            SizedBox(height: 6.h),
            button(
              text: AppStrings.kAddDispute,
              color: Colors.transparent,
              fontColor: ColorManager.kGreyColor,
              onTap: () {},
            ),
          ],
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
      borderRadius: BorderRadius.circular(12),
      horizontalMargin: 0.0,
      iconPath: iconPath,
      isLeadingIcon: false,
      borderColor: ColorManager.kGreyColor,
      text: text ?? "",

      style: getmediumStyle(
        color: fontColor ?? ColorManager.kWhiteColor,
        fontSize: AppSize.s14.sp,
      ),
      onTap: onTap,
    );
  }

  Widget _buildAmountWidget() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSize.s14.r),
        color: ColorManager.kWhiteColor,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              AppStrings.kMurderCase,
              style: getsemiboldStyle(
                color: ColorManager.primary,
                fontSize: ScreenUtil().setSp(AppSize.s24),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  AppStrings.kPaymentVerified,
                  style: getsemiboldStyle(
                    color: ColorManager.kGreenColor,
                    fontSize: ScreenUtil().setSp(AppSize.s10),
                  ),
                ),
                SizedBox(width: 5.0),
                Text(
                  'PKR 30000.0',
                  style: getsemiboldStyle(
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
