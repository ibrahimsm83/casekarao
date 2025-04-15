import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../export_casekarao.dart';

class AmountBarWidget extends StatelessWidget {
  final num amount;
  final Color? backGroundColor;

  const AmountBarWidget({
    super.key,
    required this.amount,
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
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              AppStrings.kAmount,
              style: getboldStyle(
                color: ColorManager.primary,
                fontSize: ScreenUtil().setSp(AppSize.s16),
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
                    padding: const EdgeInsets.all(4.0),
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
                    fontSize: ScreenUtil().setSp(AppSize.s12),
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
