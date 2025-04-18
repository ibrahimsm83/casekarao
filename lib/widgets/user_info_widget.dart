import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../export_casekarao.dart';

class UserInfoWidget extends StatelessWidget {
  bool? isShowViewProfileButton;
   UserInfoWidget({super.key,this.isShowViewProfileButton=false});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorManager.kWhiteColor,
        borderRadius: BorderRadius.all(Radius.circular(16.r)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ///User info
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Container(height: 75, width: 75),
                        Container(
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(ImageAssets.starUserImage4),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0.0,
                          right: 0.0,
                          child: Container(
                            height: 25,
                            width: 25,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: ColorManager.secondary,
                              border: Border.all(
                                color: ColorManager.kWhiteColor,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: SvgPicture.asset(
                                ImageAssets.kUserProfileIcon,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "David Watson",
                          style: getboldStyle(
                            color: ColorManager.primary,
                            fontSize: ScreenUtil().setSp(AppSize.s16),
                          ),
                        ),
                        SizedBox(width: 10.0),
                        Container(
                          decoration: BoxDecoration(
                            color: ColorManager.kCardBgColor,
                            borderRadius: BorderRadius.all(
                              Radius.circular(14.r),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12.0,
                              vertical: 4.0,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(ImageAssets.kStarIcon),
                                SizedBox(width: 5.0),
                                Text(
                                  "4.5",
                                  style: getRegularStyle(
                                    color: ColorManager.primary,
                                    fontSize: ScreenUtil().setSp(AppSize.s8),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Row(
                        children: [
                          SvgPicture.asset(ImageAssets.kLocationIcon),
                          SizedBox(width: 5.0),
                          Text(
                            "Sydney, Australia",
                            style: getRegularStyle(
                              color: ColorManager.primary,
                              fontSize: ScreenUtil().setSp(AppSize.s10),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                ///Doc status
                Column(children: [
                  Row(
                    children: [
                      statusCard(heading:"05",status: AppStrings.kPending,headingColor: ColorManager.kOrangeColor),
                      SizedBox(width: 5.0),
                      statusCard(heading:"03",status: AppStrings.kOnGoing,headingColor: ColorManager.kDarkBlueColor),
                    ],
                  ),
                  SizedBox(height:5.0),
                  Row(
                    children: [
                      statusCard(heading:"01",status: AppStrings.kCanceled,headingColor: ColorManager.kRedColor),
                      SizedBox(width:5.0),
                      statusCard(heading:"50",status: AppStrings.kCompleted,headingColor: ColorManager.kGreenColor),
                    ],
                  ),
                ],)
              ],
            ),
            Visibility(
              visible: isShowViewProfileButton??false,
              child: button(
                color: ColorManager.kLightBlueColor.withOpacity(0.4),
                text: AppStrings.kViewProfile,
                fontColor: ColorManager.secondary,
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    CustomRouteNames.kDashboardScreenRoute,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget statusCard({required String heading,required String status,required Color headingColor}){
    return
      Container(
        height: 46.h,
        width: 76.w,
        decoration: BoxDecoration(
          color: ColorManager.kCardBgColor,
          borderRadius: BorderRadius.circular(14.r),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                heading,
                style: getsemiboldStyle(
                  color:headingColor,
                  fontSize: ScreenUtil().setSp(AppSize.s16),
                ),),
              Text(
                status,
                style: getmediumStyle(
                  color: ColorManager.primary,
                  fontSize: ScreenUtil().setSp(AppSize.s10),
                ),
              ),
            ],),
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
      horizontalMargin: 0.0,
      iconPath: iconPath,
      isLeadingIcon: true,
      text: text ?? "",

      style: getmediumStyle(
        color: fontColor ?? ColorManager.kWhiteColor,
        fontSize: AppSize.s14.sp,
      ),
      onTap: onTap,
    );
  }
}