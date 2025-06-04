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
  late SetupProfileController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.find<SetupProfileController>();
  }

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
                child: GetBuilder<SetupProfileController>(
                  builder: (controller) {
                    // Show local image first if available
                    if (selfieImage != null) {
                      return Container(
                        width: 210,
                        height: 290,
                        child: Stack(
                          children: [
                            Container(
                              width: 210,
                              height: 290,
                              child: ClipRRect(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                                  child: Image.file(
                                    selfieImage!,
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                    height: double.infinity,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              child: SvgPicture.asset(
                                ImageAssets.faceIcon,
                                fit: BoxFit.cover,
                                width: 200,
                                height: 290,
                              ),
                            )
                          ],
                        ),
                      );
                    }
                    // Show existing image from profileData if available
                    else if (controller.profileData.value != null &&
                        controller.profileData.value!.data.selfie != null &&
                        controller.profileData.value!.data.selfie.toString().isNotEmpty) {
                      return Container(
                        width: 210,
                        height: 290,
                        child: Stack(
                          children: [
                            Container(
                              width: 210,
                              height: 290,
                              child: ClipRRect(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                                  child: Image.network(
                                    controller.profileData.value!.data.selfie.toString(),
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                    height: double.infinity,
                                    loadingBuilder: (context, child, loadingProgress) {
                                      if (loadingProgress == null) return child;
                                      return Center(
                                        child: CircularProgressIndicator(
                                          color: ColorManager.primary,
                                        ),
                                      );
                                    },
                                    errorBuilder: (context, error, stackTrace) {
                                      return SvgPicture.asset(
                                        ImageAssets.faceIcon,
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              child: SvgPicture.asset(
                                ImageAssets.faceIcon,
                                fit: BoxFit.cover,
                                width: 200,
                                height: 290,
                              ),
                            )
                          ],
                        ),
                      );
                    }
                    // Show placeholder if no image available
                    else {
                      return SvgPicture.asset(
                        ImageAssets.faceIcon,
                      );
                    }
                  },
                ),
              ),
            ),
           
            SizedBox(height: 20),

            // Status indicator
            GetBuilder<SetupProfileController>(
              builder: (controller) {
                bool hasSelfieImage = selfieImage != null ||
                    (controller.profileData.value != null &&
                     controller.profileData.value!.data.selfie != null &&
                     controller.profileData.value!.data.selfie.toString().isNotEmpty);

                if (hasSelfieImage) {
                  return Container(
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
                          'Selfie available!',
                          style: getmediumStyle(
                            color: ColorManager.secondary,
                            fontSize: ScreenUtil().setSp(AppSize.s12),
                          ),
                        ),
                      ],
                    ),
                  );
                } else {
                  return SizedBox.shrink();
                }
              },
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
            GetBuilder<SetupProfileController>(
              builder: (controller) {
                bool hasSelfieImage = selfieImage != null ||
                    (controller.profileData.value != null &&
                     controller.profileData.value!.data.selfie != null &&
                     controller.profileData.value!.data.selfie.toString().isNotEmpty);

                return InkWell(
                  onTap: () {
                    // Submit selfie if available
                    if (selfieImage != null) {
                      Get.find<SetupProfileController>().submitSelfie(
                        selfieImage: selfieImage!,
                      );
                    } else if (hasSelfieImage) {
                      // If existing selfie exists but no new local image, just navigate back
                      Get.back();
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
                      color: hasSelfieImage
                          ? ColorManager.primary
                          : ColorManager.kGreyColor,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Center(
                        child: Text(
                          hasSelfieImage
                              ? AppStrings.submit
                              : AppStrings.uploadYourSelfie,
                          style: getmediumStyle(color: ColorManager.kWhiteColor),
                        ),
                      ),
                    ),
                  ),
                );
              },
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
