import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../export_casekarao.dart';

class CreateMilestonesScreen extends StatefulWidget {
  const CreateMilestonesScreen({super.key});

  @override
  State<CreateMilestonesScreen> createState() => _CreateMilestonesScreenState();
}

class _CreateMilestonesScreenState extends State<CreateMilestonesScreen> {
  final _nameMileStoneController = TextEditingController();
  final _amountController = TextEditingController();
  final _enterDetailsDesController = TextEditingController();
  String? selectedType;
  List<Widget> mileStoneList = [];
  int count = 1;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        mileStoneList.add(mileStoneCard(count));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.kBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: InkWell(
          onTap: () => Navigator.of(context).pop(),
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
      bottomSheet: button(
        text: AppStrings.submit,
        margin: 0.05,
        onTap: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (_) => const DashboardScreen(initialIndex: 1),
            ),
          );
        },
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppSize.sizeWidth(context!) * 0.04,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: AppSize.sizeHeight(context) * 0.01),
              Padding(
                padding: const EdgeInsets.only(left: 6.0),
                child: Text(
                  AppStrings.kCreateMilestones,
                  style: getsemiboldStyle(
                    color: ColorManager.primary,
                    fontSize: ScreenUtil().setSp(AppSize.s24),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 6.0, top: 3.0),
                child: Text(
                  AppStrings.kUseMilestoneIsDeliver,
                  style: getmediumStyle(
                    color: ColorManager.kDarkGreyColor,
                    fontSize: ScreenUtil().setSp(AppSize.s12),
                  ),
                ),
              ),
              SizedBox(height: AppSize.s12.h),

              ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                separatorBuilder: (context, i) => SizedBox(height: 10.0),
                itemCount: mileStoneList.length,
                itemBuilder: (context, i) {
                  return mileStoneList[i];
                },
              ),

              SizedBox(height: AppSize.sizeHeight(context) * 0.01),
              button(
                text: AppStrings.kAddaMilestone,
                margin: 0.03,
                onTap: () {
                  setState(() {
                    count++;
                  });
                  mileStoneList.add(mileStoneCard(count));
                },
              ),
              SizedBox(height: AppSize.sizeHeight(context) * 0.12),
            ],
          ),
        ),
      ),
    );
  }

  Widget mileStoneCard(int mileStone) {
    return Container(
      width: AppSize.sizeWidth(context),
      decoration: BoxDecoration(
        color: ColorManager.kWhiteColor,
        borderRadius: BorderRadius.all(Radius.circular(14.r)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "$mileStone${getOrdinalSuffix(mileStone)} Milestone",
              style: getmediumStyle(
                color: ColorManager.primary,
                fontSize: ScreenUtil().setSp(AppSize.s14),
              ),
            ),
            SizedBox(height: AppSize.s8.h),
            CustomTextFormField(
              hintText: AppStrings.kNameTheMilestone,
              controller: _nameMileStoneController,
              fillColor: ColorManager.kInputTexBgColor,
              // focusNode: node1,
              horizontalMergin: 0.0,
              validator: (String? val) {
                if (val == null || val.isEmpty) {
                  return "Enter Mile stone name";
                }
                return null;
              },
            ),
            SizedBox(height: AppSize.s8.h),
            // Row(
            //   children: [
            //     Flexible(child: jurisdiction()),
            //     SizedBox(width: AppSize.s8.h),
            //     Flexible(
            //       child: CustomTextFormField(
            //         hintText: AppStrings.kAmount + '\t' + AppStrings.kPKR,
            //         controller: _amountController,
            //         fillColor: ColorManager.kInputTexBgColor,
            //         // focusNode: node1,
            //         horizontalMergin: 0.0,
            //         validator: (String? val) {
            //           if (val == null || val.isEmpty) {
            //             return "Enter Amount";
            //           }
            //           return null;
            //         },
            //       ),
            //     ),
            //   ],
            // ),
            // SizedBox(height: AppSize.s8.h),
            CustomTextFormField(
              hintText: AppStrings.kEnterDetailDescription,
              controller: _enterDetailsDesController,
              fillColor: ColorManager.kInputTexBgColor,
              maxLines: 6,
              // focusNode: node1,
              horizontalMergin: 0.0,
              validator: (String? val) {
                if (val == null || val.isEmpty) {
                  return "Enter Bio";
                }
                return null;
              },
            ),

            SizedBox(height: AppSize.s8.h),
            Text(
              AppStrings.kPaymentForDeliveredMilestones,
              style: getRegularStyle(
                color: ColorManager.primary,
                fontSize: ScreenUtil().setSp(AppSize.s10),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String getOrdinalSuffix(int number) {
    if (number >= 11 && number <= 13) return 'th'; // Handle 11th, 12th, 13th
    switch (number % 10) {
      case 1:
        return 'st';
      case 2:
        return 'nd';
      case 3:
        return 'rd';
      default:
        return 'th';
    }
  }

  Widget button({
    Function()? onTap,
    String? text,
    Color? color,
    Color? fontColor,
    String? iconPath,
    double? margin,
  }) {
    return CustomButton(
      color: color ?? ColorManager.primary,
      horizontalMargin: margin ?? 0.00,
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

  Widget jurisdiction() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0.0),
      child: SizedBox(
        height: 45,
        child: DropdownButtonFormField<String>(
          value: selectedType,
          style: getRegularStyle(color: ColorManager.primary),
          dropdownColor: ColorManager.kWhiteColor,
          icon: Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: SvgPicture.asset(ImageAssets.arrowDownIcon),
          ),
          decoration: InputDecoration(
            filled: true,
            fillColor: ColorManager.kInputTexBgColor,
            contentPadding: EdgeInsets.only(left: 10.0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(color: ColorManager.kInputTexBgColor),
            ),
            labelText: "Duration",
            labelStyle: getRegularStyle(color: ColorManager.kHintTextColor),
          ),
          onChanged: (String? newValue) {
            setState(() {
              selectedType = newValue;
            });
          },
          items:
              ["1 month", "2 month", "3 month"].map((String lang) {
                return DropdownMenuItem<String>(value: lang, child: Text(lang));
              }).toList(),
        ),
      ),
    );
  }
}
