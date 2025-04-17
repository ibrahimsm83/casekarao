import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../export_casekarao.dart';

class CasesScreen extends StatelessWidget {

  const CasesScreen({super.key});



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.kBackgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        //leading: SizedBox.shrink(),
        title: Text(
          AppStrings.kCase,
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
        ],
      ),
      body: ListView.separated(
        separatorBuilder: (context, i) => SizedBox(height: 5.0),
        itemCount: DataList.onGoingList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppSize.sizeWidth(context!) * 0.04,
            ),
            child: OnGoingStatusCard(status:DataList.onGoingList[index],onDetailsTap: (){
              Navigator.pushNamed(
                  context,
                  CustomRouteNames.kCaseDetailsScreenRoute,
              );
            },
              onMessageTap: (){
                Navigator.pushNamed(
                    context,
                    CustomRouteNames.kCaseDiscussionScreenRoute,
                    arguments: false
                );
              },
            ),
          );
          //CaseCard(caseData: filteredCases[index]);
        },
      ),
    );
  }


}
