import 'package:flutter/material.dart';
import 'ColorUtils.dart';
import 'ScreenUtils.dart';

Widget customTitle(String text, double percentage, {bool spacing}) {
  return Text(
    "$text",
    style: TextStyle(
        color: ColorUtils.title,
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w600,
        fontSize: hp(percentage),
        letterSpacing: (spacing ?? false) ? 0.8 : 0.0),
  );
}

Widget areaTitle(String text) {
  return Text("$text", style: customTextStyle(33.78, ColorUtils.accent));
}

Widget doneButton() {
  return Text("Done".toUpperCase(),
      style: customTextStyle(29, Colors.white, Weight.normal));
}

Widget fieldTitle(String text) {
  return Text("$text", style: customTextStyle(22, Colors.black));
}

Widget customText(String text, Color color, double size) {
  return Text("$text", style: customTextStyle(size, color));
}

enum Weight { normal, bold }
TextStyle customTextStyle(double percentage, Color color, [Weight weight]) {
  return TextStyle(
      color: color,
      fontFamily: 'Montserrat',
      fontWeight: (weight ?? Weight.bold) == Weight.normal
          ? FontWeight.w500
          : FontWeight.w600,
      fontSize: hp(percentage));
}
