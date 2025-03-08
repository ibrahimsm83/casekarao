import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../export_casekarao.dart';

class PendingScreen extends StatelessWidget {
  PendingScreen({super.key});

  List<PendingStatusItemModel> pendingList = [
    PendingStatusItemModel(
      title: AppStrings.kHitAndRunCase,
      subtitle: AppStrings.kLoremIpsum,
      userImage: ImageAssets.userImage,
      userName: "Randy Press",
      time: "11:30am to 12:30pm",
      day: "Tuesday 18 Feb, 2025",
    ),
    PendingStatusItemModel(
      title: AppStrings.kHitAndRunCase,
      subtitle: AppStrings.kLoremIpsum,
      userImage: ImageAssets.userImage,
      userName: "Randy Press",
      time: "11:30am to 12:30pm",
      day: "Tuesday 18 Feb, 2025",
    ),
    PendingStatusItemModel(
      title: AppStrings.kHitAndRunCase,
      subtitle: AppStrings.kLoremIpsum,
      userImage: ImageAssets.userImage,
      userName: "Randy Press",
      time: "11:30am to 12:30pm",
      day: "Tuesday 18 Feb, 2025",
    ),
    PendingStatusItemModel(
      title: AppStrings.kHitAndRunCase,
      subtitle: AppStrings.kLoremIpsum,
      userImage: ImageAssets.userImage,
      userName: "Randy Press",
      time: "11:30am to 12:30pm",
      day: "Tuesday 18 Feb, 2025",
    ),
    PendingStatusItemModel(
      title: AppStrings.kHitAndRunCase,
      subtitle: AppStrings.kLoremIpsum,
      userImage: ImageAssets.userImage,
      userName: "Randy Press",
      time: "11:30am to 12:30pm",
      day: "Tuesday 18 Feb, 2025",
    ),
    PendingStatusItemModel(
      title: AppStrings.kHitAndRunCase,
      subtitle: AppStrings.kLoremIpsum,
      userImage: ImageAssets.userImage,
      userName: "Randy Press",
      time: "11:30am to 12:30pm",
      day: "Tuesday 18 Feb, 2025",
    ),
    PendingStatusItemModel(
      title: AppStrings.kHitAndRunCase,
      subtitle: AppStrings.kLoremIpsum,
      userImage: ImageAssets.userImage,
      userName: "Randy Press",
      time: "11:30am to 12:30pm",
      day: "Tuesday 18 Feb, 2025",
    ),
    PendingStatusItemModel(
      title: AppStrings.kHitAndRunCase,
      subtitle: AppStrings.kLoremIpsum,
      userImage: ImageAssets.userImage,
      userName: "Randy Press",
      time: "11:30am to 12:30pm",
      day: "Tuesday 18 Feb, 2025",
    ),
    PendingStatusItemModel(
      title: AppStrings.kHitAndRunCase,
      subtitle: AppStrings.kLoremIpsum,
      userImage: ImageAssets.userImage,
      userName: "Randy Press",
      time: "11:30am to 12:30pm",
      day: "Tuesday 18 Feb, 2025",
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
          AppStrings.kPending,
          style: getsemiboldStyle(
            color: ColorManager.primary,
            fontSize: ScreenUtil().setSp(FontSize.s16),
          ),
        ),
      ),
      body: ListView.separated(
        separatorBuilder: (context, i) => SizedBox(height: 5.0),
        //padding: EdgeInsets.all(12),
        itemCount: pendingList.length,
        itemBuilder: (context, index) {
          return pendingCard(context,pendingList[index]);
          //CaseCard(caseData: filteredCases[index]);
        },
      ),
    );
  }

  Widget pendingCard(BuildContext context, PendingStatusItemModel status) {
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
          padding: EdgeInsets.only(bottom: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: ColorManager.kTitleBgColor,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(12),
                    topLeft: Radius.circular(12),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: Text(
                    status.title,
                    style: getsemiboldStyle(
                      color: ColorManager.primary,
                      fontSize: ScreenUtil().setSp(AppSize.s14),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  status.subtitle,//"Lorem Ipsum is simply dummy text of the printing industry.",
                  style: getRegularStyle(
                    color: ColorManager.primary,
                    fontSize: ScreenUtil().setSp(AppSize.s10),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 10.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(ImageAssets.clockIcon),
                        SizedBox(width: 5.0),
                        Text(
                          status.time,//"11:30am to 12:30pm",
                          style: getmediumStyle(
                            color: ColorManager.primary,
                            fontSize: ScreenUtil().setSp(AppSize.s10),
                          ),
                        ),
                      ],
                    ),

                    Row(
                      children: [
                        SvgPicture.asset(ImageAssets.kCalendarIcon),
                        SizedBox(width: 5.0),
                        Text(
                          status.day,//"Tuesday 18 Feb, 2025",
                          style: getmediumStyle(
                            color: ColorManager.primary,
                            fontSize: ScreenUtil().setSp(AppSize.s10),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              ///image
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Row(
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
