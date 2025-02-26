import 'package:flutter/material.dart';

class ColorManager {
  static Color primary = const Color(0xff000000);
  static Color secondary = const Color(0xff4285F4);
  static Color kGreyColor = const Color(0xffB5B5C3);
  static Color kWhiteColor = const Color(0xffFFFFFF);
  static Color kGreenColor = const Color(0xff34A853);
  static Color kDarkGreyColor = const Color(0xff505050);
  static Color kHintTextColor = const Color(0xffa4a4a2);
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