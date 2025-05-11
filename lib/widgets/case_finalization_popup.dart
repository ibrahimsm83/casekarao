import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../presentation/resources/color_manager.dart';
import '../presentation/resources/font_manager.dart';
import '../presentation/resources/styles_manager.dart';
import '../presentation/resources/values_manager.dart';
import 'custom_button.dart';

class CaseFinalizationPopup extends StatefulWidget {
  final String title;
  final String message;
  final String primaryButtonText;
  final String? secondaryButtonText;
  final VoidCallback onPrimaryButtonPressed;
  final VoidCallback? onSecondaryButtonPressed;
  final String? iconPath;
  final bool barrierDismissible;

  const CaseFinalizationPopup({
    Key? key,
    required this.title,
    required this.message,
    required this.primaryButtonText,
    this.secondaryButtonText,
    required this.onPrimaryButtonPressed,
    this.onSecondaryButtonPressed,
    this.iconPath,
    this.barrierDismissible = true,
  }) : super(key: key);

  @override
  State<CaseFinalizationPopup> createState() => _CaseFinalizationPopupState();

  // Static method to show the popup
  static Future<void> show({
    required BuildContext context,
    required String title,
    required String message,
    required String primaryButtonText,
    String? secondaryButtonText,
    required VoidCallback onPrimaryButtonPressed,
    VoidCallback? onSecondaryButtonPressed,
    String? iconPath,
    bool barrierDismissible = true,
  }) async {
    return showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (BuildContext context) {
        return CaseFinalizationPopup(
          title: title,
          message: message,
          primaryButtonText: primaryButtonText,
          secondaryButtonText: secondaryButtonText,
          onPrimaryButtonPressed: onPrimaryButtonPressed,
          onSecondaryButtonPressed: onSecondaryButtonPressed,
          iconPath: iconPath,
          barrierDismissible: barrierDismissible,
        );
      },
    );
  }
}

class _CaseFinalizationPopupState extends State<CaseFinalizationPopup> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.r),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

  Widget contentBox(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: ColorManager.kWhiteColor,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Title with icon if provided
           SizedBox(height: 10.h),
          if (widget.iconPath != null) ...[
                SvgPicture.asset(
                  widget.iconPath!,
                  height: 20.h,
                  width: 20.w,
                  colorFilter: ColorFilter.mode(
                    ColorManager.primary,
                    BlendMode.srcIn,
                  ),
                ),
                SizedBox(height: 5.h),
              ],
              Text(
                widget.title,
                style: getsemiboldStyle(
                  color: ColorManager.primary,
                  fontSize: FontSize.s16.sp,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 8.h),
          
          // Message
          Text(
            widget.message,
            style: getRegularStyle(
              color: ColorManager.kDarkGreyColor,
              fontSize: FontSize.s10.sp,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Primary Button
          SizedBox(
            height: 50.h,
            width: 125.w,
            child: _buildButton(
              text: widget.primaryButtonText,
              onTap: widget.onPrimaryButtonPressed,
              color: ColorManager.kRedColor,
              fontColor: ColorManager.kWhiteColor,
            ),
          ),
          
          // Secondary Button (if provided)
          if (widget.secondaryButtonText != null) ...[
            //SizedBox(height: 12.h),
            Container(
              height: 50.h,
              width: 125.w,
              margin: EdgeInsets.only(left: 12.w),
              child: _buildButton(
                text: widget.secondaryButtonText!,
                onTap: widget.onSecondaryButtonPressed ?? () => Navigator.of(context).pop(),
                color: ColorManager.primary,
                fontColor: ColorManager.kWhiteColor,
                borderColor: ColorManager.kGreyColor,
              ),
            ),
          ],
            ],
          )
          
        ],
      ),
    );
  }

  Widget _buildButton({
    required String text,
    required VoidCallback onTap,
    required Color color,
    required Color fontColor,
    Color? borderColor,
  }) {
    return CustomButton(
      borderRadius: BorderRadius.circular(12.r),
      color: color,
      horizontalMargin: 0.0,
      borderColor: borderColor,
      text: text,
      style: getmediumStyle(
        color: fontColor,
        fontSize: AppSize.s14.sp,
      ),
      onTap: onTap,
    );
  }
}
