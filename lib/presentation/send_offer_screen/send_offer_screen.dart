import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../export_casekarao.dart';

class SendOfferScreen extends StatefulWidget {
  const SendOfferScreen({super.key});

  @override
  State<SendOfferScreen> createState() => _SendOfferScreenState();
}

class _SendOfferScreenState extends State<SendOfferScreen> {
  FocusNode node = FocusNode();
  FocusNode node1 = FocusNode();
  final _formKey = GlobalKey<FormState>();
  final _desController = TextEditingController();
  final _titleController = TextEditingController();
  List<DocumentAttachment> _attachments = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.kBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          AppStrings.kSendOfferToLawyer,
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
            horizontal: AppSize.sizeWidth(context) * 0.05,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildProfileSection(),
                Padding(
                  padding: EdgeInsets.only(
                    top: AppSize.s20.h,
                    bottom: AppSize.s6.h,
                  ),
                  child: Text(
                    AppStrings.kCaseTitle,
                    style: getmediumStyle(
                      color: ColorManager.kDarkGreyColor,
                      fontSize: ScreenUtil().setSp(AppSize.s12),
                    ),
                  ),
                ),
                CustomTextFormField(
                  hintText: AppStrings.kCorporateIssue,
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
                //(height: AppSize.s8.h),
                Padding(
                  padding: EdgeInsets.only(
                    top: AppSize.s10.h,
                    bottom: AppSize.s6.h,
                  ),
                  child: Text(
                    AppStrings.kCaseDescription,
                    style: getmediumStyle(
                      color: ColorManager.kDarkGreyColor,
                      fontSize: ScreenUtil().setSp(AppSize.s12),
                    ),
                  ),
                ),
                CustomTextFormField(
                  hintText: AppStrings.kCaseDetaildescription,
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

                Padding(
                  padding: EdgeInsets.only(
                    top: AppSize.s10.h,
                    bottom: AppSize.s6.h,
                  ),
                  child: Text(
                    AppStrings.kCaseAmount,
                    style: getmediumStyle(
                      color: ColorManager.kDarkGreyColor,
                      fontSize: ScreenUtil().setSp(AppSize.s12),
                    ),
                  ),
                ),
                CustomTextFormField(
                  suffixIcon: const Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Text("PKR"),
                  ),
                  hintText: "Ex :500.00", //AppStrings.kCorporateIssue,
                  controller: _titleController,
                  fillColor: ColorManager.kWhiteColor,
                  focusNode: node,
                  horizontalMergin: 0.0,
                  validator: (String? val) {
                    if (val == null || val.isEmpty) {
                      return "Enter Title";
                    }
                    return null;
                  },
                ),

                SizedBox(height: AppSize.s15.h),
                // Text(
                //   AppStrings.kAttachDocument,
                //   style: getsemiboldStyle(
                //     color: ColorManager.primary,
                //     fontSize: ScreenUtil().setSp(AppSize.s16),
                //   ),
                // ),

                // Padding(
                //   padding: EdgeInsets.only(top: 5.h, bottom: AppSize.s15.h),
                //   child: Text(
                //     AppStrings.kPleaseUploadAttachmentsMax5,
                //     style: getRegularStyle(
                //       color: ColorManager.kDarkGreyColor,
                //       fontSize: ScreenUtil().setSp(AppSize.s12),
                //     ),
                //   ),
                // ),

                // AddButton(
                //   onTap: () {
                //     print("Add button tapped");
                //     // Add your functionality here
                //   },
                // ),
                DocumentAttachmentSection(
                  title: 'Attach Document',
                  subtitle: '', //Please upload attachments (max 5)
                  maxAttachments: 5,
                  onAttachmentsChanged: (attachments) {
                    setState(() {
                      _attachments = attachments;
                    });
                  },
                ),

                SizedBox(height: AppSize.sizeHeight(context) * 0.15),
                button(
                  text: AppStrings.sendOffer,
                  onTap: () {
                    print(_attachments[0].file);
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

  // Profile section with image, name, rating and location
  Widget _buildProfileSection() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: ColorManager.primary,
        borderRadius: BorderRadius.circular(16.r),
        image: DecorationImage(
          image: const AssetImage(ImageAssets.starUserImage5),
          fit: BoxFit.contain,
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.5),
            BlendMode.darken,
          ),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 80.h),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "David Watson",
                  style: getboldStyle(
                    color: ColorManager.kWhiteColor,
                    fontSize: ScreenUtil().setSp(AppSize.s22),
                  ),
                ),
                SizedBox(width: 8.w),
                Container(
                  decoration: BoxDecoration(
                    color: ColorManager.kCardBgColor.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(AppSize.s6.r),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: AppPadding.p8.w,
                    vertical: AppPadding.p4.h,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        ImageAssets.kStarIcon,
                        height: AppSize.s8.h,
                        width: AppSize.s8.w,
                        colorFilter: ColorFilter.mode(
                          ColorManager.kLightYellowColor,
                          BlendMode.srcIn,
                        ),
                      ),
                      SizedBox(width: AppSize.s4.w),
                      Text(
                        "4.5", //rating.toString(),
                        style: getRegularStyle(
                          color: ColorManager.kWhiteColor,
                          fontSize: ScreenUtil().setSp(FontSize.s8),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              children: [
                SvgPicture.asset(
                  ImageAssets.kLocationIcon,
                  height: AppSize.s16.h,
                  width: AppSize.s16.w,
                  colorFilter: ColorFilter.mode(
                    ColorManager.kGreyColor,
                    BlendMode.srcIn,
                  ),
                ),
                SizedBox(width: 4.w),
                Text(
                  "Sydney, Australia",
                  style: getRegularStyle(
                    color: ColorManager.kGreyColor,
                    fontSize: ScreenUtil().setSp(AppSize.s14),
                  ),
                ),
              ],
            ),
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

// class AddButton extends StatelessWidget {
//   final VoidCallback onTap;

//   const AddButton({super.key, required this.onTap});

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         width: 80,
//         height: 80,
//         decoration: BoxDecoration(
//           color: Color(0xFFFAFAF7), // off-white
//           borderRadius: BorderRadius.circular(12.r), // rounded corners
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black12,
//               blurRadius: 8,
//               offset: Offset(2, 4),
//             ),
//           ],
//         ),
//         child: Center(child: Icon(Icons.add, size: 36, color: Colors.black)),
//       ),
//     );
//   }
// }
