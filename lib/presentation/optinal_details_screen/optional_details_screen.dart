import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../export_casekarao.dart';

class OptionalDetailsScreen extends StatefulWidget {
  const OptionalDetailsScreen({super.key});

  @override
  State<OptionalDetailsScreen> createState() => _OptionalDetailsScreenState();
}

class _OptionalDetailsScreenState extends State<OptionalDetailsScreen> {
  final _formKey = GlobalKey<FormState>();
  FocusNode node1 = FocusNode();
  final _bioController = TextEditingController();
  String? selectedType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.kBackgroundColor,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
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
                  AppStrings.optionalDetails,
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
                SizedBox(height: AppSize.s8.h),
                Padding(
                  padding: EdgeInsets.only(
                    top: AppSize.s10.h,
                    bottom: AppSize.s6.h,
                  ),
                  child: Text(
                    AppStrings.bioProfessionalSummary,
                    style: getmediumStyle(
                      color: ColorManager.kDarkGreyColor,
                      fontSize: ScreenUtil().setSp(AppSize.s12),
                    ),
                  ),
                ),
                CustomTextFormField(
                  hintText: AppStrings.exTellUsMoreAboutYourself,
                  controller: _bioController,
                  fillColor: ColorManager.kWhiteColor,
                  maxLines: 6,
                  focusNode: node1,
                  horizontalMergin: 0.0,
                  validator: (String? val) {
                    if (val == null || val.isEmpty) {
                      return "Enter Bio";
                    }
                    return null;
                  },
                ),
                heading(AppStrings.languagesSpoken, AppStrings.multiSelect),
                jurisdiction(),

                SizedBox(height: AppSize.sizeHeight(context) * 0.2),
                button(
                  text: AppStrings.submit,
                  onTap: () {
                    if (!_formKey.currentState!.validate()) {
                      Navigator.pushNamed(
                        context,
                        CustomRouteNames.kCNICUploadScreenRoute,
                      );
                    }
                  },
                ),

                SizedBox(height: 5.h),
              ],
            ),
          ),
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

  Widget heading(String text1, String text2) {
    return Padding(
      padding: EdgeInsets.only(top: AppSize.s20.h, bottom: AppSize.s6.h),
      child: Row(
        children: [
          Text(
            text1,
            style: getmediumStyle(
              color: ColorManager.kDarkGreyColor,
              fontSize: ScreenUtil().setSp(AppSize.s12),
            ),
          ),
          Text(
            text2,
            style: getmediumStyle(
              color: ColorManager.secondary,
              fontSize: ScreenUtil().setSp(AppSize.s12),
            ),
          ),
        ],
      ),
    );
  }

  Widget jurisdiction() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0.0),
      child: SizedBox(
        height: 45,
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
            fillColor: ColorManager.kWhiteColor,
            contentPadding: EdgeInsets.only(left: 10.0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(color: ColorManager.secondary),
            ),
            labelText: "English",
            labelStyle: getRegularStyle(color: ColorManager.kHintTextColor),
          ),
          onChanged: (String? newValue) {
            setState(() {
              selectedType = newValue;
            });
          },
          items:
              ["English Uk", "Arabic", "Chinese"].map((String lang) {
                return DropdownMenuItem<String>(value: lang, child: Text(lang));
              }).toList(),
        ),
      ),
    );
  }
}
