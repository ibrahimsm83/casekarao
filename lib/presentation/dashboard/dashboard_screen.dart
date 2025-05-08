// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../export_casekarao.dart';
import 'consultations_screen.dart';
import 'home_user_screen.dart';
import 'my_case_user-screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  late PageController _pagecontroller;
  var _currentIndex = 0;
  final UserRoleController _userRoleController = Get.find<UserRoleController>();

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
            _userRoleController.isUser ? const HomeUserScreen() : const HomeLawyerScreen(),

            _userRoleController.isUser ? const ConsultationsScreen():const CasesScreen(),
            const MessagesScreen(),
            // AppointmentsLawyerScreen(),
             _userRoleController.isUser ? const MyCaseUserScreen() : const EarningsLawyerScreen(),
            const SettingsLawyerScreen(),
            // userController.userRole.value==UserRole.Patient?HomeView():HomeHealthView(),
            // userController.userRole.value==UserRole.Patient?ProfileView():ProfileProfessionalHealthCareView(),
          ],
        ),
      ),

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.all(
            Radius.circular(AppSize.s14.r),
          ), // Fully rounded corners
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
                iconName: ImageAssets.kHomeIcon,
                currentindex: 0,
              ),
              bottomNavbaritem(
                title: _userRoleController.isUser ? AppStrings.kNewConsultation : AppStrings.kCase,
                iconName: _userRoleController.isUser ? ImageAssets.kconsultmentIcon :  ImageAssets.kAppointmentIcon,
                currentindex: 1,
              ),
              bottomNavbaritem(
                title: AppStrings.kMessage,
                iconName: ImageAssets.kMessageHomeIcon,
                currentindex: 2,
              ),
              bottomNavbaritem(
                title: _userRoleController.isUser ? AppStrings.kMyCases : AppStrings.kEarnings,
                iconName: _userRoleController.isUser ?ImageAssets.kMyCaseIcon : ImageAssets.kEarningIcon,
                currentindex: 3,
              ),
              bottomNavbaritem(
                title: AppStrings.kSettings,
                iconName: ImageAssets.kSettingsIcon,
                currentindex: 4,
              ),
            ],
          ),
        ),
      ),
    );
  }

  BottomNavigationBarItem bottomNavbaritem({
    String? title,
    String? iconName,
    int? currentindex,
  }) {
    return BottomNavigationBarItem(
      label: "",
      icon: Padding(
        padding: const EdgeInsets.only(top: 10.0, bottom: 5.0),
        child: Column(
          children: [
            SvgPicture.asset(
              iconName!,
              color:
                  currentindex == _currentIndex
                      ? ColorManager.secondary
                      : ColorManager.kGreyColor,
            ),
            const SizedBox(height: 5.0),
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
