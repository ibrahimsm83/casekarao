import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../controller/user_role_controller.dart';
import '../presentation/resources/export_resources.dart';

class UserTypeSelectionPopup extends StatefulWidget {
  const UserTypeSelectionPopup({Key? key}) : super(key: key);

  @override
  State<UserTypeSelectionPopup> createState() => _UserTypeSelectionPopupState();
}

class _UserTypeSelectionPopupState extends State<UserTypeSelectionPopup> {
  String? selectedUserType;
  final UserRoleController _userRoleController = Get.find<UserRoleController>();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

  Widget contentBox(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: ColorManager.kWhiteColor,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Select User Type',
            style: getsemiboldStyle(
              color: ColorManager.primary,
              fontSize: FontSize.s16.sp,
            ),
          ),
          SizedBox(height: 20.h),
          userTypeDropdown(),
          SizedBox(height: 20.h),
          doneButton(),
        ],
      ),
    );
  }

  Widget userTypeDropdown() {
    return Container(
      height: 45.h,
      child: DropdownButtonFormField<String>(
        value: selectedUserType,
        style: getRegularStyle(color: ColorManager.primary),
        dropdownColor: ColorManager.kWhiteColor,
        icon: Padding(
          padding: EdgeInsets.only(right: 8.0),
          child: SvgPicture.asset(
            ImageAssets.arrowDownIcon,
            colorFilter: ColorFilter.mode(
              ColorManager.kGreyColor,
              BlendMode.srcIn,
            ),
          ),
        ),
        decoration: InputDecoration(
          filled: true,
          fillColor: ColorManager.kWhiteColor,
          contentPadding: EdgeInsets.only(left: 10.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0.r),
            borderSide: BorderSide(color: ColorManager.secondary),
          ),
          hintText: "Select user type",
          hintStyle: getRegularStyle(color: ColorManager.kHintTextColor),
        ),
        onChanged: (String? newValue) {
          setState(() {
            selectedUserType = newValue;
          });
        },
        items:
            ["User", "Lawyer"].map((String userType) {
              return DropdownMenuItem<String>(
                value: userType,
                child: Text(userType),
              );
            }).toList(),
      ),
    );
  }

  Widget doneButton() {
    return InkWell(
      onTap: () {
        if (selectedUserType != null) {
          // Set the global user type
          _userRoleController.isUser = selectedUserType == "User";
          Navigator.of(context).pop();
        } else {
          // Show error message if no selection is made
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Please select a user type'),
              backgroundColor: ColorManager.kRedColor,
            ),
          );
        }
      },
      child: Container(
        height: 44.h,
        decoration: BoxDecoration(
          color: ColorManager.secondary,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Center(
          child: Text(
            "Done",
            style: getmediumStyle(
              color: ColorManager.kWhiteColor,
              fontSize: AppSize.s14.sp,
            ),
          ),
        ),
      ),
    );
  }
}
