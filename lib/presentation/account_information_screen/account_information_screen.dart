import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../export_casekarao.dart';

class AccountInformationScreen extends StatefulWidget {
  const AccountInformationScreen({super.key});

  @override
  State<AccountInformationScreen> createState() =>
      _AccountInformationScreenState();
}

class _AccountInformationScreenState extends State<AccountInformationScreen> {
  List<UserSettingsModel> helpAndSupportList = [
    UserSettingsModel(
      title: AppStrings.kPersonalInformation,
      iconPath: ImageAssets.kLiveChatIcon,
      navigateRoute: "",
    ),
    UserSettingsModel(
      title: AppStrings.kLegalExperience,
      iconPath: ImageAssets.kTermConditionIcon,
      navigateRoute: '',
    ),
    UserSettingsModel(
      title: AppStrings.kEducationCertifications,
      iconPath: ImageAssets.kPrivacyPolicyIcon,
      navigateRoute: '',
    ),
    UserSettingsModel(
      title: AppStrings.kBusinessAvailability,
      iconPath: ImageAssets.kAboutIcon,
      navigateRoute: '',
    ),
  ];

  List<String> items = [
    AppStrings.governmentIssuedIDUpload,
    AppStrings.barIDCardUpload,
    AppStrings.selfieForIdentityVerification,
    // AppStrings.optionalDetails + AppStrings.enhancingProfile,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.kBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          AppStrings.kAccountInformation,
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
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppSize.sizeWidth(context) * 0.03,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.0),
              UserInfoWidget(isShowViewProfileButton: false),
              SizedBox(height: 20.0),
              Padding(
                padding: EdgeInsets.only(
                  top: ScreenUtil().setHeight(10.0),
                  bottom: ScreenUtil().setHeight(10.0),
                ),
                child: Text(
                  AppStrings.kAccountPreferences,
                  style: getsemiboldStyle(
                    color: ColorManager.primary,
                    fontSize: ScreenUtil().setSp(AppSize.s16),
                  ),
                ),
              ),
              ListView.separated(
                itemCount: helpAndSupportList.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                separatorBuilder:
                    (context, index) => const SizedBox(height: 10.0),
                itemBuilder:
                    (context, index) => Padding(
                      padding: EdgeInsets.only(top: index == 0 ? 10.0 : 0.0),
                      child: customListTile(
                        title: helpAndSupportList[index].title,
                        leadingIcon: helpAndSupportList[index].iconPath,
                        onTap: () {
                          // if (index == 0 ||
                          //     index == 1 ||
                          //     index == 2 ||
                          //     index == 3) {
                          //   Navigator.pushNamed(
                          //     context,
                          //     helpAndSupportList[index].navigateRoute,
                          //     arguments:
                          //         TermsAndConditionArgumentModel.required(
                          //           title: helpAndSupportList[index].title,
                          //           details: "",
                          //         ),
                          //   );
                          //}
                        },
                      ),
                    ),
              ),
              SizedBox(height: 10.0),
              //
              ListView.separated(
                separatorBuilder: (context, i) {
                  return SizedBox(height: 10);
                },
                physics: const NeverScrollableScrollPhysics(),
                itemCount: items.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  String item = items[index];
                  bool isSelected = true;
                  //selectedItems.contains(item);
                  return ListTile(
                    //onTap:(){},
                    minTileHeight: 45.h,
                    tileColor: ColorManager.kWhiteColor,
                    title: Text(
                      item,
                      style: getmediumStyle(
                        color: ColorManager.primary,
                        fontSize: ScreenUtil().setSp(AppSize.s14),
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        AppSize.s14.r,
                      ), // Set border radius
                    ),
                    trailing: Container(
                      height: 24.h,
                      width: 24.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color:
                            isSelected
                                ? ColorManager.kGreenColor
                                : ColorManager.kBackgroundColor,
                      ),
                      child: Icon(
                        Icons.check,
                        color:
                            isSelected
                                ? ColorManager.kWhiteColor
                                : ColorManager.kGreyColor,
                      ),
                    ),
                  );
                },
              ),

    Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: customListTile(
      title:AppStrings.optionalDetails + AppStrings.enhancingProfile,
      onTap: () {}),
    ),
              SizedBox(height: 10.0),
            ],
          ),
        ),
      ),
    );
  }

  Widget customListTile({
    String? title,
    String? leadingIcon,
    void Function()? onTap,
  }) {
    return Material(
      color: ColorManager.kWhiteColor, // Move tileColor here
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        // Needed for proper ripple clipping
        onTap: onTap,
        child: ListTile(
          //contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          // leading: SvgPicture.asset(leadingIcon ?? ImageAssets.kPersonIcon),
          title: Text(
            title ?? "",
            style: getmediumStyle(color: ColorManager.primary, fontSize: 14.sp),
          ),
          trailing: SvgPicture.asset(ImageAssets.kForwardArrowIcon),
        ),
      ),
    );
  }

  // Widget customListTile({
  //   String? title,
  //   String? leadingIcon,
  //   void Function()? onTap,
  // }) {
  //   return Material(
  //     borderRadius: BorderRadius.circular(12),
  //     child: ListTile(
  //       tileColor:  ColorManager.kWhiteColor,
  //       leading: SvgPicture.asset(leadingIcon ?? ImageAssets.kPersonIcon),
  //       title: Text(
  //         title ?? "",
  //         style: getmediumStyle(color: ColorManager.primary, fontSize: 14.sp),
  //       ),
  //       trailing: SvgPicture.asset(ImageAssets.kForwardArrowIcon),
  //       onTap: onTap,
  //     ),
  //   );
  // }
}
