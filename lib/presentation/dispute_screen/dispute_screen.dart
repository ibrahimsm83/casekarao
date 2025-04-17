import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../export_casekarao.dart';

class DisputeScreen extends StatelessWidget {
  DisputeScreen({super.key});

  final List<Dispute> disputes = [
    Dispute('#451234', 'Lorem Ipsum is simply dummy text of', 'Pending'),
    Dispute('#451234', 'Lorem Ipsum is simply dummy text of', 'Rejected'),
    Dispute('#451234', 'Lorem Ipsum is simply dummy text of', 'Pending'),
    Dispute('#451234', 'Lorem Ipsum is simply dummy text of', 'Rejected'),
    Dispute('#451234', 'Lorem Ipsum is simply dummy text of', 'Approved'),
    Dispute('#451234', 'Lorem Ipsum is simply dummy text of', 'Pending'),
    Dispute('#451234', 'Lorem Ipsum is simply dummy text of', 'Approved'),
  ];

  Color _getStatusColor(String status) {
    switch (status) {
      case 'Approved':
        return ColorManager.kGreenColor;
      case 'Rejected':
        return ColorManager.kRedColor;
      case 'Pending':
        return ColorManager.secondary;
      default:
        return Colors.black;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.kBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          AppStrings.kDispute,
          style: getsemiboldStyle(
            color: ColorManager.primary,
            fontSize: ScreenUtil().setSp(FontSize.s16),
          ),
        ),
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
      ),
      body: ListView.builder(
        itemCount: disputes.length,
        itemBuilder: (context, index) {
          final dispute = disputes[index];
          return Container(
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14.r),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Dispute ID ${dispute.id}',
                      style: getRegularStyle(
                        color: ColorManager.kGreyColor,
                        fontSize: ScreenUtil().setSp(FontSize.s8.sp),
                      ),
                    ),
                    Text(
                      dispute.status,
                      style: getmediumStyle(
                        color: _getStatusColor(dispute.status),
                        fontSize: ScreenUtil().setSp(FontSize.s10.sp),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 6),
                Text(
                  dispute.description,
                  style: getmediumStyle(
                    color: ColorManager.primary,
                    fontSize: ScreenUtil().setSp(FontSize.s10.sp),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
