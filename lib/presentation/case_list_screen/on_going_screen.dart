import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../export_casekarao.dart';

class OnGoingScreen extends StatelessWidget {
  OnGoingScreen({super.key});

  List<OnGoingStatusItemModel> onGoingList = [
    OnGoingStatusItemModel(
      title: AppStrings.kMurderCase,
      title2: AppStrings.k1stMilestone,
      subtitle: AppStrings.kLoremIpsum,
      userImage: ImageAssets.userImage,
      userName: "Randy Press",
      paymentStatus: AppStrings.kPaid,
      mileStoneExpiry: "7",
    ),   OnGoingStatusItemModel(
      title: AppStrings.kMurderCase,
      title2: AppStrings.k1stMilestone,
      subtitle: AppStrings.kLoremIpsum,
      userImage: ImageAssets.userImage,
      userName: "Randy Press",
      paymentStatus: AppStrings.kPaid,
      mileStoneExpiry: "12",
    ),   OnGoingStatusItemModel(
      title: AppStrings.kMurderCase,
      title2: AppStrings.k1stMilestone,
      subtitle: AppStrings.kLoremIpsum,
      userImage: ImageAssets.userImage,
      userName: "Randy Press",
      paymentStatus: AppStrings.kPending,
      mileStoneExpiry: "2",
    ),   OnGoingStatusItemModel(
      title: AppStrings.kMurderCase,
      title2: AppStrings.k1stMilestone,
      subtitle: AppStrings.kLoremIpsum,
      userImage: ImageAssets.userImage,
      userName: "Randy Press",
      paymentStatus: AppStrings.kPending,
      mileStoneExpiry: "2",
    ),   OnGoingStatusItemModel(
      title: AppStrings.kMurderCase,
      title2: AppStrings.k1stMilestone,
      subtitle: AppStrings.kLoremIpsum,
      userImage: ImageAssets.userImage,
      userName: "Randy Press",
      paymentStatus: AppStrings.kPending,
      mileStoneExpiry: "2",
    ),
  ];

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
        centerTitle: true,
        title: Text(
          AppStrings.kOnGoing,
          style: getsemiboldStyle(
            color: ColorManager.primary,
            fontSize: ScreenUtil().setSp(FontSize.s16),
          ),
        ),
      ),
      body: ListView.separated(
        separatorBuilder: (context, i) => SizedBox(height: 5.0),
        itemCount: onGoingList.length,
        itemBuilder: (context, index) {
          return pendingCard(context, onGoingList[index]);
          //CaseCard(caseData: filteredCases[index]);
        },
      ),
    );
  }

  Widget pendingCard(BuildContext context, OnGoingStatusItemModel status) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppSize.sizeWidth(context!) * 0.04,
        vertical: 0.0,
      ),
      child: Card(
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
                children: [
                  Text(
                    status.title,
                    style: getsemiboldStyle(
                      color: ColorManager.primary,
                      fontSize: ScreenUtil().setSp(AppSize.s16),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5, top: 0),
                    child: Text(
                      status.title2,
                      style: getmediumStyle(
                        color: ColorManager.secondary,
                        fontSize: ScreenUtil().setSp(AppSize.s12),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.0),
              Text(
                status.subtitle,
                //"Lorem Ipsum is simply dummy text of the printing industry.",
                style: getRegularStyle(
                  color: ColorManager.primary,
                  fontSize: ScreenUtil().setSp(AppSize.s10),
                ),
              ),

              Padding(
                padding: EdgeInsets.only(top: 10.h, bottom: 15.h),
                child: Row(
                  children: [
                    Flexible(
                      child: Row(
                        children: [
                          Text(
                            "Payment Status: ",
                            style: getmediumStyle(
                              fontSize: ScreenUtil().setSp(AppSize.s10),
                              color: ColorManager.primary,
                            ),
                          ),
                          Text(
                            status.paymentStatus,
                            style: getmediumStyle(
                              fontSize: ScreenUtil().setSp(AppSize.s10),
                              color:
                                  status.paymentStatus == "Pending"
                                      ? ColorManager.kOrangeColor
                                      : ColorManager.kGreenColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      child: Row(
                        children: [
                          Text(
                            "Milestone Expiry: ",
                            style: getmediumStyle(
                              fontSize: ScreenUtil().setSp(AppSize.s10),
                              color: ColorManager.primary,
                            ),
                          ),
                          Text(
                            " ${status.mileStoneExpiry} Days",
                            style: getmediumStyle(
                              fontSize: ScreenUtil().setSp(AppSize.s10),
                              color:
                                  status.paymentStatus == "Pending"
                                      ? ColorManager.kRedColor
                                      : ColorManager.kGreenColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              ///image
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage(status.userImage),
                        radius: 14,
                      ),

                      Padding(
                        padding: const EdgeInsets.only(left: 5.0),
                        child: Text(
                          status.userName,
                          style: getmediumStyle(
                            color: ColorManager.primary,
                            fontSize: ScreenUtil().setSp(AppSize.s10),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: ColorManager.secondary,
                        borderRadius: BorderRadius.all(Radius.circular(8.r)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8.0,
                          vertical: 5.0,
                        ),
                        child: Row(
                          children: [
                            SvgPicture.asset(ImageAssets.kMessageIcon),
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text(
                                AppStrings.kMessage,
                                style: getRegularStyle(
                                  color: ColorManager.kWhiteColor,
                                  fontSize: ScreenUtil().setSp(AppSize.s10),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
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
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text(
                                "View Details",
                                style: getRegularStyle(
                                  color: ColorManager.primary,
                                ),
                              ),
                            ),
                            SvgPicture.asset(ImageAssets.kRightArrowIcon),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
