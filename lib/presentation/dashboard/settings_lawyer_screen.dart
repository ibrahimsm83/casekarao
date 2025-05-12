import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../export_casekarao.dart';

class SettingsLawyerScreen extends StatefulWidget {
  const SettingsLawyerScreen({super.key});

  @override
  State<SettingsLawyerScreen> createState() => _SettingsLawyerScreenState();
}
  final UserRoleController _userRoleController = Get.find<UserRoleController>();
class _SettingsLawyerScreenState extends State<SettingsLawyerScreen> {


  List<UserSettingsModel> accountList=[
      _userRoleController.isUser ?
    UserSettingsModel(title:  AppStrings.kPersonalInformation, iconPath:  ImageAssets.kPersonIcon, navigateRoute: CustomRouteNames.kPersonalInformationScreenRoute)
    :UserSettingsModel(title:  AppStrings.kAccountInformation, iconPath:  ImageAssets.kPersonIcon, navigateRoute: CustomRouteNames.kAccountInformationScreenRoute),
    UserSettingsModel(title:  AppStrings.kChangePassword, iconPath:  ImageAssets.kLockIcon, navigateRoute:  CustomRouteNames.kChangePasswordScreenRoute),
    UserSettingsModel(title:  AppStrings.kDispute, iconPath:  ImageAssets.kFlagIcon, navigateRoute:  CustomRouteNames.kDisputeScreenRoute),
    UserSettingsModel(title:  AppStrings.kNotifications, iconPath:  ImageAssets.kNotificationIcon, navigateRoute:  CustomRouteNames.kNotificationSettingScreenRoute),
    UserSettingsModel(title:  AppStrings.kPayout, iconPath:  ImageAssets.kWalletIcon, navigateRoute:  CustomRouteNames.kPayoutDetailsScreenRoute,),
  ];

  List<UserSettingsModel> helpAndSupportList=[
    UserSettingsModel(title:  AppStrings.kLiveChat, iconPath:  ImageAssets.kLiveChatIcon, navigateRoute: CustomRouteNames.kLiveChatScreenRoute),
    UserSettingsModel(title:  AppStrings.kTermConditions, iconPath:  ImageAssets.kTermConditionIcon, navigateRoute: CustomRouteNames.kTermsConditionScreenRoute),
    UserSettingsModel(title:  AppStrings.kPrivacyPolicy, iconPath:  ImageAssets.kPrivacyPolicyIcon, navigateRoute: CustomRouteNames.kTermsConditionScreenRoute),
    UserSettingsModel(title:  AppStrings.kAboutCaseKarao, iconPath:  ImageAssets.kAboutIcon, navigateRoute: CustomRouteNames.kTermsConditionScreenRoute),
  ];

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
                //width: 44.h,
                decoration: BoxDecoration(
                  color: ColorManager.kWhiteColor,
                  borderRadius: BorderRadius.all(Radius.circular(16.r)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Row(
                    children: [
                      SvgPicture.asset(ImageAssets.kLogoutIcon),
                      Text(
                        AppStrings.kLogout,
                        style: getsemiboldStyle(
                          color: ColorManager.primary,
                          fontSize: ScreenUtil().setSp(FontSize.s14),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
        title: Text(
          AppStrings.kSettings,
          style: getsemiboldStyle(
            color: ColorManager.primary,
            fontSize: ScreenUtil().setSp(FontSize.s26),
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
              UserInfoWidget(isShowViewProfileButton: true),

              Padding(
                padding: EdgeInsets.only(
                  top: ScreenUtil().setHeight(10.0),
                  bottom: ScreenUtil().setHeight(10.0),
                ),
                child: Text(
                  AppStrings.kAccount,
                  style: getsemiboldStyle(
                    color: ColorManager.primary,
                    fontSize: ScreenUtil().setSp(AppSize.s16),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(14.r)),
                  color: ColorManager.kWhiteColor,
                ),
                child: ListView.separated(
                  itemCount: accountList.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  separatorBuilder:
                      (context, index) => const SizedBox(height: 0.0),
                  itemBuilder:
                      (context, index) => 
                      !_userRoleController.isUser || index!=4?
                      Padding(
                        padding: EdgeInsets.only(top: index == 0 ? 10.0 : 0.0),
                        child: customListTile(
                          title: accountList[index].title,
                          leadingIcon: accountList[index].iconPath,
                          onTap: () {
                             if(index==0||index==1||index==2||index==3||index==4){
                              Navigator.pushNamed(context, accountList[index].navigateRoute);
                            }
                          },
                        ),
                      ):SizedBox(),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: ScreenUtil().setHeight(10.0),
                  bottom: ScreenUtil().setHeight(10.0),
                ),
                child: Text(
                  AppStrings.kHelpSupport,
                  style: getsemiboldStyle(
                    color: ColorManager.primary,
                    fontSize: ScreenUtil().setSp(AppSize.s16),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(14.r)),
                  color: ColorManager.kWhiteColor,
                ),
                child: ListView.separated(
                  itemCount: helpAndSupportList.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  separatorBuilder:
                      (context, index) => const SizedBox(height: 0.0),
                  itemBuilder:
                      (context, index) => Padding(
                        padding: EdgeInsets.only(top: index == 0 ? 10.0 : 0.0),
                        child: customListTile(
                          title: helpAndSupportList[index].title,
                          leadingIcon: helpAndSupportList[index].iconPath,
                          onTap: () {
                            if(index==0||index==1||index==2||index==3) {
                              Navigator.pushNamed(context,
                                  helpAndSupportList[index].navigateRoute,
                                  arguments: TermsAndConditionArgumentModel
                                      .required(
                                      title: helpAndSupportList[index].title,
                                      details: "")
                              );
                            }
                          },
                        ),
                      ),
                ),
              ),
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
    return ListTile(
      leading: SvgPicture.asset(leadingIcon ?? ImageAssets.kPersonIcon),
      title: Text(
        title ?? "",
        style: getmediumStyle(color: ColorManager.primary, fontSize: 14.sp),
      ),
      trailing: SvgPicture.asset(ImageAssets.kForwardArrowIcon),
      onTap: onTap,
    );
  }
}
