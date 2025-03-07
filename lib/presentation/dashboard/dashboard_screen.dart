// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../export_casekarao.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  late PageController _pagecontroller;
  var _currentIndex = 0;

  @override
  void initState() {
    _pagecontroller = PageController(initialPage: _currentIndex);
    super.initState();
  }

  // final UserController userController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.kBackgroundColor,
      extendBody: true,
      body: SafeArea(
        child: PageView(
          scrollDirection: Axis.horizontal,
          controller: _pagecontroller,
          onPageChanged: (val) {
            setState(() {
              _currentIndex = val;
            });
          },
          children: <Widget>[
            Container(child: Center(child: Text("Home"))),
            Container(child: Center(child: Text("Appointment"))),
            Container(child: Center(child: Text("Earnings"))),
            Container(child: Center(child: Text("Settings"))),
            // userController.userRole.value==UserRole.Patient?HomeView():HomeHealthView(),
            // AppointmentView(),
            // ChatView(),
            // ArticlesView(),
            // userController.userRole.value==UserRole.Patient?ProfileView():ProfileProfessionalHealthCareView(),
          ],
        ),
      ),

      bottomNavigationBar:
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(AppSize.s14.r)), // Fully rounded corners
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: _currentIndex,
              backgroundColor: ColorManager.kWhiteColor,
              selectedItemColor: ColorManager.secondary,
              showUnselectedLabels: true,
              selectedFontSize: 0.0,
              onTap: (value) {
                setState(() => _currentIndex = value);
                _pagecontroller.jumpToPage(value);
              },
              items: [
                bottomNavbaritem(
                  title: AppStrings.kHome,
                  IconName: ImageAssets.kHomeIcon,
                  currentindex: 0,
                ),
                bottomNavbaritem(
                  title: AppStrings.kAppointments,
                  IconName: ImageAssets.kAppointmentIcon,
                  currentindex: 1,
                ),
                bottomNavbaritem(
                  title: AppStrings.kEarnings,
                  IconName: ImageAssets.kEarningIcon,
                  currentindex: 2,
                ),
                bottomNavbaritem(
                  title: AppStrings.kSettings,
                  IconName: ImageAssets.kSettingsIcon,
                  currentindex: 3,
                ),
              ],
            ),
      ),
      ),
    );
  }

  BottomNavigationBarItem bottomNavbaritem({
    String? title,
    String? IconName,
    int? currentindex,
  }) {
    return BottomNavigationBarItem(
      label: "",
      icon: Padding(
        padding: const EdgeInsets.only(top: 10.0, bottom: 5.0),
        child: Column(
          children: [
            SvgPicture.asset(
              IconName!,
              color:
                  currentindex == _currentIndex
                      ? ColorManager.secondary
                      : ColorManager.kGreyColor,
            ),
            SizedBox(height: 5.0),
            Text(
              title ?? "",
              style: TextStyle(
                fontSize: 10.sp,
                color:
                    currentindex == _currentIndex
                        ? ColorManager.secondary
                        : ColorManager.kGreyColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
