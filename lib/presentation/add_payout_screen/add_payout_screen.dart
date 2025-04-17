import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../export_casekarao.dart';

class AddPayoutScreen extends StatefulWidget {
  AddPayoutScreen({Key? key}) : super(key: key);

  @override
  State<AddPayoutScreen> createState() => _AddPayoutScreenState();
}

class _AddPayoutScreenState extends State<AddPayoutScreen> {
  final _formKey = GlobalKey<FormState>();

  bool rememberMe = false;

  FocusNode node1 = FocusNode();

  FocusNode node2 = FocusNode();

  FocusNode node3 = FocusNode();

  final _accountTitleController = TextEditingController();

  final _accountNumberController = TextEditingController();

  final _routingNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.kBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          AppStrings.kAddPayout,
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
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppSize.sizeWidth(context!) * 0.05,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: AppSize.s20.h,
                    bottom: AppSize.s6.h,
                  ),
                  child: Text(
                    AppStrings.kAccountTitle,
                    style: getmediumStyle(
                      color: ColorManager.kDarkGreyColor,
                      fontSize: ScreenUtil().setSp(AppSize.s12),
                    ),
                  ),
                ),
                CustomTextFormField(
                  hintText: AppStrings.kAccountTitleHintText,
                  controller: _accountTitleController,
                  fillColor: ColorManager.kWhiteColor,
                  focusNode: node1,
                  horizontalMergin: 0.0,
                  validator: (String? val) {
                    if (val == null || val.isEmpty) {
                      return "Enter Account Title";
                    }
                    return null;
                  },
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: AppSize.s20.h,
                    bottom: AppSize.s6.h,
                  ),
                  child: Text(
                    AppStrings.kAccountNumber,
                    style: getmediumStyle(
                      color: ColorManager.kDarkGreyColor,
                      fontSize: ScreenUtil().setSp(AppSize.s12),
                    ),
                  ),
                ),
                CustomTextFormField(
                  hintText: "4512 4521 7589 6784",
                  controller: _accountNumberController,
                  fillColor: ColorManager.kWhiteColor,
                  focusNode: node2,
                  horizontalMergin: 0.0,
                  validator: (String? val) {
                    if (val == null || val.isEmpty) {
                      return "Enter Account number";
                    }
                    return null;
                  },
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: AppSize.s20.h,
                    bottom: AppSize.s6.h,
                  ),
                  child: Text(
                    AppStrings.kRoutingNumber,
                    style: getmediumStyle(
                      color: ColorManager.kDarkGreyColor,
                      fontSize: ScreenUtil().setSp(AppSize.s12),
                    ),
                  ),
                ),
                CustomTextFormField(
                  hintText: "4512 4521 7589 6784",
                  controller: _routingNumberController,
                  fillColor: ColorManager.kWhiteColor,
                  focusNode: node3,
                  horizontalMergin: 0.0,
                  validator: (String? val) {
                    if (val == null || val.isEmpty) {
                      return "Enter Routing Number";
                    }
                    return null;
                  },
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10, bottom: 20.0, top: 20),
                  child: Text(
                    AppStrings.kFetchedDetails,
                    style: getsemiboldStyle(
                      color: ColorManager.primary,
                      fontSize: ScreenUtil().setSp(AppSize.s24),
                    ),
                  ),
                ),

                BankInfoCard(
                  logoAsset: ImageAssets.bankImage,
                  bankName: 'CititBank',
                  holderName: 'David Watson',
                  accountNumber: '123456789456784',
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: _buildMakeItDefault(),
                ),
                SizedBox(height: 40.0.h,),
                button(
                  text: AppStrings.kAddPayout,
                  onTap: () {
                    if (!_formKey.currentState!.validate()) {
                      // Navigator.pushNamed(
                      //   context,
                      //   CustomRouteNames.kAddPayoutScreenRoute,
                      // );
                    }
                  }
                ),
                SizedBox(height: 20.0,),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget button({
    Function()? onTap,
    String? text,
    Color? color,
    Color? fontColor,
    String? iconPath,
  }) {
    return CustomButton(
      color: color ?? ColorManager.primary,
      horizontalMargin: 0.0,
      iconPath: iconPath,
      isLeadingIcon: true,
      text: text ?? "",

      style: getmediumStyle(
        color: fontColor ?? ColorManager.kWhiteColor,
        fontSize: AppSize.s14.sp,
      ),
      onTap: onTap,
    );
  }

  Widget _buildMakeItDefault() => Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      SizedBox(
        height: 40.0,
        width: 40.0,
        child: Checkbox(
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          value: rememberMe,
          activeColor: ColorManager.primary,
          checkColor: ColorManager.kWhiteColor,
          onChanged: (value) => setState(() => rememberMe = value!),
        ),
      ),

      Text(
        AppStrings.kMakeItDefaultPayoutDetails,
        style: getRegularStyle(
          color: ColorManager.primary,
          fontSize: ScreenUtil().setSp(AppSize.s14),
        ),
      ),
    ],
  );
}

class BankInfoCard extends StatelessWidget {
  final String logoAsset;
  final String bankName;
  final String holderName;
  final String accountNumber;

  const BankInfoCard({
    super.key,
    required this.logoAsset,
    required this.bankName,
    required this.holderName,
    required this.accountNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      //margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFFDFEFB), // Slight off-white
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Bank Logo
          Image.asset(logoAsset, height: 36),

          // Divider
          Container(
            height: 56,
            width: 1,
            color: Colors.grey.withOpacity(0.2),
            margin: const EdgeInsets.symmetric(horizontal: 16),
          ),

          // Bank Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  bankName,
                  style: getsemiboldStyle(
                    color: ColorManager.secondary,
                    fontSize: ScreenUtil().setSp(AppSize.s12),
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  holderName,
                  style: getboldStyle(
                    color: ColorManager.primary,
                    fontSize: ScreenUtil().setSp(AppSize.s16),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  accountNumber,
                  style: getmediumStyle(
                    color: ColorManager.kGreyColor,
                    fontSize: ScreenUtil().setSp(AppSize.s12),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
