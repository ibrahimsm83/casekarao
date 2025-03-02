import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../export_casekarao.dart';

class IdentityVerificationScreen extends StatelessWidget {
  const IdentityVerificationScreen({super.key});

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
              AppStrings.selfieForIdentityVerification,
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
            SizedBox(height: AppSize.s30.h),
            InkWell(
              onTap: (){
                Navigator.pushNamed(
                  context,
                  CustomRouteNames.kApplicationUnderReviewScreenRoute,
                );
              },
              child: Align(
                alignment: Alignment.center,
                child: SvgPicture.asset(
                  ImageAssets.faceIcon,
                  //colorFilter: ColorFilter.mode(Colors.kg, BlendMode.srcIn),
                ),
              ),
            ),
            // Stack(
            //   alignment: Alignment.center,
            //   children: [
            //     // White Inner Filled Oval
            //     Container(
            //       width: 200,
            //       height: 260,
            //       decoration: BoxDecoration(
            //         color: Colors.white, // White fill color
            //         shape: BoxShape.rectangle,
            //         borderRadius: BorderRadius.circular(130), // Makes it oval
            //       ),
            //     ),
            //     // Dashed Border Oval
            //     CustomPaint(
            //       size: Size(200, 260), // Size of the oval
            //       painter: DashedOvalPainter(),
            //     ),
            //   ],
            // ),
            SizedBox(height: 20),
            Align(
              alignment:Alignment.center ,
              child: Text(
                AppStrings.placeYourFaceIntoTheGridAndHoldStill,
                style: getmediumStyle(
                  color: ColorManager.kDarkGreyColor,
                  fontSize: ScreenUtil().setSp(AppSize.s14),
                ),
              ),
            ),
            SizedBox(height: AppSize.s8.h),
          ],
        ),
      ),
    );
  }
}

// Custom Painter for Dashed Oval
class DashedOvalPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint =
        Paint()
          ..color = Colors.grey
          ..style = PaintingStyle.stroke
          ..strokeWidth = 3;

    Path path = Path();
    path.addOval(Rect.fromLTWH(0, 0, size.width, size.height));

    double dashWidth = 10, dashSpace = 6;
    Path dashPath = Path();
    for (PathMetric pathMetric in path.computeMetrics()) {
      double distance = 0;
      while (distance < pathMetric.length) {
        dashPath.addPath(
          pathMetric.extractPath(distance, distance + dashWidth),
          Offset.zero,
        );
        distance += dashWidth + dashSpace;
      }
    }

    canvas.drawPath(dashPath, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
