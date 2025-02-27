import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../presentation/resources/export_resources.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  String? text;
  FontWeight? fontWeight;
  final Color? color;
  Function()? onTap;
  TextStyle? style;
  bool isLeadingIcon;
  String? iconPath;

  CustomButton({
    Key? key,
    this.onTap,
    this.text,
    this.style,
    this.fontWeight = FontWeight.normal,
    this.isLeadingIcon = false,
    this.iconPath,
    this.color = Colors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppSize.sizeWidth(context!) * 0.05,
          vertical: 8.0,
        ),
        child: Container(
          height: 48.h,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(22.r),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Visibility(
                visible: isLeadingIcon,
                child: Padding(
                  padding: EdgeInsets.only(right: 12.w),
                  child:
                      iconPath != null && iconPath!.isNotEmpty
                          ? SvgPicture.asset(iconPath!)
                          : SizedBox(),
                ),
              ),
              Text(
                text!,
                style: style,
                // TextStyle(color: AppColors.whiteColor, fontWeight: fontWeight),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
