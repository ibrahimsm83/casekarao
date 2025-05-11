import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../export_casekarao.dart';

class RateReviewScreen extends StatefulWidget {
  const RateReviewScreen({super.key});

  @override
  State<RateReviewScreen> createState() => _RateReviewScreenState();
}

class _RateReviewScreenState extends State<RateReviewScreen> {
  FocusNode node1 = FocusNode();
  final _formKey = GlobalKey<FormState>();
  final _desController = TextEditingController();
  double _rating = 4.0; // Default rating value

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.kBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          AppStrings.kRateReview,
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
                SizedBox(height: 12.h),
                Container(
                  width: AppSize.sizeWidth(context),
                  padding: EdgeInsets.symmetric(vertical: 10.h,horizontal: 10.w),
                  decoration: BoxDecoration(
                    color: ColorManager.kWhiteColor,
                    borderRadius: BorderRadius.circular(8.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [

                      Padding(
                        padding: EdgeInsets.only(
                          top: AppSize.s10.h,
                          bottom: AppSize.s10.h,
                        ),
                        child: Text(
                          AppStrings.kHowWasYourExperience,
                          style: getmediumStyle(
                            color: ColorManager.primary,
                            fontSize: ScreenUtil().setSp(AppSize.s20),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          bottom: AppSize.s20.h,
                        ),
                        child: Text(
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                          textAlign: TextAlign.center,
                          style: getmediumStyle(
                            color: ColorManager.primary,
                            fontSize: ScreenUtil().setSp(AppSize.s10),
                          ),
                        ),
                      ),
                      Center(
                        child: StarRating(
                          rating: _rating,
                          size: 40,
                          allowHalfRating: true,
                          color: ColorManager.kLightYellowColor,
                          borderColor: ColorManager.kLightYellowColor,
                          onRatingChanged: (rating) {
                            // Store rating value
                            setState(() {
                              _rating = rating;
                            });
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: AppSize.s20.h,
                          bottom: AppSize.s10.h,
                        ),
                        child: Text(
                          AppStrings.kShareYourValuableComment,
                          style: getmediumStyle(
                            color: ColorManager.primary,
                            fontSize: ScreenUtil().setSp(AppSize.s18),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          bottom: AppSize.s20.h,
                        ),
                        child: Text(
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                          textAlign: TextAlign.center,
                          style: getmediumStyle(
                            color: ColorManager.primary,
                            fontSize: ScreenUtil().setSp(AppSize.s10),
                          ),
                        ),
                      ),
                      CustomTextFormField(
                        hintText: AppStrings.kShareYourThoughts,
                        controller: _desController,
                        fillColor: ColorManager.kbuttonBgColor,
                        maxLines: 6,
                        focusNode: node1,
                        horizontalMergin: 0.0,
                        // validator: (String? val) {
                        //   if (val == null || val.isEmpty) {
                        //     return AppStrings.kShareYourThoughts;
                        //   }
                        //   return null;
                        // },
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 20.h),
                button(
                  text: AppStrings.submit,
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      // Submit rating and review
                      // Here you would typically send the data to your backend
                      // _rating, _titleController.text, _desController.text, _attachments

                      // Show success message
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: const Text(AppStrings.kThankYouForYourReview),
                          backgroundColor: ColorManager.kGreenColor,
                        ),
                      );

                      // Return to previous screen after submission
                      Navigator.pop(context);
                    }
                  },
                ),
                const SizedBox(height: 20.0),
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