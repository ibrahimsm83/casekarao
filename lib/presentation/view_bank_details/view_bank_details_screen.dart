import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../export_casekarao.dart';

class ViewBankDetailsScreen extends StatelessWidget {
  final List<Map<String, String>> bankDetails = [
    {
      'name': 'HBL',
      'accountTitle': 'CaseKarao',
      'accountNumber': '1234567894567845',
      'iban': 'PKABC12314565455212347',
      'logo': ImageAssets.kHBL,
    },
    {
      'name': 'Easypaisa',
      'accountTitle': 'CaseKarao',
      'accountNumber': '1234567894567845',
      'logo': ImageAssets.kEasyPaisaImage,
    },
    {
      'name': 'JazzCash',
      'accountTitle': 'CaseKarao',
      'accountNumber': '1234567894567845',
      'logo': ImageAssets.kJazzCash,
    },
  ];

  ViewBankDetailsScreen({super.key});

  void copyToClipboard(String text, BuildContext context) {
    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('Copied to clipboard')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.kBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
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
        actions: [
          InkWell(
            onTap: () {
              //Notification screen
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Container(
                height: 44.h,
                width: 44.h,
                decoration: BoxDecoration(
                  color: ColorManager.kWhiteColor,
                  borderRadius: BorderRadius.all(Radius.circular(16.r)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: SvgPicture.asset(ImageAssets.kNotificationIcon),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView(
          children: [
            _buildTitleWithSubtextWidget(),
            SizedBox(height: 10),
            ...bankDetails.map((bank) {
              return Container(
                margin: const EdgeInsets.only(bottom: 20),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.r),
                            color: ColorManager.kBackgroundColor,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 40.00,
                              height: 40.00,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: ExactAssetImage(bank['logo']!),
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 12),
                        Text(
                          bank['name']!,
                          style: getboldStyle(
                            color: ColorManager.primary,
                            fontSize: 22,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Container(
                      decoration: BoxDecoration(
                        // color: ColorManager.kBackgroundColor
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          infoRow("Account Title", bank['accountTitle']!,padding: 7),
                          infoRowWithCopy(
                            context,
                            "Account number",
                            bank['accountNumber']!,
                          ),
                          if (bank.containsKey('iban'))
                            infoRowWithCopy(context, "IBAN", bank['iban']!),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }

  Widget infoRow(String title, String value, {double ? padding}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          color: ColorManager.kBackgroundColor,
        ),
        child: Padding(
          padding:EdgeInsets.all(padding ?? 0),
              //const EdgeInsets.symmetric(horizontal:0.0,vertical: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("$title:", style: getRegularStyle(color: Colors.black45)),
              //SizedBox(height: 4),
              Text(
                value,
                style: getsemiboldStyle(
                  color: ColorManager.primary,
                  fontSize: ScreenUtil().setSp(14),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTitleWithSubtextWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 6.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Bank Details",
            style: getsemiboldStyle(
              color: ColorManager.primary,
              fontSize: ScreenUtil().setSp(AppSize.s24),
            ),
          ),
          Text(
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
            style: getsemiboldStyle(
              color: ColorManager.primary,
              fontSize: ScreenUtil().setSp(AppSize.s12),
            ),
          ),
          const SizedBox(height: 5.0),
        ],
      ),
    );
  }

  Widget infoRowWithCopy(BuildContext context, String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          color: ColorManager.kBackgroundColor,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: infoRow(title, value)),
              IconButton(
                icon: Icon(Icons.copy, size: 20),
                onPressed: () => copyToClipboard(value, context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
