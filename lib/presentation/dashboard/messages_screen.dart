import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../export_casekarao.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.kBackgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        title: Text(
          AppStrings.kMessage,
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
      body: ListView.separated(
        separatorBuilder:
            (context, i) => Padding(
              padding: const EdgeInsets.only(
                left: 60.0,
                right: 20,
                bottom: 10.0,
              ),
              child: Divider(height: 10.0),
            ),
        itemCount: DataList.userMessageList.length,
        itemBuilder: (context, index) {
          return userList(
            DataList.userMessageList[index],
            onTap: () {
              Navigator.pushNamed(
                context,
                CustomRouteNames.kCaseDiscussionScreenRoute,
                arguments: true,
              );
            },
          );
        },
      ),
    );
  }

  Widget userList(UserMessageModel data, {void Function()? onTap}) {
    return ListTile(
      onTap: onTap,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14.r)),
      //  tileColor: ColorManager.kWhiteColor,
      leading: CircleAvatar(
        radius: 20, // Size of the avatar
        backgroundImage: AssetImage(data.userImage), // Local image
      ),
      title: Text(
        data.title,
        style: getmediumStyle(
          color: ColorManager.primary,
          fontSize: ScreenUtil().setSp(AppSize.s14),
        ),
      ),
      subtitle: Text(
        data.subtitle,
        style: getRegularStyle(
          color: ColorManager.kDarkGreyColor,
          fontSize: ScreenUtil().setSp(AppSize.s12),
        ),
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            data.dateTime,
            style: getRegularStyle(
              color: ColorManager.primary,
              fontSize: ScreenUtil().setSp(AppSize.s12),
            ),
          ),
          SizedBox(width: 10.0),
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color:
                  data.messageCount == 0
                      ? Colors.transparent
                      : ColorManager.secondary,
            ),
            child: Padding(
              padding: const EdgeInsets.all(4.4),
              child: Text(
                data.messageCount == 0 ? "" : data.messageCount.toString(),
                style: getsemiboldStyle(
                  color: ColorManager.kWhiteColor,
                  fontSize: ScreenUtil().setSp(AppSize.s10),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
