import 'package:casekarao/widgets/consultations_status_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../export_casekarao.dart';

class ConsultationsScreen extends StatefulWidget {

  const ConsultationsScreen({super.key});

  @override
  State<ConsultationsScreen> createState() => _ConsultationsScreenState();
}

class _ConsultationsScreenState extends State<ConsultationsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.kBackgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        //leading: SizedBox.shrink(),
        title: Text(
          AppStrings.kNewConsultation,
          style: getsemiboldStyle(
            color: ColorManager.primary,
            fontSize: ScreenUtil().setSp(FontSize.s18),
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
        padding: const EdgeInsets.only(top:8.0),
        child: ListView.separated(
          separatorBuilder: (context, i) => const SizedBox(height: 5.0),
          itemCount: DataList.onGoingList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: ConsultationStatusCard(
                status: DataList.pendingList[index],
                onTap: () {
                    Navigator.pushNamed(
                    context,
                    CustomRouteNames
                              .kConsultationRequestsDetailsScreenRoute,
                              arguments: DataList.pendingList[index],
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
