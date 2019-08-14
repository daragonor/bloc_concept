import 'package:flutter/material.dart';
import 'ColorUtils.dart';
import 'ScreenUtils.dart';

Widget customTitle(String text, double percentage) {
  return Text(
    "$text",
    style: TextStyle(
        color: ColorUtils.title,
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w600,
        fontSize: hp(percentage),
        letterSpacing: 0.8),
  );
}

Widget areaTitle(String text) {
  return Text(
    "$text",
    style: customTextStyle(3.6, ColorUtils.accent)
  );
}

Widget fieldTitle(String text) {
  return Text(
    "$text",
    style: customTextStyle(2.4, Colors.black)
  );
}

Widget hintText(String text) {
  return Text(
    "$text",
    style: customTextStyle(1.4, ColorUtils.hintText)
  );
}

TextStyle customTextStyle(double percentage, Color color) {
  return TextStyle(
      color: color,
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w600,
      fontSize: hp(percentage),
      letterSpacing: 0.8);
}
