import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../export_casekarao.dart';

class AddDisputeScreen extends StatefulWidget {
  const AddDisputeScreen({super.key});

  @override
  State<AddDisputeScreen> createState() => _AddDisputeScreenState();
}

class _AddDisputeScreenState extends State<AddDisputeScreen> {
  FocusNode node = FocusNode();
  FocusNode node1 = FocusNode();
  final _formKey = GlobalKey<FormState>();
  final _desController = TextEditingController();
  final _titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.kBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          AppStrings.kAddDispute,
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
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppSize.sizeWidth(context!) * 0.05,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: AppSize.s20.h,
                    bottom: AppSize.s6.h,
                  ),
                  child: Text(
                    AppStrings.kDisputeTitle,
                    style: getmediumStyle(
                      color: ColorManager.kDarkGreyColor,
                      fontSize: ScreenUtil().setSp(AppSize.s12),
                    ),
                  ),
                ),
                CustomTextFormField(
                  hintText: AppStrings.kDisputeTitleHinttext,
                  controller: _titleController,
                  fillColor: ColorManager.kWhiteColor,
                  focusNode: node,
                  horizontalMergin: 0.0,
                  validator: (String? val) {
                    if (val == null || val.isEmpty) {
                      return "Enter Dispute Title";
                    }
                    return null;
                  },
                ),

                SizedBox(height: AppSize.s8.h),
                Padding(
                  padding: EdgeInsets.only(
                    top: AppSize.s10.h,
                    bottom: AppSize.s6.h,
                  ),
                  child: Text(
                    AppStrings.kDisputeDescription,
                    style: getmediumStyle(
                      color: ColorManager.kDarkGreyColor,
                      fontSize: ScreenUtil().setSp(AppSize.s12),
                    ),
                  ),
                ),
                CustomTextFormField(
                  hintText: AppStrings.kDisputeLoremIpsum,
                  controller: _desController,
                  fillColor: ColorManager.kWhiteColor,
                  maxLines: 6,
                  focusNode: node1,
                  horizontalMergin: 0.0,
                  validator: (String? val) {
                    if (val == null || val.isEmpty) {
                      return "Enter Description";
                    }
                    return null;
                  },
                ),
                SizedBox(height: AppSize.s15.h),
                Text(
                  AppStrings.kAttachMedia,
                  style: getsemiboldStyle(
                    color: ColorManager.primary,
                    fontSize: ScreenUtil().setSp(AppSize.s16),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(top: 5.h, bottom: AppSize.s15.h),
                  child: Text(
                    AppStrings.kPleaseUploadAttachmentsMax5,
                    style: getRegularStyle(
                      color: ColorManager.kDarkGreyColor,
                      fontSize: ScreenUtil().setSp(AppSize.s12),
                    ),
                  ),
                ),
                AddButton(
                  onTap: () {
                    print("Add button tapped");
                    // Add your functionality here
                  },
                ),
                SizedBox(height: AppSize.sizeHeight(context) * 0.15),
                button(
                  text: AppStrings.submit,
                  onTap: () {
                    if (!_formKey.currentState!.validate()) {
                      //Navigator.pushNamed(context, CustomRouteNames.kAddPayoutScreenRoute);
                    }
                  },
                ),
                SizedBox(height: 20.0),
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
      horizontalMargin: 0.00,
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

class AddButton extends StatelessWidget {
  final VoidCallback onTap;

  const AddButton({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          color: Color(0xFFFAFAF7), // off-white
          borderRadius: BorderRadius.circular(12.r), // rounded corners
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 8,
              offset: Offset(2, 4),
            ),
          ],
        ),
        child: Center(child: Icon(Icons.add, size: 36, color: Colors.black)),
      ),
    );
  }
}
