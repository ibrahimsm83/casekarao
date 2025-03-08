// Case List Screen (after clicking a status)
import 'package:casekarao/export_casekarao.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
                padding: EdgeInsets.all(16),
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

    switch (caseData["status"]) {
      case "Pending":
        statusColor = Colors.orange;
        break;
      case "Ongoing":
        statusColor = Colors.blue;
        paymentStatus = "Paid";
        milestoneExpiry = "7 Days";
        break;
      case "Canceled":
        statusColor = Colors.red;
        paymentStatus = "Canceled";
        milestoneExpiry = "Expired";
        break;
      case "Completed":
        statusColor = Colors.green;
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
        padding: EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: caseData["status"]=="Pending"?
              BoxDecoration(
                color: ColorManager.kTitleBgColor,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(12),
                  topLeft: Radius.circular(12),
                ),
              ):null,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      caseData["title"],
                      style:caseData["status"]=="Pending"? getsemiboldStyle(
                        color: ColorManager.primary,
                        fontSize: ScreenUtil().setSp(AppSize.s14),
                      ):getmediumStyle(
                        color: ColorManager.primary,
                        fontSize: ScreenUtil().setSp(AppSize.s16),
                      ),
                    ),
                  ),
                  if (caseData.containsKey("milestone"))
                    Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Text(
                        caseData["milestone"],
                        style:getmediumStyle(
                          color: ColorManager.secondary,
                          fontSize: ScreenUtil().setSp(AppSize.s12),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            SizedBox(height: 5),
            Text("Lorem Ipsum is simply dummy text of the printing industry."),
            if (paymentStatus != null && milestoneExpiry != null) ...[
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Payment Status: $paymentStatus",
                    style: TextStyle(
                      color:
                          paymentStatus == "Paid" ? Colors.green : Colors.red,
                    ),
                  ),
                  Text(
                    "Milestone Expiry: $milestoneExpiry",
                    style: TextStyle(
                      color:
                          milestoneExpiry == "7 Days"
                              ? Colors.green
                              : Colors.red,
                    ),
                  ),
                ],
              ),
            ],
            SizedBox(height: 10),
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage("assets/user.jpg"),
                  radius: 20,
                ),
                SizedBox(width: 10),
                Text(
                  "Jaylon Herwitz",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Spacer(),
                OutlinedButton(
                  onPressed: () {},
                  child: Row(
                    children: [
                      Text("View Details"),
                      Icon(Icons.arrow_right_alt),
                    ],
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
