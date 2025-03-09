import 'package:casekarao/export_casekarao.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class AppointmentsLawyerScreen extends StatefulWidget {
  const AppointmentsLawyerScreen({super.key});

  @override
  State<AppointmentsLawyerScreen> createState() => _AppointmentsLawyerScreenState();
}

class _AppointmentsLawyerScreenState extends State<AppointmentsLawyerScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.kBackgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppSize.sizeWidth(context!) * 0.03,
          ),
          child: Column(
            children: [
              SizedBox(height: ScreenUtil().setHeight(10.0)),
              welcome(),
              SizedBox(height: ScreenUtil().setHeight(20.0)),

              rowText(
                  text1: AppStrings.kNewConsultationRequests,
                  text2: AppStrings.kViewAll,
                  onTap: (){
                    Navigator.pushNamed(
                      context,
                      CustomRouteNames.kPendingScreenRoute,
                    );
                  }
              ),
              SizedBox(height: 16.h),
              SizedBox(
                height: 200,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (context, i) => SizedBox(width:10.0),
                  itemCount: DataList.pendingList.length,
                  itemBuilder: (context, index) {
                    return PendingStatusCard(status: DataList.pendingList[index],
                    onTap: (){
                      print("tapped $index");
                    },
                    );
                    //CaseCard(caseData: filteredCases[index]);
                  },
                ),
              ),
              const SizedBox(height: 10),
              rowText(
                  text1: AppStrings.kOnGoingCases,
                  text2: AppStrings.kViewAll,
                  onTap: (){
                    Navigator.pushNamed(
                      context,
                      CustomRouteNames.kOnGoingScreenRoute,
                    );
                  }
              ),
              SizedBox(height: 16.h),
              OnGoingStatusCard(status:DataList.onGoingList[0]),
              OnGoingStatusCard(status:DataList.onGoingList[4]),
            ],
          ),
        ),
      ),
    );
  }

  Widget welcome() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
      Text(
        "David Waston",
        style: getsemiboldStyle(
          color: ColorManager.primary,
          fontSize: ScreenUtil().setSp(AppSize.s16),
        ),
      ),
      InkWell(
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

    ],);


      ListTile(
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
  Widget rowText({String? text1, String? text2, Function()? onTap}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text1 ?? "",
            style: getsemiboldStyle(color: ColorManager.primary, fontSize: ScreenUtil().setSp(FontSize.s16.sp)),
            textAlign: TextAlign.left,
          ),
          GestureDetector(
            onTap: onTap,
            child: Text(text2 ?? "", //AppStrings.viewAll,
                style: getRegularStyle(
                    color: ColorManager.primary, fontSize: ScreenUtil().setSp(FontSize.s12.sp))),
          ),
        ],
      ),
    );
  }
  /// Builds a row containing two status cards
  Widget _buildStatusRow({
    required StatusItem firstStatus,
    required StatusItem secondStatus,
  }) {
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

}
