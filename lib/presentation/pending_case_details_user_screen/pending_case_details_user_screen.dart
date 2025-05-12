import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../export_casekarao.dart';

class PendingCaseDetailsUserScreen extends StatefulWidget {
   PendingCaseDetailsUserScreen({super.key , this.status= "pending"});
  final String status;

  @override
  State<PendingCaseDetailsUserScreen> createState() => _PendingCaseDetailsUserScreenState();
}

class _PendingCaseDetailsUserScreenState extends State<PendingCaseDetailsUserScreen> {

  @override
  void initState() {
    if(widget.status =='pending')
    Future.delayed(Duration.zero, () {
      Get.bottomSheet(
        ActivateMilestoneSheet(),
        isScrollControlled: true,
        backgroundColor: ColorManager.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.kBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: InkWell(
          onTap: () =>Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (_) => const DashboardScreen(initialIndex: 3),
            ),
          ),
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Row
              SizedBox(height: AppSize.sizeHeight(context) * 0.01),
            if(widget.status=="pending")  _buildAmountWidget() else _buildTitleWithSubtextWidget() ,
              SizedBox(height: AppSize.s12.h),
              // Active Milestone Card
              _milestoneCard(
                title: '1st Milestone',
                subtitle: 'Case Initialization',
                description:
                    'Lorem Ipsum is simply dummy text of the printing and typesetting industry. '
                    'Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, '
                    'when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
                status: widget.status,//"pending",
                isLocked: false,
                context: context,
              ),
              const SizedBox(height: 5),

              // Locked Milestone
              _milestoneCard(
                title: '2nd Milestone',
                subtitle: 'Case Opening',
                description:
                    'Lorem Ipsum is simply dummy text of the printing and typesetting industry.'
                        'Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, ',
                status: widget.status,//"pending",
                isLocked: true,
                context: context,
              ),
              const SizedBox(height: 5),
              _milestoneCard(
                title: '3rd Milestone',
                subtitle: 'Case reopening',
                description:
                    'Lorem Ipsum is simply dummy text of the printing and typesetting industry.'
                        'Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, ',
                status: widget.status,//"pending",
                isLocked: true,
                context: context,
              ),

              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: AppSize.sizeWidth(context) / 2.3,
                        child: CustomButton(
                          counter: Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: ColorManager.secondary,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 6.0),
                              child: Text(
                                "9",
                                style: getmediumStyle(
                                  color: ColorManager.kWhiteColor,
                                  fontSize: AppSize.s12.sp,
                                ),
                              ),
                            ),
                          ),
                          borderRadius: BorderRadius.circular(22.r),
                          color: ColorManager.kWhiteColor,
                          horizontalMargin: 0.0,
                          iconPath: ImageAssets.kDocumentsIcon,
                          isLeadingIcon: true,
                          //borderColor: ColorManager.kGreyColor,
                          text: "Documents",
                          style: getmediumStyle(
                            color: ColorManager.primary,
                            fontSize: AppSize.s10.sp,
                          ),
                          onTap: () {},
                        ),
                      ),
                      //  button(
                      //   text: AppStrings.kViewPaymentReceipt,
                      //   color: ColorManager.primary,
                      //   //color:  ColorManager.kGreenColor,
                      //   fontColor: ColorManager.kWhiteColor,
                      //   onTap: () {}
                      //  ),
                      SizedBox(
                        width: AppSize.sizeWidth(context) / 2.3,
                        child: CustomButton(
                          counter: Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: ColorManager.secondary,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 6.0),
                              child: Text(
                                "9",
                                style: getmediumStyle(
                                  color: ColorManager.kWhiteColor,
                                  fontSize: AppSize.s12.sp,
                                ),
                              ),
                            ),
                          ),
                          borderRadius: BorderRadius.circular(22.r),
                          color: ColorManager.kWhiteColor,
                          horizontalMargin: 0.0,
                          iconPath: ImageAssets.kdialogIcon,
                          isLeadingIcon: true,
                          //borderColor: ColorManager.kGreyColor,
                          text: "Case Discussion",
                          style: getmediumStyle(
                            color: ColorManager.primary,
                            fontSize: AppSize.s10.sp,
                          ),
                          onTap: () {},
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 70,
                    //color: ColorManager.kRedColor,
                    child: button(
                        borderRadius: BorderRadius.circular(22.r),
                        text: AppStrings.kViewPaymentReceipt,
                        color: ColorManager.primary,
                        //color:  ColorManager.kGreenColor,
                        fontColor: ColorManager.kWhiteColor,
                        onTap: () {}),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAmountWidget() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSize.s14.r),
        color: ColorManager.kWhiteColor,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 6.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                AppStrings.kMurderCase,
                style: getsemiboldStyle(
                  color: ColorManager.primary,
                  fontSize: ScreenUtil().setSp(AppSize.s24),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  AppStrings.kPaymentPending,
                  style: getsemiboldStyle(
                    color: ColorManager.kOrangeColor,
                    fontSize: ScreenUtil().setSp(AppSize.s12),
                  ),
                ),
                SizedBox(width: 5.0),
                Text(
                  'PKR 30000.0',
                  style: getsemiboldStyle(
                    color: ColorManager.primary,
                    fontSize: ScreenUtil().setSp(AppSize.s14),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _milestoneCard({
    required String title,
    required String subtitle,
    required String description,
    required bool isLocked,
    required String status, // "active", "pending", or "completed"
    required BuildContext context,
  }) {
    return Card(
      color: ColorManager.kWhiteColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: EdgeInsets.only(bottom: 10),
      elevation: 3,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: getmediumStyle(
                    color: ColorManager.secondary,
                    fontSize: ScreenUtil().setSp(AppSize.s12),
                  ),
                ),
                if (status == "active" && !isLocked)
                  Row(
                    children: [
                      Icon(
                        Icons.circle,
                        size: 8,
                        color: ColorManager.secondary,
                      ),
                      SizedBox(width: 4),
                      Text(
                        "Active Milestone",
                        style: getmediumStyle(
                          color: ColorManager.secondary,
                          fontSize: ScreenUtil().setSp(AppSize.s10),
                        ),
                      ),
                    ],
                  )
                else
                  if(status == "pending")
                  Row(
                    children: [
                      Icon(
                        Icons.circle,
                        size: 8,
                        color: ColorManager.kGreyTextColor,
                      ),
                      SizedBox(width: 4),
                      Text(
                        "Inactive Milestone",
                        style: getmediumStyle(
                          color: ColorManager.kGreyTextColor,
                          fontSize: ScreenUtil().setSp(AppSize.s10),
                        ),
                      ),
                    ],
                  )
              ],
            ),
            const SizedBox(height: 8),
            // Subtitle
            Row(
              mainAxisAlignment:MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  subtitle,
                  style: getsemiboldStyle(
                    color: ColorManager.primary,
                    fontSize: ScreenUtil().setSp(AppSize.s16),
                  ),
                ),
                   if(isLocked)
                    SvgPicture.asset(ImageAssets.kLockFilledIcon),
              ],
            ),
            const SizedBox(height: 8),
            //Description
            Text(
              description,
              maxLines: 4,
              style: getRegularStyle(
                color: ColorManager.primary,
                fontSize: ScreenUtil().setSp(AppSize.s10),
              ),
            ),
            if (status == "active" && !isLocked) ...[
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: button(
                      text: AppStrings.kMartkAsCompleted,
                      color: ColorManager.primary,
                      fontColor: ColorManager.kWhiteColor,
                      onTap: () {
                        // Show case finalization popup
                        // openPopp(context);
                      },
                    ),
                  ),
                  SizedBox(width: 20.0),
                  Flexible(
                    child: button(
                      borderColor: ColorManager.primary,
                      text: AppStrings.kAddDispute,
                      color: Colors.transparent,
                      fontColor: ColorManager.primary,

                      onTap: () {
                        // Navigator.pushNamed(context,
                        //     CustomRouteNames.kAddDisputeScreenRoute);
                      },
                    ),
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildTitleWithSubtextWidget() {
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
            const SizedBox(
              height: 5.0,
            )
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
    BorderRadius? borderRadius,
  }) {
    return CustomButton(
      borderRadius: borderRadius ?? BorderRadius.circular(12.r),
      color: color ?? ColorManager.primary,
      horizontalMargin: 0.0,
      iconPath: iconPath,
      isLeadingIcon: false,
      borderColor: borderColor ?? ColorManager.kGreyColor,
      text: text ?? "",
      style: getmediumStyle(
        color: fontColor ?? ColorManager.kWhiteColor,
        fontSize: AppSize.s12.sp,
      ),
      onTap: onTap,
    );
  }
}
