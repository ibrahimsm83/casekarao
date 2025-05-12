import 'package:casekarao/export_casekarao.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ActivateMilestoneSheet extends StatelessWidget {
  ActivateMilestoneSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 20,
        left: 16,
        right: 16,
        bottom: MediaQuery.of(context).viewInsets.bottom + 20,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Activate Milestone",
            style: getmediumStyle(
              color: ColorManager.kWhiteColor,
              fontSize: ScreenUtil().setSp(AppSize.s12),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            "To activate milestone you need to upload the screenshot of the below transferred amount to this account number: 12345678978977",
            style: getRegularStyle(
              color: ColorManager.kHintTextColor,
              fontSize: ScreenUtil().setSp(AppSize.s10),
            ),
            // textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),

          // Upload Screenshot Box
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: Color(0xFF222222),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 68.w,
                  height: 68.h,
                  decoration: BoxDecoration(
                    color: ColorManager.kWhiteColor,
                    borderRadius: BorderRadius.circular(8.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Stack(
                    children: [
                      Center(
                        child: Image.asset(
                                  ImageAssets.userImage,
                                  // fit: BoxFit.fitHeight,
                                  width: 60.w,
                                  height: 60.h,

                                ),
                      ),
                      Positioned(
                        top: 4.h,
                        right: 4.w,
                        child: InkWell(
                          onTap: () {
                          },
                          child: Container(
                            width: 20.w,
                            height: 20.h,
                            decoration: BoxDecoration(
                              color: ColorManager.kWhiteColor,
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: ColorManager.kGreyColor.withOpacity(0.3),
                                width: 1,
                              ),
                            ),
                            child: Center(
                              child: Icon(
                                Icons.close,
                                size: 14.sp,
                                color: ColorManager.kDarkGreyColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                ElevatedButton(
                  onPressed: () {
                    // Upload logic
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorManager.kWhiteColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child:  Text("Upload Screenshot",style: getsemiboldStyle(color: ColorManager.primary),),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // Bottom Buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: button(
                  borderColor: ColorManager.kWhiteColor,
                  text: "View Bank Details",
                  //color: ColorManager.primary,
                  fontColor: ColorManager.kWhiteColor,
                  onTap: () {
                    // Show case finalization popup
                    // openPopp(context);
                  },
                ),
              ),
              SizedBox(width: 20.0),
              Flexible(
                child: button(
                  text: "Activate Milestone",
                  color: Colors.white,
                  fontColor: ColorManager.primary,
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      CustomRouteNames.kPendingCaseDetailsUserScreenRoute,
                      arguments: "active",
                    );
                    // Navigator.pushNamed(context,
                    //     CustomRouteNames.kAddDisputeScreenRoute);
                  },
                ),
              ),
            ],
          ),
          // Row(
          //   children: [
          //     Expanded(
          //       child: OutlinedButton(
          //         onPressed: () {
          //           // View bank details logic
          //         },
          //         style: OutlinedButton.styleFrom(
          //           padding: const EdgeInsets.symmetric(vertical: 14),
          //           side: const BorderSide(color: Colors.black, width: 1.2),
          //           shape: RoundedRectangleBorder(
          //             borderRadius: BorderRadius.circular(12),
          //           ),
          //         ),
          //         child: const Text(
          //           "View Bank Details",
          //           style: TextStyle(color: Colors.black),
          //         ),
          //       ),
          //     ),
          //     const SizedBox(width: 12),
          //     Expanded(
          //       child: ElevatedButton(
          //         onPressed: () {
          //           // Activate milestone logic
          //         },
          //         style: ElevatedButton.styleFrom(
          //           backgroundColor: Colors.black,
          //           padding: const EdgeInsets.symmetric(vertical: 14),
          //           shape: RoundedRectangleBorder(
          //             borderRadius: BorderRadius.circular(12),
          //           ),
          //         ),
          //         child: const Text("Activate Milestone"),
          //       ),
          //     ),
          //   ],
          // ),
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
    Color? borderColor,
    BorderRadius? borderRadius,
  }) {
    return CustomButton(
      borderRadius: borderRadius ?? BorderRadius.circular(12.r),
      color: color ?? ColorManager.primary,
      horizontalMargin: 0.0,
      iconPath: iconPath,
      isLeadingIcon: false,
      borderColor: borderColor ?? ColorManager.kGreyColor,
      text: text ?? "",
      style: getmediumStyle(
        color: fontColor ?? ColorManager.kWhiteColor,
        fontSize: AppSize.s12.sp,
      ),
      onTap: onTap,
    );
  }

}
