import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../export_casekarao.dart';

class SetupProfileScreen extends StatefulWidget {
  const SetupProfileScreen({super.key});

  @override
  State<SetupProfileScreen> createState() => _SetupProfileScreenState();
}

class _SetupProfileScreenState extends State<SetupProfileScreen> {
  List<String> items = [
    AppStrings.personalInformation,
    AppStrings.legalExperience,
    AppStrings.educationAndCertifications,
    AppStrings.businessAndAvailability,
    AppStrings.governmentIssuedIDUpload,
    AppStrings.barIDCardUpload,
    AppStrings.selfieForIdentityVerification,
    AppStrings.optionalDetails + AppStrings.enhancingProfile,
  ];
  List<String> selectedItems = [];

  void toggleSelection(String item) {
    setState(() {
      if (selectedItems.contains(item)) {
        selectedItems.remove(item);
      } else {
        selectedItems.add(item);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.kBackgroundColor,
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppSize.sizeWidth(context!) * 0.05,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: AppSize.sizeHeight(context) * 0.05),
            InkWell(
              onTap: () => Navigator.pop(context),
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
            SizedBox(height: AppSize.sizeHeight(context) * 0.01),
            Text(
              AppStrings.setupProfile,
              style: getsemiboldStyle(
                color: ColorManager.primary,
                fontSize: ScreenUtil().setSp(AppSize.s24),
              ),
            ),
            SizedBox(height: AppSize.s8.h),
            Text(
              AppStrings
                  .createYourLawyerProfileWithAccurateDetailsToHelpUsersFindYouEasily,
              style: getmediumStyle(
                color: ColorManager.kDarkGreyColor,
                fontSize: ScreenUtil().setSp(AppSize.s12),
              ),
            ),
            Flexible(
              child: ListView.separated(
                separatorBuilder: (context, i) {
                  return SizedBox(height: 10);
                },
                itemCount: items.length,
                itemBuilder: (context, index) {
                  String item = items[index];
                  bool isSelected = selectedItems.contains(item);
                  return ListTile(
                    onTap: () {
                      toggleSelection(item);
                    },
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
            ),
            SizedBox(height: AppSize.s8.h),
            Text(
              AppStrings.noteCompleteAllRequired,
              style: getmediumStyle(
                color: ColorManager.kDarkGreyColor,
                fontSize: ScreenUtil().setSp(AppSize.s12),
              ),
            ),
            button(
              text: AppStrings.saveAndContinue,
              onTap: () {
                // Navigator.pushNamed(
                //   context,
                //   CustomRouteNames.kSetupProfileScreenRoute,
                // );
              },
            ),
            SizedBox(height: AppSize.s8.h),
          ],
        ),
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
