import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../export_casekarao.dart';

class LawyerDetailsScreen extends StatefulWidget {
  final PendingStatusItemModel data;

  const LawyerDetailsScreen({super.key, required this.data});

  @override
  State<LawyerDetailsScreen> createState() => _LawyerDetailsScreenState();
}

class _LawyerDetailsScreenState extends State<LawyerDetailsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.kBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
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
        centerTitle: true,
        title: Text(
          AppStrings.kLawyerDetails,
          style: getsemiboldStyle(
            color: ColorManager.primary,
            fontSize: ScreenUtil().setSp(FontSize.s16),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 8.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Profile section
                    _buildProfileSection(),
                    SizedBox(height: 16.h),
            
                    // Statistics section
                    _buildStatisticsSection(),
                    SizedBox(height: 16.h),
            
                    // About section with tabs
                    _buildAboutSection(),
                    SizedBox(height: 16.h),
            
                   
                  ],
                ),
              ),
            ),
          ),
           // Availability section
                
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            child: button(
              text: AppStrings.kMessageLawyer,
              onTap: () {},
            ),
          ),
                  
        ],
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
            SizedBox(height: 120.h),
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

  // Statistics section with Cases Won and Experience
  Widget _buildStatisticsSection() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: ColorManager.kWhiteColor,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.r),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Text(
                  "100+",
                  style: getboldStyle(
                    color: ColorManager.primary,
                    fontSize: ScreenUtil().setSp(AppSize.s22),
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  "Cases Won",
                  style: getRegularStyle(
                    color: ColorManager.kDarkGreyColor,
                    fontSize: ScreenUtil().setSp(AppSize.s10),
                  ),
                ),
              ],
            ),
            SizedBox(width: 16.w),
            Column(
              children: [
                Text(
                  "08+",
                  style: getboldStyle(
                    color: ColorManager.primary,
                    fontSize: ScreenUtil().setSp(AppSize.s22),
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  "Experience",
                  style: getRegularStyle(
                    color: ColorManager.kDarkGreyColor,
                    fontSize: ScreenUtil().setSp(AppSize.s10),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // About section with tabs
  Widget _buildAboutSection() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: ColorManager.kWhiteColor,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Tab bar
          TabBar(
            controller: _tabController,
            labelColor: ColorManager.primary,
            unselectedLabelColor: ColorManager.kGreyColor,
            indicatorColor: Colors.transparent,
            dividerColor: Colors.transparent,
            tabs: const [
              Tab(text: "About the Lawyer"),
              Tab(text: "Rating and Reviews"),
            ],
          ),

          // Tab content
          SizedBox(
            height: 280.h,
            child: TabBarView(
              controller: _tabController,
              children: [
                // About tab content
                Padding(
                  padding: EdgeInsets.all(16.r),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book",
                          style: getRegularStyle(
                            color: ColorManager.kDarkGreyColor,
                            fontSize: ScreenUtil().setSp(AppSize.s12),
                          ),
                          maxLines: 5,
                          overflow: TextOverflow.ellipsis,
                        ),
                        GestureDetector(
                          onTap: () {
                            // Handle see more tap
                          },
                          child: Text(
                            "See more...",
                            style: getmediumStyle(
                              color: ColorManager.primary,
                              fontSize: ScreenUtil().setSp(AppSize.s14),
                            ),
                          ),
                        ),
                        SizedBox(height: 10.w),
                        Divider(
                            thickness: 1.0,
                            color: ColorManager.kGreyBackViewColor),
                        SizedBox(height: 10.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Lawyer Availability",
                              style: getsemiboldStyle(
                                color: ColorManager.primary,
                                fontSize: ScreenUtil().setSp(AppSize.s16),
                              ),
                            ),
                            SizedBox(height: 16.h),
                            _buildAvailabilityRow(
                                "Monday", "10:00am to 05:00pm"),
                            _buildAvailabilityRow(
                                "Tuesday", "10:00am to 05:00pm"),
                            _buildAvailabilityRow(
                                "Wednesday", "10:00am to 05:00pm"),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                // Reviews tab content
                Padding(
                  padding: EdgeInsets.all(16.r),
                  child: Center(
                    child: Text(
                      "No reviews yet",
                      style: getmediumStyle(
                        color: ColorManager.kDarkGreyColor,
                        fontSize: ScreenUtil().setSp(AppSize.s14),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Helper method for availability rows
  Widget _buildAvailabilityRow(String day, String hours) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            day,
            style: getmediumStyle(
              color: ColorManager.primary,
              fontSize: ScreenUtil().setSp(AppSize.s12),
            ),
          ),
          Text(
            hours,
            style: getRegularStyle(
              color: ColorManager.kDarkGreyColor,
              fontSize: ScreenUtil().setSp(AppSize.s12),
            ),
          ),
        ],
      ),
    );
  }

  Widget button({
    Function()? onTap,
    String? text,
    Color? color,
    Color? fontColor,
    String? iconPath,
    double? margin,
  }) {
    return CustomButton(
      color: color ?? ColorManager.primary,
      horizontalMargin: margin ?? 0.0,
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
