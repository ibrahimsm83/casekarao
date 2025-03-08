import 'package:casekarao/export_casekarao.dart';
import 'package:casekarao/presentation/case_list_screen/case_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class HomeLawyerScreen extends StatefulWidget {
  const HomeLawyerScreen({super.key});

  @override
  State<HomeLawyerScreen> createState() => _HomeLawyerScreenState();
}

class _HomeLawyerScreenState extends State<HomeLawyerScreen> {
  final List<String> statuses = ["Pending", "Ongoing", "Canceled", "Completed"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.kBackgroundColor,
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppSize.sizeWidth(context!) * 0.03,
        ),
        child: Column(
          children: [
            const SizedBox(height: 10),
            welcome(),
            _buildStatusRow(
              firstStatus: StatusItem(
                title: AppStrings.kPending,
                subtitle: AppStrings.kViewDetails,
                count: "05",
                countBgColor: ColorManager.kLightYellowColor,
                countTextColor: ColorManager.kDarkYellowColor,
                onTap: () {
                  print("pending taped");
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>CaseListScreen(status:statuses[0])));
                },
              ),
              secondStatus: StatusItem(
                title: AppStrings.kOnGoing,
                subtitle: AppStrings.kViewDetails,
                count: "13",
                countBgColor: ColorManager.kLightBlueColor,
                countTextColor: ColorManager.kDarkBlueColor,
                onTap: () {
                  print("ongoing taped");
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>CaseListScreen(status:statuses[1])));
                },
              ),
            ),
            const SizedBox(height: 05),
            _buildStatusRow(
              firstStatus: StatusItem(
                title: AppStrings.kCanceled,
                subtitle: AppStrings.kViewDetails,
                count: "01",
                countBgColor: ColorManager.kLightRedColor,
                countTextColor: ColorManager.kDarkRedColor,
                onTap: () {
                  print("canceled taped");
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>CaseListScreen(status:statuses[2])));
                },
              ),
              secondStatus: StatusItem(
                title: AppStrings.kCompleted,
                subtitle: AppStrings.kViewDetails,
                count: "50",
                countBgColor: ColorManager.kLightGreenColor,
                countTextColor: ColorManager.kDarkGreenColor,
                onTap: () {
                  print("completed tapped");
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>CaseListScreen(status:statuses[3])));
                },
              ),
            ),

          ],
        ),
      ),
    );
  }

  Widget welcome() {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 0.0),
      leading: ClipOval(
        child: Image.asset(ImageAssets.userImage, height: 60, width: 60),
      ),
      title: Text(
        AppStrings.kWelcome,
        style: getlightStyle(
          color: ColorManager.kGreyColor,
          fontSize: ScreenUtil().setSp(AppSize.s14),
        ),
      ),
      subtitle: Text(
        "David Waston",
        style: getsemiboldStyle(
          color: ColorManager.primary,
          fontSize: ScreenUtil().setSp(AppSize.s16),
        ),
      ),
      trailing: InkWell(
        onTap: () {
          //Notification screen
        },
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
    );
  }

  /// Builds a row containing two status cards
  Widget _buildStatusRow({required StatusItem firstStatus, required StatusItem secondStatus}) {
    return Row(
      children: [
        Expanded(child: _buildStatusTile(firstStatus)),
        const SizedBox(width: 10), // Space between tiles
        Expanded(child: _buildStatusTile(secondStatus)),
      ],
    );
  }
  /// Builds an individual status tile with a rounded card and ListTile
  Widget _buildStatusTile(StatusItem status) {
    return Card(
      color: ColorManager.kWhiteColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSize.s14.r),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.only(left: 10.0),
        onTap: status.onTap,
        leading: Container(
          height: 35.h,
          width: 35.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            color: status.countBgColor.withOpacity(0.3),
          ),
          child: Center(
            child: Text(
              status.count,
              textAlign: TextAlign.center,
              style: getsemiboldStyle(
                color: status.countTextColor,
                fontSize: ScreenUtil().setSp(AppSize.s16),
              ),
            ),
          ),
        ),
        title: Text(
          status.title,
          style: getsemiboldStyle(
            color: ColorManager.primary,
            fontSize: ScreenUtil().setSp(AppSize.s14),
          ),
        ),
        subtitle: Text(
          status.subtitle,
          style: getRegularStyle(
            color: ColorManager.kGreyColor,
            fontSize: ScreenUtil().setSp(AppSize.s10),
          ),
        ),
      ),
    );
  }

  // Widget status({required String title,required String subtitle,required String count,required Function()? onTap,required Color countTextColor,required Color countBgColor,}) {
  //   return Card(
  //     color: ColorManager.kWhiteColor,
  //     shape: RoundedRectangleBorder(
  //       borderRadius: BorderRadius.circular(AppSize.s14.r), // Rounded corners
  //     ),
  //     child: ListTile(
  //       onTap:onTap,
  //       leading: Container(
  //         height: 35.h,
  //         width: 35.h,
  //         decoration: BoxDecoration(
  //           borderRadius: BorderRadius.all(Radius.circular(8.r)),
  //           color: countBgColor.withOpacity(0.3),
  //         ),
  //         child: Center(
  //           child: Text(
  //             count,
  //             textAlign: TextAlign.center,
  //             style: getsemiboldStyle(
  //               color:countTextColor,
  //               fontSize: ScreenUtil().setSp(AppSize.s16),
  //             ),
  //           ),
  //         ),
  //       ),
  //       title: Text(
  //         title,
  //         style: getsemiboldStyle(
  //           color: ColorManager.primary,
  //           fontSize: ScreenUtil().setSp(AppSize.s14),
  //         ),
  //       ),
  //       subtitle: Text(
  //       subtitle,
  //         style: getRegularStyle(
  //           color: ColorManager.kGreyColor,
  //           fontSize: ScreenUtil().setSp(AppSize.s10),
  //         ),
  //       ),
  //     ),
  //   );
  // }

}
