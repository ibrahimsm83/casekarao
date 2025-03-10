import 'package:casekarao/export_casekarao.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class DocumentsScreen extends StatelessWidget {
  const DocumentsScreen({Key? key}) : super(key: key);

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
              height: 40.h,
              width: 40.h,
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
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppStrings.kDocuments,
              style: getsemiboldStyle(
                color: ColorManager.primary,
                fontSize: ScreenUtil().setSp(FontSize.s16),
              ),
            ),
            Text(
              AppStrings.k1stMilestone,
              style: getsemiboldStyle(
                color: ColorManager.secondary,
                fontSize: ScreenUtil().setSp(FontSize.s10),
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppSize.sizeWidth(context!) * 0.03,
        ),
        child: Column(
          children: [
            Divider(),
            documentsCard(),
            documentsCard(),
            Spacer(),
            button(
              text: AppStrings.kUploadDocument,
              onTap: () {
                // Navigator.pushNamed(
                //   context,
                //   CustomRouteNames.kDashboardScreenRoute,
                // );
              },
            ),
            SizedBox(height: 10.h),
          ],
        ),
      ),
    );
  }

  Widget documentsCard() {
    return Card(
      child: Container(
        padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: double.infinity,
              height: 122.h, //MediaQuery.of(context).size.height * 0.3,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  topRight: Radius.circular(10.0),
                ),
                image: DecorationImage(
                  colorFilter: ColorFilter.mode(
                    Colors.black12,
                    BlendMode.darken,
                  ),
                  fit: BoxFit.cover,
                  image: AssetImage(ImageAssets.documentsImage),
                ),
              ),
            ),
            SizedBox(height: 10.0),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset(ImageAssets.kPDFIcon),
                SizedBox(width: 5.0),
                Flexible(
                  child: Text(
                    AppStrings.kLoremIpsum,
                    style: getmediumStyle(
                      color: ColorManager.primary,
                      fontSize: ScreenUtil().setSp(AppSize.s12),
                    ),
                  ),
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.only(left: 30, top: 5.0, bottom: 5.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppStrings.k2pages,
                    style: getRegularStyle(
                      color: ColorManager.kDarkGreyColor,
                      fontSize: ScreenUtil().setSp(AppSize.s10),
                    ),
                  ),
                  SizedBox(width: 5.0),
                  Text(
                    AppStrings.kPDF,
                    style: getRegularStyle(
                      color: ColorManager.kDarkGreyColor,
                      fontSize: ScreenUtil().setSp(AppSize.s10),
                    ),
                  ),
                  SizedBox(width: 5.0),
                  Text(
                    "260kb",
                    style: getRegularStyle(
                      color: ColorManager.kDarkGreyColor,
                      fontSize: ScreenUtil().setSp(AppSize.s10),
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Text(
                  "4:19pm",
                  style: getRegularStyle(
                    color: ColorManager.kDarkGreyColor,
                    fontSize: ScreenUtil().setSp(AppSize.s10),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, bottom: 10.0),
              child: Text(
                AppStrings.kUploadedByLawyer,
                style: getmediumStyle(
                  color: ColorManager.primary,
                  fontSize: ScreenUtil().setSp(AppSize.s10),
                ),
              ),
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
