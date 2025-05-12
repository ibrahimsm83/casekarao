import 'package:casekarao/export_casekarao.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class EarningsLawyerScreen extends StatefulWidget {
  const EarningsLawyerScreen({super.key});

  @override
  State<EarningsLawyerScreen> createState() => _EarningsLawyerScreenState();
}

class _EarningsLawyerScreenState extends State<EarningsLawyerScreen> {
  String? selectedType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.kBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: SizedBox.shrink(),
        leadingWidth: 0.0,
        actions: [
          InkWell(
            onTap: () => Navigator.pop(context),
            child: Padding(
              padding: const EdgeInsets.only(right: 10.0, bottom: 5.0),
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
        title: Text(
          AppStrings.kEarnings,
          style: getsemiboldStyle(
            color: ColorManager.primary,
            fontSize: ScreenUtil().setSp(FontSize.s26),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppSize.sizeWidth(context!) * 0.04,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: ScreenUtil().setHeight(6.0)),

            Container(
              decoration: BoxDecoration(
                color: ColorManager.secondary,
                borderRadius: BorderRadius.all(Radius.circular(14.r)),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10.0,
                  vertical: 15.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppStrings.kTotalEarning,
                          style: getmediumStyle(
                            color: ColorManager.kWhiteColor,
                            fontSize: ScreenUtil().setSp(AppSize.s14),
                          ),
                        ),
                        Text(
                          "${AppStrings.kPKR} 75000.84",
                          style: getboldStyle(
                            color: ColorManager.kWhiteColor,
                            fontSize: ScreenUtil().setSp(AppSize.s20),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(width: 140, child: dropDown()),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: ScreenUtil().setHeight(10.0),
                bottom: ScreenUtil().setHeight(10.0),
              ),
              child: Text(
                AppStrings.kRecentActivity,
                style: getsemiboldStyle(
                  color: ColorManager.primary,
                  fontSize: ScreenUtil().setSp(AppSize.s16),
                ),
              ),
            ),

            Flexible(
              child: ListView.separated(
                separatorBuilder: (context, i) => SizedBox(height: 10.0),
                itemCount: DataList.recentActivityList.length,
                itemBuilder: (context, index) {
                  return userList(
                    DataList.recentActivityList[index],
                    // onTap: () {
                    //   print("tapped $index");
                    // },
                  );
                  //CaseCard(caseData: filteredCases[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget userList(RecentActivityModel data) {
    return ListTile(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14.r)),
      tileColor: ColorManager.kWhiteColor,
      leading: CircleAvatar(
        radius: 20, // Size of the avatar
        backgroundImage: AssetImage(data.userImage), // Local image
      ),
      title: Text(
        data.title,
        style: getmediumStyle(
          color: ColorManager.primary,
          fontSize: ScreenUtil().setSp(AppSize.s10),
        ),
      ),
      subtitle: Row(
        children: [
          Text(
            data.subtitle,
            style: getmediumStyle(
              color: ColorManager.primary,
              fontSize: ScreenUtil().setSp(AppSize.s14),
            ),
          ),
          SizedBox(width: 3.0),
          Text(
            data.milestone,
            style: getRegularStyle(
              color: ColorManager.secondary,
              fontSize: ScreenUtil().setSp(AppSize.s10),
            ),
          ),
        ],
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "PKR${data.receivedAmount}",
            style: getsemiboldStyle(
              color: ColorManager.primary,
              fontSize: ScreenUtil().setSp(AppSize.s16),
            ),
          ),
          SizedBox(width: 10.0),
          Text(
            data.amountStatus,
            style: getRegularStyle(
              color: ColorManager.kDarkGreyColor,
              fontSize: ScreenUtil().setSp(AppSize.s10),
            ),
          ),
        ],
      ),
    );
  }

  Widget dropDown() {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: SizedBox(
        height: 34,
        child: DropdownButtonFormField<String>(
          value: selectedType,
          style: getRegularStyle(color: ColorManager.primary),
          dropdownColor: ColorManager.kWhiteColor,
          icon: Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: SvgPicture.asset(ImageAssets.arrowDownIcon),
          ),
          decoration: InputDecoration(
            filled: true,
            fillColor: ColorManager.kInputTexBgColor,
            contentPadding: EdgeInsets.only(left: 10.0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(color: ColorManager.kInputTexBgColor),
            ),
            labelText: "February, 2025",
            labelStyle: getRegularStyle(color: ColorManager.primary),
          ),
          onChanged: (String? newValue) {
            setState(() {
              selectedType = newValue;
            });
          },
          items:
              ["March, 2025", "April, 2025", "May, 2025"].map((String lang) {
                return DropdownMenuItem<String>(value: lang, child: Text(lang));
              }).toList(),
        ),
      ),
    );
  }
}
