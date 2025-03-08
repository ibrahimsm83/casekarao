// Case List Screen (after clicking a status)
import 'package:casekarao/export_casekarao.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CaseListScreen extends StatelessWidget {
  final String status;

  CaseListScreen({super.key, required this.status});

  final List<Map<String, dynamic>> cases = [
    {
      "title": "Hit and Run Case",
      "status": "Pending",
      "date": "Tuesday 18 Feb, 2025",
    },
    {"title": "Murder Case", "status": "Ongoing", "milestone": "1st Milestone"},
    {
      "title": "Murder Case",
      "status": "Canceled",
      "milestone": "1st Milestone",
    },
    {"title": "Murder Case", "status": "Completed", "milestone": "Completed"},
  ];

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> filteredCases =
        cases.where((c) => c["status"] == status).toList();
    print(filteredCases);

    return Scaffold(
      backgroundColor: ColorManager.kBackgroundColor,
      appBar: AppBar(title: Text("$status Cases")),
      body:
          filteredCases.isEmpty
              ? Center(
                child: Text("No cases found", style: TextStyle(fontSize: 18)),
              )
              : ListView.builder(
                padding: EdgeInsets.all(12),
                itemCount: filteredCases.length,
                itemBuilder: (context, index) {
                  return CaseCard(caseData: filteredCases[index]);
                },
              ),
    );
  }
}

// Case Card Widget
class CaseCard extends StatelessWidget {
  final Map<String, dynamic> caseData;

  CaseCard({super.key, required this.caseData});

  @override
  Widget build(BuildContext context) {
    Color statusColor;
    String? paymentStatus;
    String? milestoneExpiry;
    String? timeWithStartEnd;
    String? dateWithDay;

    switch (caseData["status"]) {
      case "Pending":
        statusColor = Colors.orange;
        timeWithStartEnd = "11:30am to 12:30pm";
        dateWithDay = "Tuesday 18 Feb, 2025";
        break;
      case "Ongoing":
        statusColor = Colors.blue;
        paymentStatus = "Paid";
        milestoneExpiry = "7 Days";
        break;
      case "Canceled":
        statusColor = ColorManager.kRedColor;
        paymentStatus = "Canceled";
        milestoneExpiry = "Expired";
        break;
      case "Completed":
        statusColor = ColorManager.kGreenColor;
        paymentStatus = "Paid";
        break;
      default:
        statusColor = Colors.grey;
    }

    return Card(
      color: ColorManager.kWhiteColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: EdgeInsets.only(bottom: 10),
      elevation: 3,
      child: Padding(
        padding: EdgeInsets.only(
          left: caseData["status"] == "Pending" ? 0 : 16,
          right: caseData["status"] == "Pending" ? 0 : 16,
          top: caseData["status"] == "Pending" ? 0 : 8,
          bottom: 8,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration:
                  caseData["status"] == "Pending"
                      ? BoxDecoration(
                        color: ColorManager.kTitleBgColor,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(12),
                          topLeft: Radius.circular(12),
                        ),
                      )
                      : null,
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                      caseData["status"] == "Pending" ? 16 : 0,
                      8,
                      8,
                      caseData["status"] == "Pending" ? 8 : 0,
                    ),
                    child: Text(
                      caseData["title"],
                      style:
                          caseData["status"] == "Pending"
                              ? getsemiboldStyle(
                                color: ColorManager.primary,
                                fontSize: ScreenUtil().setSp(AppSize.s14),
                              )
                              : getmediumStyle(
                                color: ColorManager.primary,
                                fontSize: ScreenUtil().setSp(AppSize.s16),
                              ),
                    ),
                  ),
                  if (caseData.containsKey("milestone"))
                    Padding(
                      padding: const EdgeInsets.only(left: 5, top: 8),
                      child: Text(
                        caseData["milestone"],
                        style: getmediumStyle(
                          color: ColorManager.secondary,
                          fontSize: ScreenUtil().setSp(AppSize.s12),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            SizedBox(height: 5),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: caseData["status"] == "Pending" ? 16 : 0,
              ),
              child: Text(
                "Lorem Ipsum is simply dummy text of the printing industry.",
                style: getRegularStyle(
                  color: ColorManager.primary,
                  fontSize: ScreenUtil().setSp(AppSize.s10),
                ),
              ),
            ),
            if (timeWithStartEnd != null && dateWithDay != null) ...[
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(ImageAssets.clockIcon),
                        SizedBox(width: 5.0),
                        Text(
                          timeWithStartEnd,
                          style: getmediumStyle(
                            color: ColorManager.primary,
                            fontSize: ScreenUtil().setSp(AppSize.s10),
                          ),
                        ),
                      ],
                    ),

                    Row(
                      children: [
                        SvgPicture.asset(ImageAssets.kCalendarIcon),
                        SizedBox(width: 5.0),
                        Text(
                          dateWithDay,
                          style: getmediumStyle(
                            color: ColorManager.primary,
                            fontSize: ScreenUtil().setSp(AppSize.s10),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],

            if (paymentStatus != null && milestoneExpiry != null) ...[
              SizedBox(height: 10),
              Row(
                children: [
                  Flexible(
                    child: Row(
                      children: [
                        Text(
                          "Payment Status: ",
                          style: getmediumStyle(
                            fontSize: ScreenUtil().setSp(AppSize.s10),
                            color: ColorManager.primary,
                          ),
                        ),
                        Text(
                          paymentStatus,
                          style: getmediumStyle(
                            fontSize: ScreenUtil().setSp(AppSize.s10),
                            color:
                                paymentStatus == "Paid"
                                    ? ColorManager.kGreenColor
                                    : ColorManager.kRedColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    child: Row(
                      children: [
                        Text(
                          "Milestone Expiry: ",
                          style: getmediumStyle(
                            fontSize: ScreenUtil().setSp(AppSize.s10),
                            color: ColorManager.primary,
                          ),
                        ),
                        Text(
                          milestoneExpiry,
                          style: getmediumStyle(
                            fontSize: ScreenUtil().setSp(AppSize.s10),
                            color:
                                milestoneExpiry == "7 Days"
                                    ? ColorManager.kGreenColor
                                    : ColorManager.kRedColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
            ],
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: caseData["status"] == "Pending" ? 16 : 0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage(ImageAssets.userImage),
                        radius: 14,
                      ),

                      Padding(
                        padding: const EdgeInsets.only(left: 5.0),
                        child: Text(
                          "Jaylon Herwitz",
                          style: getmediumStyle(
                            color: ColorManager.primary,
                            fontSize: ScreenUtil().setSp(AppSize.s10),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Visibility(
                    visible: caseData["status"] == "Ongoing",
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: ColorManager.secondary,
                          borderRadius: BorderRadius.all(Radius.circular(8.r)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 5.0),
                          child: Row(
                            children: [
                              SvgPicture.asset(ImageAssets.kMessageIcon),
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Text(
                                AppStrings.kMessage,
                                  style: getRegularStyle(
                                    color: ColorManager.kWhiteColor,
                                    fontSize: ScreenUtil().setSp(AppSize.s10),
                                  ),
                                ),
                              ),

                            ],
                          ),
                        ),
                      ),
                    ),
                  ),

                  Container(
                    decoration: BoxDecoration(
                      color: ColorManager.kBackgroundColor,
                      borderRadius: BorderRadius.all(Radius.circular(8.r)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 5.0),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              "View Details",
                              style: getRegularStyle(
                                color: ColorManager.primary,
                              ),
                            ),
                          ),
                          SvgPicture.asset(ImageAssets.kRightArrowIcon),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
