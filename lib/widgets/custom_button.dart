import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../presentation/resources/export_resources.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  String? text;
  FontWeight? fontWeight;
  final Color? color;
  final Color? borderColor;
  Function()? onTap;
  TextStyle? style;
  bool isLeadingIcon;
  double horizontalMargin;
  String? iconPath;
  String? rightIconPath;
  BorderRadius? borderRadius;
  Widget? counter;

  CustomButton({
    super.key,
    this.onTap,
    this.text,
    this.style,
    this.borderColor,
    this.fontWeight = FontWeight.normal,
    this.isLeadingIcon = false,
    this.iconPath,
    this.horizontalMargin = 0.05,
    this.color = Colors.black,
    this.borderRadius,
    this.counter,
    this.rightIconPath,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppSize.sizeWidth(context) *
              horizontalMargin, //AppSize.sizeWidth(context!) * 0.05,
          vertical: 8.0,
        ),
        child: Container(
          height: 44.h,
          decoration: BoxDecoration(
              color: color,
              borderRadius: borderRadius ?? BorderRadius.circular(22.r),
              border: Border.all(color: borderColor ?? Colors.transparent)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Visibility(
                visible: isLeadingIcon,
                child: Padding(
                  padding: EdgeInsets.only(right: 6.w),
                  child: iconPath != null && iconPath!.isNotEmpty
                      ? SvgPicture.asset(iconPath!)
                      : SizedBox(),
                ),
              ),
              Text(
                text!,
                style: style,
                // TextStyle(color: AppColors.whiteColor, fontWeight: fontWeight),
              ),
              Visibility(
                visible: counter != null,
                child: Padding(
                  padding: EdgeInsets.only(left: 6.w),
                  child: counter ?? const SizedBox(),
                ),
              ),
               Visibility(
                visible: rightIconPath != null && rightIconPath!.isNotEmpty,
                child: Padding(
                  padding: EdgeInsets.only(left: 6.w),
                  child: rightIconPath != null && rightIconPath!.isNotEmpty
                      ? SvgPicture.asset(rightIconPath!)
                      : SizedBox(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
