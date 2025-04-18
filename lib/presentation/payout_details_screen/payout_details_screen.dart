import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../export_casekarao.dart';

class PayoutDetailsScreen extends StatefulWidget {
  const PayoutDetailsScreen({Key? key}) : super(key: key);

  @override
  State<PayoutDetailsScreen> createState() => _PayoutDetailsScreenState();
}

class _PayoutDetailsScreenState extends State<PayoutDetailsScreen> {
  List<BankCardModel> bankCardsList = [
    BankCardModel(
      bankName: "CititBank",
      holderName: "David Watson",
      accountNumber: "123456789456784",
      isSelected: true,
    ),
    BankCardModel(
      bankName: "CititBank",
      holderName: "David Watson",
      accountNumber: "123456789456784",
      isSelected: false,
    ),
  ];

  void selectCard(int index) {
    setState(() {
      for (int i = 0; i < bankCardsList.length; i++) {
        bankCardsList[i].isSelected = i == index;
      }
    });
  }

  void deleteCard(int index) {
    setState(() {
      bankCardsList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.kBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          AppStrings.kPayoutDetails,
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
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: AppSize.sizeWidth(context)*0.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: bankCardsList.length,
                // padding: const EdgeInsets.all(10),
                itemBuilder: (context, index) {
                  return BankCard(
                    card: bankCardsList[index],
                    onSelect: () => selectCard(index),
                    onDelete: () => deleteCard(index),
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10,bottom: 5.0),
              child: Text(
                AppStrings.kRecentPayoutDetails,
                style: getsemiboldStyle(
                  color: ColorManager.primary,
                  fontSize: ScreenUtil().setSp(AppSize.s16),
                ),
              ),
            ),

            Flexible(
              child: ListView.separated(
                shrinkWrap: true,
                separatorBuilder: (context, i) => SizedBox(height: 10.0),
                itemCount: DataList.payoutDetailsList.length,
                itemBuilder: (context, index) {
                  return userList(
                    DataList.payoutDetailsList[index],
                    // onTap: () {
                    //   print("tapped $index");
                    // },
                  );
                  //CaseCard(caseData: filteredCases[index]);
                },
              ),
            ),
            button(text: AppStrings.kAddPayout, onTap: () {
              Navigator.pushNamed(context, CustomRouteNames.kAddPayoutScreenRoute);
            }),
          ],
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

  Widget userList(RecentActivityModel data) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14.r)),
      tileColor: ColorManager.kWhiteColor,
      leading: Padding(
        padding: const EdgeInsets.only(left: 5.0),
        child: CircleAvatar(
          radius: 20, // Size of the avatar
          backgroundImage: AssetImage(data.userImage), // Local image
        ),
      ),
      title: Text(
        data.title,
        style: getmediumStyle(
          color: ColorManager.primary,
          fontSize: ScreenUtil().setSp(AppSize.s10),
        ),
      ),
      subtitle: Row(
        children: [
          Text(
            data.subtitle,
            style: getmediumStyle(
              color: ColorManager.primary,
              fontSize: ScreenUtil().setSp(AppSize.s14),
            ),
          ),
          SizedBox(width: 3.0),
          Text(
            data.milestone,
            style: getRegularStyle(
              color: ColorManager.secondary,
              fontSize: ScreenUtil().setSp(AppSize.s10),
            ),
          ),
        ],
      ),
      trailing: Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "PKR${data.receivedAmount}",
              style: getsemiboldStyle(
                color: ColorManager.primary,
                fontSize: ScreenUtil().setSp(AppSize.s14),
              ),
            ),
            SizedBox(width: 10.0),
            Text(
              data.amountStatus,
              style: getRegularStyle(
                color: ColorManager.kDarkGreyColor,
                fontSize: ScreenUtil().setSp(AppSize.s10),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BankCard extends StatelessWidget {
  final BankCardModel card;
  final VoidCallback onDelete;
  final VoidCallback onSelect;

  const BankCard({
    Key? key,
    required this.card,
    required this.onDelete,
    required this.onSelect,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isSelected = card.isSelected;

    return GestureDetector(
      onTap: onSelect,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            if (isSelected)
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: Offset(0, 4),
              ),
          ],
        ),
        child: Row(
          children: [
            // Selection Circle
            Icon(
              isSelected
                  ? Icons.radio_button_checked
                  : Icons.radio_button_unchecked,
              color: isSelected ? Colors.blue : Colors.grey,
              size: 28,
            ),
            const SizedBox(width: 16),

            // Bank logo and name
            Image.asset(
              ImageAssets.bankImage, // Place your citibank logo asset here
              height: 32,
            ),
            const SizedBox(width: 8),

            // Divider
            Container(
              height: 48,
              width: 1,
              color: Colors.grey.withOpacity(0.3),
              margin: const EdgeInsets.symmetric(horizontal: 12),
            ),

            // Account info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    card.bankName,
                    style: TextStyle(
                      color: isSelected ? ColorManager.secondary: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    card.holderName,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: isSelected ? Colors.black : Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    card.accountNumber,
                    style: TextStyle(
                      color: isSelected ? Colors.black : Colors.grey,
                    ),
                  ),
                ],
              ),
            ),

            // Delete Icon
            GestureDetector(
              onTap: onDelete,
              child: Icon(Icons.delete, color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}
