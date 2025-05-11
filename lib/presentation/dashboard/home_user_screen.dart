import 'package:casekarao/export_casekarao.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class HomeUserScreen extends StatefulWidget {
  const HomeUserScreen({super.key});

  @override
  State<HomeUserScreen> createState() => _HomeUserScreenState();
}

class _HomeUserScreenState extends State<HomeUserScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.kBackgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppSize.sizeWidth(context) * 0.03,
          ),
          child: Column(
            children: [
              const SizedBox(height: 10),
              welcome(),
              // Find Top Class Lawyers section
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Find Top Class Lawyers",
                    style: getsemiboldStyle(
                      color: ColorManager.primary,
                      fontSize: ScreenUtil().setSp(FontSize.s20),
                    ),
                  ),
                  SizedBox(height: 16.h),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        _buildCategoryChip("Family Lawyer"),
                        SizedBox(width: 10.w),
                        _buildCategoryChip("Corporate Lawyer"),
                        SizedBox(width: 10.w),
                        _buildCategoryChip("Real Estate Lawyer"),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24.h),
              // Popular Lawyers section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Popular Lawyers",
                    style: getsemiboldStyle(
                      color: ColorManager.primary,
                      fontSize: ScreenUtil().setSp(FontSize.s20),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Handle view all tap
                    },
                    child: Text(
                      "View all",
                      style: getRegularStyle(
                        color: ColorManager.primary,
                        fontSize: ScreenUtil().setSp(FontSize.s14),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 16.h),

              // Lawyer cards
              Container(
                height: 260,
                child: ListView.separated(
                  separatorBuilder: (context, i) => const SizedBox(width: 10.0),
                  itemCount: 5,
                  scrollDirection: Axis.horizontal,
                  //shrinkWrap: true,
                  itemBuilder: (context, index) {
                  return _buildLawyerCard(
                    name: "David Watson",
                    experience: "08+ Experience",
                    location: "Sydney, Australia",
                    imagePath: ImageAssets.starUserImage5,
                    rating: 4.5,
                  );
                },),
              ),
              // SingleChildScrollView(
              //   scrollDirection: Axis.horizontal,
              //   child: Row(
              //     children: [
              //       _buildLawyerCard(
              //         name: "David Watson",
              //         experience: "08+ Experience",
              //         location: "Sydney, Australia",
              //         imagePath: ImageAssets.starUserImage5,
              //         rating: 4.5,
              //       ),
              //       SizedBox(width: 16.w),
              //       _buildLawyerCard(
              //         name: "Gretchen Arcand",
              //         experience: "10+ Experience",
              //         location: "Sydney, Australia",
              //         imagePath: ImageAssets.starUserImage5,
              //         rating: 4.5,
              //       ),
              //     ],
              //   ),
              // ),

              SizedBox(height: 24.h),

              // Ongoing Cases section
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Ongoing Cases",
                  style: getsemiboldStyle(
                    color: ColorManager.primary,
                    fontSize: ScreenUtil().setSp(FontSize.s20),
                  ),
                ),
              ),

              SizedBox(height: 16.h),

              // Case card
              _buildCaseCard(
                title: "Murder Case",
                subtitle: "1st Milestone",
                description:
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                paymentStatus: "Pending",
                lawyerName: "David Watson",
                lawyerType: "Corporate Lawyer",
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  Widget welcome() {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 0.0),
      leading: ClipOval(
        child: Image.asset(ImageAssets.userImage, height: 50, width: 50),
      ),
      title: Text(
        AppStrings.kWelcome,
        style: getlightStyle(
          color: ColorManager.kGreyColor,
          fontSize: ScreenUtil().setSp(AppSize.s12),
        ),
      ),
      subtitle: Text(
        "David Waston",
        style: getsemiboldStyle(
          color: ColorManager.primary,
          fontSize: ScreenUtil().setSp(AppSize.s14),
        ),
      ),
      trailing: SizedBox(
        width: 110,
        child: Row(
          children: [
            InkWell(
              onTap: () {
                //Notification screen
              },
              child: Container(
                height: 44.h,
                width: 44.h,
                decoration: BoxDecoration(
                  color: ColorManager.kWhiteColor,
                  borderRadius: BorderRadius.all(Radius.circular(16.r)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: SvgPicture.asset(ImageAssets.kSearchIcon),
                ),
              ),
            ),
            SizedBox(width: 10),
            InkWell(
              onTap: () {
                //Notification screen
              },
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
          ],
        ),
      ),
    );
  }

  Widget rowText({String? text1, String? text2, Function()? onTap}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text1 ?? "",
            style: getsemiboldStyle(
              color: ColorManager.primary,
              fontSize: ScreenUtil().setSp(FontSize.s16.sp),
            ),
            textAlign: TextAlign.left,
          ),
          GestureDetector(
            onTap: onTap,
            child: Text(
              text2 ?? "", //AppStrings.viewAll,
              style: getRegularStyle(
                color: ColorManager.primary,
                fontSize: ScreenUtil().setSp(FontSize.s12.sp),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Build a category chip widget
  Widget _buildCategoryChip(String label) {
    return Container(
      height: 38.h,
      decoration: BoxDecoration(
        color: ColorManager.kWhiteColor,
        borderRadius: BorderRadius.circular(AppSize.s22.r),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppPadding.p20.w,
          vertical: AppPadding.p12.h,
        ),
        child: Text(
          label,
          style: getRegularStyle(
            color: ColorManager.primary,
            fontSize: ScreenUtil().setSp(FontSize.s12),
          ),
        ),
      ),
    );
  }

  // Build a lawyer card widget
  Widget _buildLawyerCard({
    required String name,
    required String experience,
    required String location,
    required String imagePath,
    required double rating,
  }) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          CustomRouteNames.klawyerDetailsScreen,
          arguments: DataList.pendingList[1],
        );
      },
      child: Container(
        width: 170.w,
        decoration: BoxDecoration(
          color: ColorManager.kWhiteColor,
          borderRadius: BorderRadius.circular(AppSize.s16.r),
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Lawyer image with rating
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(AppSize.s16.r),
                        topRight: Radius.circular(AppSize.s16.r),
                      ),
                      child: Image.asset(
                        imagePath,
                        height: 150.h,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          decoration: BoxDecoration(
                            color: ColorManager.kWhiteColor,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(AppSize.s16.r),
                              topRight: Radius.circular(AppSize.s16.r),
                            ),
                          ),
                          height: 15,
                          width: 170.w,
                        ))
                  ],
                ),

                // Lawyer details
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(AppSize.s16.r),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: AppPadding.p8.r,
                        right: AppPadding.p8.r,
                        top: 0,
                        bottom: AppPadding.p8.r),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: getsemiboldStyle(
                            color: ColorManager.primary,
                            fontSize: ScreenUtil().setSp(FontSize.s16),
                          ),
                        ),
                        Text(
                          experience,
                          style: getRegularStyle(
                            color: ColorManager.kGreenColor,
                            fontSize: ScreenUtil().setSp(FontSize.s12),
                          ),
                        ),
                        SizedBox(height: AppSize.s16.h),
                        Row(
                          children: [
                            SvgPicture.asset(
                              ImageAssets.kLocationIcon,
                              color: ColorManager.kGreyColor,
                              height: AppSize.s14.h,
                              width: AppSize.s14.w,
                            ),
                            SizedBox(width: AppSize.s4.w),
                            Flexible(
                              child: Text(
                                location,
                                style: getRegularStyle(
                                  color: ColorManager.kDarkGreyColor,
                                  fontSize: ScreenUtil().setSp(FontSize.s8),
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              top: AppSize.s10.h,
              right: AppSize.s10.w,
              child: Container(
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
                      rating.toString(),
                      style: getRegularStyle(
                        color: ColorManager.kWhiteColor,
                        fontSize: ScreenUtil().setSp(FontSize.s8),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: AppSize.s10.h,
              right: AppSize.s10.w,
              child: InkWell(
                onTap: () {},
                child: Container(
                  height: 30.h,
                  width: 30.w,
                  decoration: BoxDecoration(
                    color: ColorManager.kBackgroundColor,
                    borderRadius: BorderRadius.all(Radius.circular(8.r)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8.0,
                      vertical: 5.0,
                    ),
                    child: SvgPicture.asset(ImageAssets.kRightArrowIcon),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  // Build a case card widget
  Widget _buildCaseCard({
    required String title,
    required String subtitle,
    required String description,
    required String paymentStatus,
    required String lawyerName,
    required String lawyerType,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: ColorManager.kWhiteColor,
        borderRadius: BorderRadius.circular(AppSize.s16.r),
      ),
      padding: EdgeInsets.all(AppPadding.p16.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title and subtitle
          Row(
            children: [
              Text(
                title,
                style: getsemiboldStyle(
                  color: ColorManager.primary,
                  fontSize: ScreenUtil().setSp(FontSize.s18),
                ),
              ),
              SizedBox(width: AppSize.s8.w),
              Text(
                subtitle,
                style: getmediumStyle(
                  color: ColorManager.secondary,
                  fontSize: ScreenUtil().setSp(FontSize.s14),
                ),
              ),
            ],
          ),

          SizedBox(height: AppSize.s8.h),

          // Description
          Text(
            description,
            style: getRegularStyle(
              color: ColorManager.primary,
              fontSize: ScreenUtil().setSp(FontSize.s12),
            ),
          ),

          SizedBox(height: AppSize.s16.h),

          // Payment status
          Row(
            children: [
              Text(
                "Payment Status: ",
                style: getmediumStyle(
                  color: ColorManager.primary,
                  fontSize: ScreenUtil().setSp(FontSize.s12),
                ),
              ),
              Text(
                paymentStatus,
                style: getmediumStyle(
                  color: paymentStatus == "Pending"
                      ? ColorManager.kOrangeColor
                      : ColorManager.kGreenColor,
                  fontSize: ScreenUtil().setSp(FontSize.s12),
                ),
              ),
            ],
          ),

          SizedBox(height: AppSize.s16.h),
          Divider(color: ColorManager.kGreyColor.withAlpha(77)),
          SizedBox(height: AppSize.s16.h),

          // Lawyer info
          Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(ImageAssets.userImage),
                radius: AppSize.s16.r,
              ),
              SizedBox(width: AppSize.s12.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    lawyerName,
                    style: getsemiboldStyle(
                      color: ColorManager.primary,
                      fontSize: ScreenUtil().setSp(FontSize.s14),
                    ),
                  ),
                  Text(
                    lawyerType,
                    style: getRegularStyle(
                      color: ColorManager.primary,
                      fontSize: ScreenUtil().setSp(FontSize.s12),
                    ),
                  ),
                ],
              ),
              Spacer(),
              // Text(
              //   "View Details",
              //   style: getRegularStyle(
              //     color: ColorManager.primary,
              //     fontSize: ScreenUtil().setSp(FontSize.s12),
              //   ),
              // ),
              // SvgPicture.asset(
              //   ImageAssets.kRightArrowIcon,
              //   height: AppSize.s16.h,
              //   width: AppSize.s16.w,
              //   colorFilter: ColorFilter.mode(ColorManager.primary, BlendMode.srcIn),
              // ),
              InkWell(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                    color: ColorManager.kBackgroundColor,
                    borderRadius: BorderRadius.all(Radius.circular(8.r)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8.0,
                      vertical: 5.0,
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            "View Details",
                            style: getRegularStyle(color: ColorManager.primary),
                          ),
                        ),
                        SvgPicture.asset(ImageAssets.kRightArrowIcon),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
