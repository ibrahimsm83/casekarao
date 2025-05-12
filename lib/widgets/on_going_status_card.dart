

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../export_casekarao.dart';

class OnGoingStatusCard extends StatelessWidget {
  final OnGoingStatusItemModel status;
  final Function()? onDetailsTap;
  final Function()? onMessageTap;
   const OnGoingStatusCard({super.key,required this.status,required this.onDetailsTap,required this.onMessageTap});

  @override
  Widget build(BuildContext context) {
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
              children: [
                Text(
                  status.title,
                  style: getsemiboldStyle(
                    color: ColorManager.primary,
                    fontSize: ScreenUtil().setSp(AppSize.s16),
                  ),
                ),
                status.lowyerTitle == null ? const SizedBox() : Padding(
                  padding: const EdgeInsets.only(left: 5, top: 0),
                  child: Text(
                    status.lowyerTitle!,
                    style: getmediumStyle(
                      color: ColorManager.secondary,
                      fontSize: ScreenUtil().setSp(AppSize.s12),
                    ),
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.only(left: 5, top: 0),
                //   child: Text(
                //     status.title2,
                //     style: getmediumStyle(
                //       color: ColorManager.secondary,
                //       fontSize: ScreenUtil().setSp(AppSize.s12),
                //     ),
                //   ),
                // ),
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            status.userName,
                            style: getmediumStyle(
                              color: ColorManager.primary,
                              fontSize: ScreenUtil().setSp(AppSize.s8),
                            ),
                          ),
                          Text(
                            "Corporate Lawyer",
                            style: getmediumStyle(
                              color: ColorManager.primary,
                              fontSize: ScreenUtil().setSp(AppSize.s6),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                 status.paymentStatus == "Paid" ?
                InkWell(
                  onTap: onMessageTap,
                  child: Padding(
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
                                  fontSize: ScreenUtil().setSp(AppSize.s8.sp),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ):const SizedBox(),
                InkWell(
                  onTap: onDetailsTap,
                  child: Container(
                    decoration: BoxDecoration(
                      color: ColorManager.kbuttonBgColor,
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
                                fontSize: ScreenUtil().setSp(AppSize.s8.sp),
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
    );
    }
}
