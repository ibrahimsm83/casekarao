import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../export_casekarao.dart';

class BusinessAndAvailabilityScreen extends StatefulWidget {
  const BusinessAndAvailabilityScreen({super.key});

  @override
  State<BusinessAndAvailabilityScreen> createState() =>
      _BusinessAndAvailabilityScreenState();
}

class _BusinessAndAvailabilityScreenState
    extends State<BusinessAndAvailabilityScreen> {
  int selectedid = 0;
  final _formKey = GlobalKey<FormState>();
  FocusNode node1 = FocusNode();
  final _officeAddressController = TextEditingController();

  // Selected days for multiple selection
  List<String> selectedDays = [];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: ColorManager.kBackgroundColor,
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: AppSize.sizeHeight(context) * 0.05),
                InkWell(
                  onTap: () => Navigator.pop(context),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: AppSize.sizeWidth(context) * 0.05,
                    ),
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
                SizedBox(height: AppSize.sizeHeight(context) * 0.01),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppSize.sizeWidth(context) * 0.05,
                  ),
                  child: Text(
                    AppStrings.businessAndAvailability,
                    style: getsemiboldStyle(
                      color: ColorManager.primary,
                      fontSize: ScreenUtil().setSp(AppSize.s24),
                    ),
                  ),
                ),
                SizedBox(height: AppSize.s8.h),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppSize.sizeWidth(context) * 0.05,
                  ),
                  child: Text(
                    AppStrings
                        .createYourLawyerProfileWithAccurateDetailsToHelpUsersFindYouEasily,
                    style: getmediumStyle(
                      color: ColorManager.kDarkGreyColor,
                      fontSize: ScreenUtil().setSp(AppSize.s12),
                    ),
                  ),
                ),
                SizedBox(height: AppSize.s8.h),
                Padding(
                  padding: EdgeInsets.only(
                    top: AppSize.s10.h,
                    bottom: AppSize.s6.h,
                    left: AppSize.sizeWidth(context) * 0.05,
                  ),
                  child: Text(
                    AppStrings.officeAddress,
                    style: getmediumStyle(
                      color: ColorManager.kDarkGreyColor,
                      fontSize: ScreenUtil().setSp(AppSize.s12),
                    ),
                  ),
                ),
                CustomTextFormField(
                  hintText: AppStrings.exCompleteStreetAddress,
                  controller: _officeAddressController,
                  fillColor: ColorManager.kWhiteColor,
                  focusNode: node1,
                  horizontalMergin: 0.05,
                  validator: (String? val) {
                    if (val == null || val.isEmpty) {
                      return "Enter Office Address";
                    }
                    return null;
                  },
                ),
                // SizedBox(height: AppSize.s8.h),
                Padding(
                  padding: EdgeInsets.only(
                    top: AppSize.s18.h,
                    bottom: AppSize.s12.h,
                    left: AppSize.sizeWidth(context) * 0.05,
                  ),
                  child: Text(
                    AppStrings.availabilitySchedule,
                    style: getmediumStyle(
                      color: ColorManager.kDarkGreyColor,
                      fontSize: ScreenUtil().setSp(AppSize.s12),
                    ),
                  ),
                ),
                availabilitySchedule(),

                // Display selected days
                if (selectedDays.isNotEmpty)
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: AppSize.sizeWidth(context) * 0.05,
                      vertical: AppSize.s10.h,
                    ),
                    child: Container(
                      padding: EdgeInsets.all(12.0),
                      decoration: BoxDecoration(
                        color: ColorManager.kLightBlueColor.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(
                          color: ColorManager.secondary.withValues(alpha: 0.3),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Selected Days:',
                            style: getmediumStyle(
                              color: ColorManager.kDarkGreyColor,
                              fontSize: ScreenUtil().setSp(AppSize.s12),
                            ),
                          ),
                          SizedBox(height: 4.0),
                          Text(
                            selectedDays.join(', '),
                            style: getsemiboldStyle(
                              color: ColorManager.secondary,
                              fontSize: ScreenUtil().setSp(AppSize.s14),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppSize.sizeWidth(context) * 0.05,
                  ),
                  child: Divider(),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: AppSize.s10.h,
                    bottom: AppSize.s6.h,
                    left: AppSize.sizeWidth(context) * 0.05,
                  ),
                  child: Text(
                    AppStrings.monday,
                    style: getmediumStyle(
                      color: ColorManager.kDarkGreyColor,
                      fontSize: ScreenUtil().setSp(AppSize.s14),
                    ),
                  ),
                ),
                fromTo(),
                Padding(
                  padding: EdgeInsets.only(
                    top: AppSize.s10.h,
                    bottom: AppSize.s6.h,
                    left: AppSize.sizeWidth(context) * 0.05,
                  ),
                  child: Text(
                    AppStrings.thursday,
                    style: getmediumStyle(
                      color: ColorManager.kDarkGreyColor,
                      fontSize: ScreenUtil().setSp(AppSize.s14),
                    ),
                  ),
                ),
                fromTo(),
                Padding(
                  padding: EdgeInsets.only(
                    top: AppSize.s10.h,
                    bottom: AppSize.s6.h,
                    left: AppSize.sizeWidth(context) * 0.05,
                  ),
                  child: Text(
                    AppStrings.friday,
                    style: getmediumStyle(
                      color: ColorManager.kDarkGreyColor,
                      fontSize: ScreenUtil().setSp(AppSize.s14),
                    ),
                  ),
                ),
                fromTo(),
                SizedBox(height: AppSize.s20.h),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppSize.sizeWidth(context) * 0.05,
                  ),
                  child: button(
                    text: AppStrings.submit,
                    onTap: () {
                      bool isValid = _formKey.currentState!.validate();

                      if (isValid) {
                        // Debug: Print selected days
                        print('Selected Days: $selectedDays');

                        // Call API with form data
                        Get.find<SetupProfileController>().submitBusinessAvailability(
                          address: _officeAddressController.text.trim(),
                          availableDays: selectedDays,
                        );
                      }
                    },
                  ),
                ),
      
                SizedBox(height: 5.h),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget fromTo() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppSize.sizeWidth(context) * 0.03,
      ),
      child: Row(
        children: [
          SizedBox(width: 10.0),
          Flexible(child: timeBox(AppStrings.from)),
          SizedBox(width: 10.0),
          Flexible(child: timeBox(AppStrings.to)),
          SizedBox(width: 10.0),
        ],
      ),
    );
  }

  Widget timeBox(String title) {
    return Container(
      decoration: BoxDecoration(
        color: ColorManager.kWhiteColor,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(left: AppSize.s10.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: getmediumStyle(
                      color: ColorManager.kDarkGreyColor,
                      fontSize: ScreenUtil().setSp(AppSize.s12),
                    ),
                  ),
                  Text(
                    AppStrings.hHMM,
                    style: getRegularStyle(
                      color: ColorManager.kHintTextColor,
                      fontSize: ScreenUtil().setSp(AppSize.s12),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: AppSize.s10.w),
              child: SvgPicture.asset(ImageAssets.clockIcon),
            ),
          ],
        ),
      ),
    );
  }

  Widget availabilitySchedule() {
    return MultipleSelectionToggleList(
      selectedItems: selectedDays,
      onSelectionChanged: (List<String> newSelection) {
        setState(() {
          selectedDays = newSelection;
        });
      },
      categories: [
        AppStrings.mon,
        AppStrings.tue,
        AppStrings.wed,
        AppStrings.thu,
        AppStrings.fri,
        AppStrings.sat,
        AppStrings.sun,
      ],
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
