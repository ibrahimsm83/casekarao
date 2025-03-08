import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../export_casekarao.dart';

class PendingScreen extends StatelessWidget {
  PendingScreen({super.key});



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
        itemCount: DataList.pendingList.length,
        itemBuilder: (context, index) {
          return Padding(
              padding: EdgeInsets.symmetric(
              horizontal: AppSize.sizeWidth(context!) * 0.04),
          child: PendingStatusCard(status:DataList.pendingList[index],));
          //CaseCard(caseData: filteredCases[index]);
        },
      ),
    );
  }


}
