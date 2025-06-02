import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../export_casekarao.dart';

class BusinessAndAvailabilityScreen extends StatefulWidget {
  const BusinessAndAvailabilityScreen({super.key});

  @override
  State<BusinessAndAvailabilityScreen> createState() =>
      _BusinessAndAvailabilityScreenState();
}

class _BusinessAndAvailabilityScreenState
    extends State<BusinessAndAvailabilityScreen> {
  int selectedid = 0;
  final _formKey = GlobalKey<FormState>();
  FocusNode node1 = FocusNode();
  final _officeAddressController = TextEditingController();

  // Selected days for multiple selection
  List<String> selectedDays = [];

  // Dynamic time schedules for each selected day
  Map<String, Map<String, String>> daySchedules = {};

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: ColorManager.kBackgroundColor,
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: AppSize.sizeHeight(context) * 0.05),
                InkWell(
                  onTap: () => Navigator.pop(context),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: AppSize.sizeWidth(context) * 0.05,
                    ),
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
                SizedBox(height: AppSize.sizeHeight(context) * 0.01),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppSize.sizeWidth(context) * 0.05,
                  ),
                  child: Text(
                    AppStrings.businessAndAvailability,
                    style: getsemiboldStyle(
                      color: ColorManager.primary,
                      fontSize: ScreenUtil().setSp(AppSize.s24),
                    ),
                  ),
                ),
                SizedBox(height: AppSize.s8.h),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppSize.sizeWidth(context) * 0.05,
                  ),
                  child: Text(
                    AppStrings
                        .createYourLawyerProfileWithAccurateDetailsToHelpUsersFindYouEasily,
                    style: getmediumStyle(
                      color: ColorManager.kDarkGreyColor,
                      fontSize: ScreenUtil().setSp(AppSize.s12),
                    ),
                  ),
                ),
                SizedBox(height: AppSize.s8.h),
                Padding(
                  padding: EdgeInsets.only(
                    top: AppSize.s10.h,
                    bottom: AppSize.s6.h,
                    left: AppSize.sizeWidth(context) * 0.05,
                  ),
                  child: Text(
                    AppStrings.officeAddress,
                    style: getmediumStyle(
                      color: ColorManager.kDarkGreyColor,
                      fontSize: ScreenUtil().setSp(AppSize.s12),
                    ),
                  ),
                ),
                CustomTextFormField(
                  hintText: AppStrings.exCompleteStreetAddress,
                  controller: _officeAddressController,
                  fillColor: ColorManager.kWhiteColor,
                  focusNode: node1,
                  horizontalMergin: 0.05,
                  validator: (String? val) {
                    if (val == null || val.isEmpty) {
                      return "Enter Office Address";
                    }
                    return null;
                  },
                ),
                // SizedBox(height: AppSize.s8.h),
                Padding(
                  padding: EdgeInsets.only(
                    top: AppSize.s18.h,
                    bottom: AppSize.s12.h,
                    left: AppSize.sizeWidth(context) * 0.05,
                  ),
                  child: Text(
                    AppStrings.availabilitySchedule,
                    style: getmediumStyle(
                      color: ColorManager.kDarkGreyColor,
                      fontSize: ScreenUtil().setSp(AppSize.s12),
                    ),
                  ),
                ),
                availabilitySchedule(),
                SizedBox(height: AppSize.s10.h),

                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppSize.sizeWidth(context) * 0.05,
                  ),
                  child: Divider(color: ColorManager.kGreyColor,),
                ),

                // Dynamic time schedules for selected days
                ...selectedDays.map((day) => buildDaySchedule(day)),

                SizedBox(height: AppSize.s20.h),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppSize.sizeWidth(context) * 0.05,
                  ),
                  child: button(
                    text: AppStrings.submit,
                    onTap: () {
                      bool isValid = _formKey.currentState!.validate();

                      if (isValid) {
                        // Debug: Print selected days and schedules
                        print('Selected Days: $selectedDays');
                        print('Day Schedules: $daySchedules');

                        // Call API with form data
                        Get.find<SetupProfileController>().submitBusinessAvailability(
                          address: _officeAddressController.text.trim(),
                          availableDays: selectedDays,
                          schedules: daySchedules,
                        );
                      }
                    },
                  ),
                ),
                SizedBox(height: 5.h),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget fromTo() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppSize.sizeWidth(context) * 0.03,
      ),
      child: Row(
        children: [
          SizedBox(width: 10.0),
          Flexible(child: timeBox(AppStrings.from)),
          SizedBox(width: 10.0),
          Flexible(child: timeBox(AppStrings.to)),
          SizedBox(width: 10.0),
        ],
      ),
    );
  }

  Widget timeBox(String title) {
    return Container(
      decoration: BoxDecoration(
        color: ColorManager.kWhiteColor,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(left: AppSize.s10.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: getmediumStyle(
                      color: ColorManager.kDarkGreyColor,
                      fontSize: ScreenUtil().setSp(AppSize.s12),
                    ),
                  ),
                  Text(
                    AppStrings.hHMM,
                    style: getRegularStyle(
                      color: ColorManager.kHintTextColor,
                      fontSize: ScreenUtil().setSp(AppSize.s12),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: AppSize.s10.w),
              child: SvgPicture.asset(ImageAssets.clockIcon),
            ),
          ],
        ),
      ),
    );
  }

  Widget availabilitySchedule() {
    return MultipleSelectionToggleList(
      selectedItems: selectedDays,
      onSelectionChanged: (List<String> newSelection) {
        setState(() {
          selectedDays = newSelection;

          // Add default times for newly selected days
          for (String day in newSelection) {
            if (!daySchedules.containsKey(day)) {
              daySchedules[day] = {
                'from': '09:00 AM',
                'to': '05:00 PM',
              };
            }
          }

          // Remove times for unselected days
          daySchedules.removeWhere((day, times) => !newSelection.contains(day));
        });
      },
      categories: [
        AppStrings.mon,
        AppStrings.tue,
        AppStrings.wed,
        AppStrings.thu,
        AppStrings.fri,
        AppStrings.sat,
        AppStrings.sun,
      ],
    );
  }

  // Build dynamic day schedule with time pickers
  Widget buildDaySchedule(String day) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: AppSize.s10.h,
            bottom: AppSize.s6.h,
            left: AppSize.sizeWidth(context) * 0.05,
          ),
          child: Row(
            children: [
              Text(
                day,
                style: getmediumStyle(
                  color: ColorManager.kDarkGreyColor,
                  fontSize: ScreenUtil().setSp(AppSize.s14),
                ),
              ),
            ],
          ),
        ),
        buildFromToRow(day),
      ],
    );
  }

  // Build From/To row with time pickers for specific day
  Widget buildFromToRow(String day) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppSize.sizeWidth(context) * 0.03,
      ),
      child: Row(
        children: [
          SizedBox(width: 10.0),
          Flexible(child: buildTimeBox(day, 'from', AppStrings.from)),
          SizedBox(width: 10.0),
          Flexible(child: buildTimeBox(day, 'to', AppStrings.to)),
          SizedBox(width: 10.0),
        ],
      ),
    );
  }

  // Build time picker box for specific day and time type
  Widget buildTimeBox(String day, String timeType, String title) {
    String currentTime = daySchedules[day]?[timeType] ?? '09:00 AM';

    return GestureDetector(
      onTap: () => _selectTime(day, timeType),
      child: Container(
        decoration: BoxDecoration(
          color: ColorManager.kWhiteColor,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(left: AppSize.s10.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: getmediumStyle(
                        color: ColorManager.kDarkGreyColor,
                        fontSize: ScreenUtil().setSp(AppSize.s12),
                      ),
                    ),
                    Text(
                      currentTime,
                      style: getRegularStyle(
                        color: ColorManager.primary,
                        fontSize: ScreenUtil().setSp(AppSize.s12),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: AppSize.s10.w),
                child: SvgPicture.asset(ImageAssets.clockIcon),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Time picker method
  Future<void> _selectTime(String day, String timeType) async {
    String currentTime = daySchedules[day]?[timeType] ?? '09:00 AM';
    TimeOfDay initialTime = _parseTimeString(currentTime);

    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: initialTime,
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: ColorManager.primary,
              onPrimary: ColorManager.kWhiteColor,
              surface: ColorManager.kWhiteColor,
              onSurface: ColorManager.kDarkGreyColor,
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      setState(() {
        String formattedTime = _formatTimeToAMPM(picked);
        daySchedules[day]![timeType] = formattedTime;
      });
    }
  }

  // Parse time string (AM/PM format) to TimeOfDay
  TimeOfDay _parseTimeString(String timeString) {
    try {
      // Handle AM/PM format like "09:00 AM" or "02:30 PM"
      if (timeString.contains('AM') || timeString.contains('PM')) {
        String timePart = timeString.split(' ')[0];
        String period = timeString.split(' ')[1];
        List<String> timeParts = timePart.split(':');

        int hour = int.parse(timeParts[0]);
        int minute = int.parse(timeParts[1]);

        if (period == 'PM' && hour != 12) {
          hour += 12;
        } else if (period == 'AM' && hour == 12) {
          hour = 0;
        }

        return TimeOfDay(hour: hour, minute: minute);
      } else {
        // Fallback for 24-hour format
        List<String> timeParts = timeString.split(':');
        return TimeOfDay(
          hour: int.parse(timeParts[0]),
          minute: int.parse(timeParts[1]),
        );
      }
    } catch (e) {
      // Default fallback
      return TimeOfDay(hour: 9, minute: 0);
    }
  }

  // Format TimeOfDay to AM/PM format
  String _formatTimeToAMPM(TimeOfDay time) {
    int hour = time.hour;
    String period = hour >= 12 ? 'PM' : 'AM';

    if (hour > 12) {
      hour -= 12;
    } else if (hour == 0) {
      hour = 12;
    }

    String formattedHour = hour.toString().padLeft(2, '0');
    String formattedMinute = time.minute.toString().padLeft(2, '0');

    return '$formattedHour:$formattedMinute $period';
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
}