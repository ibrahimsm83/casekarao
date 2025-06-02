import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:get/get.dart';
import '../../export_casekarao.dart';

class BarIdCardUploadScreen extends StatefulWidget {
  const BarIdCardUploadScreen({super.key});

  @override
  State<BarIdCardUploadScreen> createState() => _BarIdCardUploadScreenState();
}

class _BarIdCardUploadScreenState extends State<BarIdCardUploadScreen> {
  File? frontImage;
  File? backImage;
  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.kBackgroundColor,
      body: SingleChildScrollView(
        child: Padding(
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
                AppStrings.barIDCardUpload,
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
              SizedBox(height: AppSize.sizeHeight(context) * 0.05),
              //bar id on front
              InkWell(
                onTap: () => _captureAndCropImage(true),
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: AppSize.sizeWidth(context),
                        height: 290,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(13.r),
                          color: ColorManager.kWhiteColor,
                        ),
                        child: frontImage != null
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(13.r),
                                child: Image.file(
                                  frontImage!,
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                  height: double.infinity,
                                ),
                              )
                            : Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(ImageAssets.scanIcon),
                                  Text(
                                    AppStrings.holdStill,
                                    style: getmediumStyle(color: ColorManager.primary),
                                  ),
                                ],
                              ),
                      ),
                    ),
                
                    Container(
                      width: AppSize.sizeWidth(context),
                      height: 310,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(13.r),
                        color: Colors.transparent,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SvgPicture.asset(ImageAssets.leftTopCornerIcon),
                              SvgPicture.asset(ImageAssets.rightTopCornerIcon),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SvgPicture.asset(ImageAssets.leftBottomCornerIcon),
                              SvgPicture.asset(ImageAssets.rightBottomCornerIcon),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 5.h),
               //bar id on back
              InkWell(
                onTap: () => _captureAndCropImage(false),
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: AppSize.sizeWidth(context),
                        height: 290,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(13.r),
                          color: ColorManager.kWhiteColor,
                        ),
                        child: backImage != null
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(13.r),
                                child: Image.file(
                                  backImage!,
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                  height: double.infinity,
                                ),
                              )
                            : Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(ImageAssets.scanIcon),
                                  Text(
                                    AppStrings.holdStill,
                                    style: getmediumStyle(color: ColorManager.primary),
                                  ),
                                ],
                              ),
                      ),
                    ),
                
                    Container(
                      width: AppSize.sizeWidth(context),
                      height: 310,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(13.r),
                        color: Colors.transparent,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SvgPicture.asset(ImageAssets.leftTopCornerIcon),
                              SvgPicture.asset(ImageAssets.rightTopCornerIcon),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SvgPicture.asset(ImageAssets.leftBottomCornerIcon),
                              SvgPicture.asset(ImageAssets.rightBottomCornerIcon),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: AppSize.s18.h),
              Text(
                AppStrings
                    .alignYourCertificateWithinTheMarkersForAutomaticScanning,
                textAlign: TextAlign.center,
                style: getmediumStyle(
                  color: ColorManager.kDarkGreyColor,
                  fontSize: ScreenUtil().setSp(AppSize.s12),
                ),
              ),
              SizedBox(height: 5.h),
              // Status indicator
              if (frontImage != null || backImage != null)
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
                        'Images captured: ${frontImage != null ? "Front" : ""}${frontImage != null && backImage != null ? " & " : ""}${backImage != null ? "Back" : ""}',
                        style: getmediumStyle(
                          color: ColorManager.secondary,
                          fontSize: ScreenUtil().setSp(AppSize.s12),
                        ),
                      ),
                    ],
                  ),
                ),

              InkWell(
                onTap: () {
                  // Submit Bar ID cards if at least one image is captured
                  if (frontImage != null || backImage != null) {
                    Get.find<SetupProfileController>().submitBarIdCards(
                      frontImage: frontImage,
                      backImage: backImage,
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Please capture at least one Bar ID card image'),
                        backgroundColor: ColorManager.kRedColor,
                      ),
                    );
                  }
                },
                child: Container(
                  width: AppSize.sizeWidth(context),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(13.r),
                    color: (frontImage != null || backImage != null)
                        ? ColorManager.primary
                        : ColorManager.kGreyColor,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Center(
                      child: Text(
                        (frontImage != null || backImage != null)
                            ? AppStrings.submit
                            : AppStrings.uploadYourID,
                        style: getmediumStyle(color: ColorManager.kWhiteColor),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 5.h),
            ],
          ),
        ),
      ),
    );
  }

  // Simple image capture and crop method
  Future<void> _captureAndCropImage(bool isFront) async {
    try {
      // Pick image from camera
      final XFile? pickedFile = await _picker.pickImage(
        source: ImageSource.camera,
        imageQuality: 80,
      );

      if (pickedFile != null) {
        // Crop the image
        final CroppedFile? croppedFile = await ImageCropper().cropImage(
          sourcePath: pickedFile.path,
          aspectRatio: CropAspectRatio(ratioX: 10, ratioY: 10), // ID card ratio
          uiSettings: [
            AndroidUiSettings(
              toolbarTitle: isFront ? 'Crop Front Bar ID' : 'Crop Back Bar ID',
              toolbarColor: ColorManager.primary,
              toolbarWidgetColor: ColorManager.kWhiteColor,
              backgroundColor: ColorManager.kBackgroundColor,
              activeControlsWidgetColor: ColorManager.primary,
            ),
            IOSUiSettings(
              title: isFront ? 'Crop Front Bar ID' : 'Crop Back Bar ID',
            ),
          ],
        );

        if (croppedFile != null) {
          setState(() {
            if (isFront) {
              frontImage = File(croppedFile.path);
            } else {
              backImage = File(croppedFile.path);
            }
          });
        }
      }
    } catch (e) {
      // Handle error
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error capturing image: $e')),
        );
      }
    }
  }
}
