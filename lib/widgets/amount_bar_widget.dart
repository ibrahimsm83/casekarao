import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../export_casekarao.dart';

class AmountBarWidget extends StatelessWidget {
  final num amount;
  final Color? backGroundColor;
  final double? fontSize;

  const AmountBarWidget({
    super.key,
    required this.amount,
    this.fontSize,
    this.backGroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSize.s8.r),
        color: backGroundColor ?? ColorManager.kWhiteColor,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0,horizontal: 6.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              AppStrings.kAmount,
              style: getboldStyle(
                color: ColorManager.primary,
                fontSize: ScreenUtil().setSp(fontSize??FontSize.s16),
              ),
            ),
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: ColorManager.kGreenColor,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(4.4),
                    child: Text(
                      '\$',
                      style: getsemiboldStyle(
                        color: ColorManager.kWhiteColor,
                        fontSize: ScreenUtil().setSp(AppSize.s10),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 5.0),
                Text(
                  '$amount PKR',
                  style: getmediumStyle(
                    color: ColorManager.kDarkGreyColor,
                    fontSize: ScreenUtil().setSp(AppSize.s10),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
