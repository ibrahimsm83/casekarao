import 'package:flutter/material.dart';

class ColorManager {
  static Color primary = const Color(0xff000000);
  static Color secondary = const Color(0xff4285F4);
  static Color kGreyColor = const Color(0xffB5B5C3);
  static Color kWhiteColor = const Color(0xffFFFFFF);
  static Color kGreenColor = const Color(0xff34A853);
  static Color kDarkGreyColor = const Color(0xff505050);
  static Color kLightBlueColor = const Color(0xff4285F4);
  static Color kHintTextColor = const Color(0xffa4a4a2);
  static Color kBackgroundColor = const Color(0xffeff1f3);
  static Color kLightYellowColor = const Color(0xffFBBC05);
  static Color kDarkYellowColor = const Color(0xffD88912);
  static Color kDarkBlueColor = const Color(0xff1E59BB);
  static Color kLightRedColor = const Color(0xffEA4335);
  static Color kDarkRedColor = const Color(0xffDE2E1F);
  static Color kLightGreenColor = const Color(0xff34A853);
  static Color kDarkGreenColor = const Color(0xff178033);
  static Color kTitleBgColor = const Color(0xffE2E3E4);
  static Color kOrangeColor = const Color(0xffFB7B05);
  static Color kInputTexBgColor = const Color(0xffE7E9EB);
  static Color kChatBgColor = const Color(0xffE4E5E5);
  static Color kRedColor = Colors.red;

}

extension HexColor on Color {
  static Color fromHex(String hexColorString) {
    hexColorString = hexColorString.replaceAll('#', '');
    if (hexColorString.length == 6) {
      hexColorString = "FF$hexColorString"; // 8 char with opacity 100%
    }
    return Color(int.parse(hexColorString, radix: 16));
  }
}