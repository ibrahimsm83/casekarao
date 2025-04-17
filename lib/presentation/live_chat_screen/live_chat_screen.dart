import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../export_casekarao.dart';

class LiveChatScreen extends StatelessWidget {
  const LiveChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.kBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          AppStrings.kLiveChat,
          style: getsemiboldStyle(
            color: ColorManager.primary,
            fontSize: ScreenUtil().setSp(FontSize.s16),
          ),
        ),
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.center,
            child: Image.asset(
              ImageAssets.chatBubblesImage,
              width: 150,
              height: 150,
            ),
          ),
          // SizedBox(height: 40),
          // Title & Subtitle
          Column(
            children: [
              Text(
                AppStrings.kLiveChat,
                style: getsemiboldStyle(
                  color: ColorManager.primary,
                  fontSize: ScreenUtil().setSp(FontSize.s26.sp),
                ),
              ),
              SizedBox(height: 8),
              Text(
                AppStrings.kChatWithOurLiveRepresentative,
                style: getmediumStyle(
                  color: ColorManager.kDarkGreyColor,
                  fontSize: ScreenUtil().setSp(FontSize.s14.sp),
                ),
              ),
            ],
          ),
          // Reply Time Info
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18.r),
              boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(ImageAssets.kTimerIcon),
                SizedBox(width: 8),
                Text(
                  AppStrings.kFiveMinReplyTime,
                  style: getmediumStyle(
                    color: ColorManager.kDarkGreyColor,
                    fontSize: ScreenUtil().setSp(FontSize.s14.sp),
                  ),
                ),
              ],
            ),
          ),

          // Profile Pictures Row
          buildStackedImages(),
          SizedBox(height: 10),
          // Start Live Chat Button
          button(
            text: AppStrings.kStartLiveChat,
            iconPath: ImageAssets.kStartLiveChatIcon,
            onTap: () {
              //Navigator.pushNamed(context, CustomRouteNames.kAddDisputeScreenRoute);
            },
          ),
          // Privacy Note
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(ImageAssets.kLockIcon, height: 20, width: 20),
              SizedBox(width: 8),
              Text(
                AppStrings.kAllConversationsAreSafePrivate,
                style: getRegularStyle(
                  color: ColorManager.kDarkGreyColor,
                  fontSize: ScreenUtil().setSp(FontSize.s14.sp),
                ),
              ),
            ],
          ),

          SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget buildStackedImages() {
    final double size = 50;
    final imageList = [
      ImageAssets.starUserImage1,
      ImageAssets.starUserImage2,
      ImageAssets.starUserImage3,
      ImageAssets.starUserImage4,
      ImageAssets.starUserImage2,
    ];
    final items = imageList.map((imagepath) => buildImage(imagepath)).toList();
    return Stackedwidget(
      items: items,
      size: size,
      xShift: 12,
      direction: TextDirection.rtl,
    );
  }

  Widget buildImage(String imagePath) {
    final double bordersize = AppSize.s4;
    return ClipOval(
      child: Container(
        color: ColorManager.kWhiteColor,
        padding: EdgeInsets.all(bordersize),
        child: ClipOval(child: Image.asset(imagePath, fit: BoxFit.cover)),
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
      horizontalMargin: 0.04,
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
