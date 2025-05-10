import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../export_casekarao.dart';

class UserCaseDetailsScreen extends StatelessWidget {
  const UserCaseDetailsScreen({super.key});

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
        actions: [
          InkWell(
            onTap: () {
              //Notification screen
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Container(
                height: 44.h,
                width: 44.h,
                decoration: BoxDecoration(
                  color: ColorManager.kWhiteColor,
                  borderRadius: BorderRadius.all(Radius.circular(16.r)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: SvgPicture.asset(ImageAssets.kNotificationIcon),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppSize.sizeWidth(context) * 0.03,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: AppSize.sizeHeight(context) * 0.01),
            _buildAmountWidget(),
            SizedBox(height: AppSize.s12.h),
            Flexible(
              child: ListView.separated(
                //shrinkWrap: true,
                separatorBuilder: (context, i) => SizedBox(height: 5.0),
                itemCount: DataList.caseDetailsList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: AppSize.sizeWidth(context) * 0.01,
                    ),
                    child: caseCard(
                      context:context,
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
    context,
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
                        height: 10,
                        width: 10,
                        decoration: BoxDecoration(
                          color:  cdm.mileStoneStatus == "Milestone Pending" ? ColorManager.kOrangeColor:ColorManager.secondary,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    Text(
                      cdm.mileStoneStatus,
                      style: getmediumStyle(
                        color:  cdm.mileStoneStatus == "Milestone Pending" ? ColorManager.kOrangeColor:ColorManager.secondary,
                        fontSize: ScreenUtil().setSp(AppSize.s12),
                      ),
                    ),
                  ],
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
              maxLines: 4,
              style: getRegularStyle(
                color: ColorManager.primary,
                fontSize: ScreenUtil().setSp(AppSize.s10),
              ),
            ),

            ///Buttons
            SizedBox(height: 6.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween  ,
              children: [
                SizedBox(
                  width: AppSize.sizeWidth(context)/2.5,
                  child: button(
                    text: cdm.mileStoneStatus == "Milestone Pending" ?AppStrings.kMartkAsCompleted:AppStrings.kCompleted,
                    color:  cdm.mileStoneStatus == "Milestone Pending" ? ColorManager.primary:ColorManager.kGreenColor,
                    //color:  ColorManager.kGreenColor,
                    fontColor: ColorManager.kWhiteColor,
                    onTap: cdm.mileStoneStatus == "Milestone Pending" ? () {}:null,
                  ),
                ),
                 SizedBox(
                  width: AppSize.sizeWidth(context)/2.5,
                   child: button(
                    borderColor: cdm.mileStoneStatus == "Milestone Pending" ? ColorManager.primary:null,
                    text: AppStrings.kAddDispute,
                    color: Colors.transparent,
                    fontColor: cdm.mileStoneStatus == "Milestone Pending" ?  ColorManager.primary:ColorManager.kGreyColor,
                    onTap: cdm.mileStoneStatus == "Milestone Pending" ? () {
                      Navigator.pushNamed(context, CustomRouteNames.kAddDisputeScreenRoute);
                    }:null,
                                   ),
                 ),
              ],
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
    Color? borderColor,
  }) {
    return CustomButton(
      color: color ?? ColorManager.primary,
      horizontalMargin: 0.0,
      iconPath: iconPath,
      isLeadingIcon: false,
      borderColor:borderColor ?? ColorManager.kGreyColor,
      text: text ?? "",

      style: getmediumStyle(
        color: fontColor ?? ColorManager.kWhiteColor,
        fontSize: AppSize.s12.sp,
      ),
      onTap: onTap,
    );
  }

  Widget _buildAmountWidget() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 6.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppStrings.kMurderCase,
              style: getsemiboldStyle(
                color: ColorManager.primary,
                fontSize: ScreenUtil().setSp(AppSize.s24),
              ),
            ),
            Text(
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
              style: getsemiboldStyle(
                color: ColorManager.primary,
                fontSize: ScreenUtil().setSp(AppSize.s12),
              ),
            ),
            SizedBox(height: 5.0,)
          ],
        ),
      ),
    );
  }
}
