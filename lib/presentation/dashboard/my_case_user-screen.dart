import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../export_casekarao.dart';

class MyCaseUserScreen extends StatefulWidget {
  const MyCaseUserScreen({super.key});

  @override
  State<MyCaseUserScreen> createState() => _MyCaseUserScreenState();
}

class _MyCaseUserScreenState extends State<MyCaseUserScreen> {
  int _selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.kBackgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        //leading: SizedBox.shrink(),
        title: Text(
          AppStrings.kMyCases,
          style: getsemiboldStyle(
            color: ColorManager.primary,
            fontSize: ScreenUtil().setSp(FontSize.s18),
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
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Container(
              height: 45.h,
              decoration: BoxDecoration(
                color: ColorManager.kWhiteColor,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedTabIndex = 0;
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.all(5.r),
                        decoration: BoxDecoration(
                          color: _selectedTabIndex == 0
                              ? ColorManager.primary
                              : ColorManager.kbuttonBgColor,
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        child: Center(
                          child: Text(
                            'On going cases',
                            style: getmediumStyle(
                              color: _selectedTabIndex == 0
                                  ? ColorManager.kWhiteColor
                                  : ColorManager.kGreyColor,
                              fontSize: 14.sp,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedTabIndex = 1;
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.all(5.r),
                        decoration: BoxDecoration(
                          color: _selectedTabIndex == 1
                              ? ColorManager.primary
                              : ColorManager.kbuttonBgColor,
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        child: Center(
                          child: Text(
                            'Completed cases',
                            style: getmediumStyle(
                              color: _selectedTabIndex == 1
                                  ? ColorManager.kWhiteColor
                                  : ColorManager.kGreyColor,
                              fontSize: 14.sp,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 10.h),
          Expanded(
            child: _selectedTabIndex == 0
                ? _buildOngoingCases()
                : _buildCompletedCases(),
          ),
        ],
      ),
    );
  }

  Widget _buildOngoingCases() {
    return ListView.separated(
      separatorBuilder: (context, i) => const SizedBox(height: 5.0),
      itemCount: DataList.onGoingList.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppSize.sizeWidth(context) * 0.04,
          ),
          child: OnGoingStatusCard(
            status: DataList.onGoingList[index],
            onDetailsTap: () {
              if(DataList.onGoingList[index].paymentStatus =="Paid"){
                Navigator.pushNamed(
                  context,
                  CustomRouteNames.kUserCaseDetailsScreenRoute,
                );
              }else{
                if(DataList.onGoingList[index].paymentStatus =="Pending"){
                  Navigator.pushNamed(
                      context,
                      CustomRouteNames.kPendingCaseDetailsUserScreenRoute,
                      arguments: "pending",
                    );
                }
              }
            },
            onMessageTap: () {
              Navigator.pushNamed(
                context,
                CustomRouteNames.kCaseDiscussionScreenRoute,
                arguments: false,
              );
            },
          ),
        );
      },
    );
  }

  Widget _buildCompletedCases() {
    // You can replace this with your completed cases list
    return ListView.separated(
      separatorBuilder: (context, i) => const SizedBox(height: 5.0),
      itemCount: DataList.onGoingList.isNotEmpty ? 2 : 0, // Just showing 2 items for example
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppSize.sizeWidth(context) * 0.04,
          ),
          child: OnGoingStatusCard(
            status: DataList.onGoingList[index],
            onDetailsTap: () {
              Navigator.pushNamed(
                context,
                CustomRouteNames.kUserCaseDetailsScreenRoute,
              );
              // DataList.onGoingList[index].paymentStatus == "Paid" ?
            },
            onMessageTap: () {
              Navigator.pushNamed(
                context,
                CustomRouteNames.kCaseDiscussionScreenRoute,
                arguments: false,
              );
            },
          ),
        );
      },
    );
  }
}
