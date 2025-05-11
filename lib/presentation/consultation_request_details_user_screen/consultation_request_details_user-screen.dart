import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../export_casekarao.dart';

class ConsultationRequestsDetailsUserScreen extends StatelessWidget {
  PendingStatusItemModel data;

  ConsultationRequestsDetailsUserScreen({super.key, required this.data});

  final List<String> imageUrls = [
    ImageAssets.letStartedImage,
    ImageAssets.letStartedImage,
    ImageAssets.letStartedImage,
    ImageAssets.letStartedImage,
  ];

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
          AppStrings.kConsultationRequestsDetails,
          style: getsemiboldStyle(
            color: ColorManager.primary,
            fontSize: ScreenUtil().setSp(FontSize.s16),
          ),
        ),
      ),
      bottomSheet:        Card(
        margin: EdgeInsets.zero,
        elevation: 4, // Set your desired elevation
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(14.r),
            topRight: Radius.circular(14.r),
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: ColorManager.kWhiteColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(14.r),
              topRight: Radius.circular(14.r),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Flexible(
                  flex: 1,
                  child: button(
                    text: AppStrings.kDelete,
                    color: ColorManager.kRed300Color,
                    onTap: () {
                     Navigator.pop(context);
                    },
                  ),
                ),
                SizedBox(width: AppSize.s8.h),
                Flexible(
                  flex: 3,
                  child: button(
                    text: AppStrings.kEdit,
                    color: ColorManager.secondary,
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        CustomRouteNames.kSendOfferScreenRoute,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: AppSize.sizeHeight(context) * 0.01),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppSize.sizeWidth(context!) * 0.04,
              ),
              child: Text(
                data.title,
                style: getsemiboldStyle(
                  color: ColorManager.primary,
                  fontSize: ScreenUtil().setSp(AppSize.s24),
                ),
              ),
            ),
            SizedBox(height: AppSize.s8.h),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppSize.sizeWidth(context!) * 0.04,
              ),
              child: Text(
                //data.subtitle,
                AppStrings.kLoremIpsumIsSimplyDummy,
                style: getmediumStyle(
                  color: ColorManager.kDarkGreyColor,
                  fontSize: ScreenUtil().setSp(AppSize.s12),
                ),
              ),
            ),
            Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppSize.sizeWidth(context!) * 0.03,
                  vertical: AppSize.sizeHeight(context!) * 0.04,
                ),
                child: AmountBarWidget(
                  amount: 500.00,
                  backGroundColor: ColorManager.kWhiteColor,
                )

            ),
            //
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppSize.sizeWidth(context!) * 0.04,
              ),
              child: Text(
                AppStrings.kAttachedDocuments,
                style: getsemiboldStyle(
                  color: ColorManager.primary,
                  fontSize: ScreenUtil().setSp(AppSize.s16),
                ),
              ),
            ),
            SizedBox(height: AppSize.s8.h),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppSize.sizeWidth(context!) * 0.04,
              ),
              child: Wrap(
                spacing: 8,
                runSpacing: 8,
                children:
                imageUrls.map((url) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      url,
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                    ),
                  );
                }).toList(),
              ),
            ),
            SizedBox(height: AppSize.s20.h),



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
    double? margin,
  }) {
    return CustomButton(
      color: color ?? ColorManager.primary,
      horizontalMargin:margin?? 0.0,
      borderRadius: BorderRadius.circular(12.r),
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
