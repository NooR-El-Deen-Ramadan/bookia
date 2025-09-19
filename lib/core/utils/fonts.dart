import 'package:bookia/core/constants/fonts.dart';
import 'package:flutter/material.dart';

class AppFontStyles {
  static TextStyle getSize12({
    double fontSize = 12,
    Color? fontColor,
    FontWeight fontWeight = FontWeight.w400,
  }) => TextStyle(fontSize: fontSize, fontWeight: fontWeight, color: fontColor);

  static TextStyle getSize18({
    double fontSize = 18,
    Color? fontColor,
    FontWeight fontWeight = FontWeight.w400,
  }) => TextStyle(fontSize: fontSize, fontWeight: fontWeight, color: fontColor);

  static TextStyle getSize24({
    double fontSize = 24,
    Color? fontColor,
    FontWeight fontWeight = FontWeight.w400,
  }) => TextStyle(
    fontFamily: Fonts.DMSerifDisplay,
    fontSize: fontSize,
    fontWeight: fontWeight,
    color: fontColor,
  );

  static TextStyle getSize30({
    double fontSize = 30,
    Color? fontColor,
    FontWeight fontWeight = FontWeight.w400,
  }) => TextStyle(fontWeight: fontWeight, fontSize: fontSize, color: fontColor);
}
