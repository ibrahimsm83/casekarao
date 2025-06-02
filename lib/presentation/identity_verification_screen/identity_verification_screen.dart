import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:get/get.dart';

import '../../export_casekarao.dart';

class IdentityVerificationScreen extends StatefulWidget {
  const IdentityVerificationScreen({super.key});

  @override
  State<IdentityVerificationScreen> createState() => _IdentityVerificationScreenState();
}

class _IdentityVerificationScreenState extends State<IdentityVerificationScreen> {
  File? selfieImage;
  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.kBackgroundColor,
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppSize.sizeWidth(context) * 0.05,
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
                fontSize: ScreenUtil().setSp(AppSize.s22),
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
              onTap: () => _captureAndCropSelfie(),
              child: Align(
                alignment: Alignment.center,
                child: selfieImage != null
                    ? Container(
                        width: 200,
                        height: 260,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(130),
                          border: Border.all(
                            color: ColorManager.secondary,
                            width: 3,
                          ),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(127),
                          child: Image.file(
                            selfieImage!,
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: double.infinity,
                          ),
                        ),
                      )
                    : SvgPicture.asset(
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

            // Status indicator
            if (selfieImage != null)
              Container(
                margin: EdgeInsets.only(bottom: AppSize.s10.h),
                padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                decoration: BoxDecoration(
                  color: ColorManager.secondary.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(
                    color: ColorManager.secondary.withValues(alpha: 0.3),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.check_circle,
                      color: ColorManager.secondary,
                      size: 16.0,
                    ),
                    SizedBox(width: 8.0),
                    Text(
                      'Selfie captured successfully!',
                      style: getmediumStyle(
                        color: ColorManager.secondary,
                        fontSize: ScreenUtil().setSp(AppSize.s12),
                      ),
                    ),
                  ],
                ),
              ),

            Align(
              alignment: Alignment.center,
              child: Text(
                AppStrings.placeYourFaceIntoTheGridAndHoldStill,
                style: getmediumStyle(
                  color: ColorManager.kDarkGreyColor,
                  fontSize: ScreenUtil().setSp(AppSize.s14),
                ),
              ),
            ),
            SizedBox(height: AppSize.s8.h),
            InkWell(
              onTap: () {
                // Submit selfie if captured
                if (selfieImage != null) {
                  Get.find<SetupProfileController>().submitSelfie(
                    selfieImage: selfieImage!,
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Please capture your selfie first'),
                      backgroundColor: ColorManager.kRedColor,
                    ),
                  );
                }
              },
              child: Container(
                width: AppSize.sizeWidth(context),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(13.r),
                  color: selfieImage != null
                      ? ColorManager.primary
                      : ColorManager.kGreyColor,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Center(
                    child: Text(
                      selfieImage != null
                          ? AppStrings.submit
                          : AppStrings.uploadYourSelfie,
                      style: getmediumStyle(color: ColorManager.kWhiteColor),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Simple selfie capture and crop method
  Future<void> _captureAndCropSelfie() async {
    try {
      // Pick image from camera (front camera for selfie)
      final XFile? pickedFile = await _picker.pickImage(
        source: ImageSource.camera,
        preferredCameraDevice: CameraDevice.front,
        imageQuality: 80,
      );

      if (pickedFile != null) {
        // Crop the image in circular/oval shape
        final CroppedFile? croppedFile = await ImageCropper().cropImage(
          sourcePath: pickedFile.path,
          aspectRatio: CropAspectRatio(ratioX: 3, ratioY: 4), // Portrait ratio for selfie
          uiSettings: [
            AndroidUiSettings(
              toolbarTitle: 'Crop Selfie',
              toolbarColor: ColorManager.primary,
              toolbarWidgetColor: ColorManager.kWhiteColor,
              backgroundColor: ColorManager.kBackgroundColor,
              activeControlsWidgetColor: ColorManager.primary,
            ),
            IOSUiSettings(
              title: 'Crop Selfie',
            ),
          ],
        );

        if (croppedFile != null) {
          setState(() {
            selfieImage = File(croppedFile.path);
          });
        }
      }
    } catch (e) {
      // Handle error
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error capturing selfie: $e')),
        );
      }
    }
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
