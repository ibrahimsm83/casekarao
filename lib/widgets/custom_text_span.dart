import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../export_casekarao.dart';

class CustomTextSpan extends StatelessWidget {
  String? text1;
  String? text2;
  Function()? onTap;

  CustomTextSpan({super.key, this.text1, this.text2, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppPadding.p14,
        vertical: AppPadding.p10,
      ),
      alignment: Alignment.center,
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          text: text1,
          style: getRegularStyle(
            color: ColorManager.kDarkGreyColor,
            fontSize: ScreenUtil().setSp(AppSize.s12),
          ),
          children: <TextSpan>[
            TextSpan(
              text: text2,
              style: TextStyle(
                color: ColorManager.secondary,
                fontFamily: FontConstants.fontFamily,
                fontWeight: FontWeightManager.bold,
                fontSize: ScreenUtil().setSp(AppSize.s12),
              ),
              recognizer: TapGestureRecognizer()..onTap = onTap,
            ),
          ],
        ),
      ),
    );
  }
}
