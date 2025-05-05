import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../export_casekarao.dart';

class ConsultationStatusCard extends StatelessWidget {
  final PendingStatusItemModel status;
  final Function()? onTap;

  const ConsultationStatusCard({super.key, required this.status, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppSize.sizeWidth(context) * 0.8,
      child: Card(
        color: ColorManager.kWhiteColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        margin: const EdgeInsets.only(bottom: 10),
        elevation: 3,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Column(
            children: [
              Container(
                width: AppSize.sizeWidth(context),
                decoration: BoxDecoration(
                  color: ColorManager.kTitleBgColor,
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(12),
                    topLeft: Radius.circular(12),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        status.title,
                        style: getsemiboldStyle(
                          color: ColorManager.primary,
                          fontSize: ScreenUtil().setSp(AppSize.s14),
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            height: 5,
                            width: 5,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: ColorManager.kOrangeColor,
                            ),),
                            const SizedBox(width: 5.0),
                          Text(
                            "pending",//status.title,
                            style: getRegularStyle(
                               color: ColorManager.kOrangeColor,
                          // status == "Pending"
                          //     ? ColorManager.kOrangeColor
                          //     : ColorManager.kGreenColor,
                              fontSize: ScreenUtil().setSp(AppSize.s10),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  status.subtitle,
                  //"Lorem Ipsum is simply dummy text of the printing industry.",
                  style: getRegularStyle(
                    color: ColorManager.primary,
                    fontSize: ScreenUtil().setSp(AppSize.s10),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 10.0,
                ),
                child: AmountBarWidget(
                  amount: 500.00,
                  backGroundColor: ColorManager.kTitleBgColor,
                  fontSize: FontSize.s12,
                ),
              ),

              ///image
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage(status.userImage),
                          radius: 14,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 5.0),
                          child: Text(
                            status.userName,
                            style: getmediumStyle(
                              color: ColorManager.primary,
                              fontSize: ScreenUtil().setSp(AppSize.s10),
                            ),
                          ),
                        ),
                      ],
                    ),
                    InkWell(
                    onTap: onTap,
                    child: Container(
                      
                      decoration: BoxDecoration(
                        color: ColorManager.kGreyBackViewColor,
                        borderRadius: BorderRadius.all(Radius.circular(8.r)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8.0,
                          vertical: 5.0,
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text(
                                "View Details",
                                style: getRegularStyle(color: ColorManager.primary),
                              ),
                            ),
                            SvgPicture.asset(ImageAssets.kRightArrowIcon),
                          ],
                        ),
                      ),
                    ),
                  ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
