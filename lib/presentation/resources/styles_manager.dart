import 'package:casekarao/presentation/resources/font_manager.dart';
import 'package:flutter/material.dart';


TextStyle _getTextStyle(
    double fontSize, String fontFamily, FontWeight fontweight, Color color,
    [Paint? foreground]) {
  return TextStyle(
      fontSize: fontSize,
      fontFamily: fontFamily,
      color: color,
      foreground: foreground,
      fontWeight: fontweight);
}

//regular Style
TextStyle getRegularStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(
      fontSize, FontConstants.fontFamily, FontWeightManager.regular, color);
}

//light text style
TextStyle getlightStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(
      fontSize, FontConstants.fontFamily, FontWeightManager.light, color);
}

//bold text style
TextStyle getboldStyle({double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(
      fontSize, FontConstants.fontFamily, FontWeightManager.bold, color);
}

//medium text style
TextStyle getmediumStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(
      fontSize, FontConstants.fontFamily, FontWeightManager.medium, color);
}

//semibold text style
TextStyle getsemiboldStyle(
    {double fontSize = FontSize.s14, required Color color}) {
  return _getTextStyle(
      fontSize, FontConstants.fontFamily, FontWeightManager.semibold, color);
}

//bold text style
TextStyle getextraboldStyle({double fontSize = FontSize.s18, required Color color}) {
  return _getTextStyle(
      fontSize, FontConstants.fontFamily, FontWeightManager.extrabold, color);
}

//semibold text gradient style