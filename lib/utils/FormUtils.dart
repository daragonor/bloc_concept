import 'package:flutter/material.dart';
import 'ColorUtils.dart';
import 'FontUtils.dart';
import 'ScreenUtils.dart';

Widget customInputDetailHint(String title, String detail) {
  return Row(
    children: <Widget>[
      Expanded(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                fieldTitle("${title.toUpperCase()}"),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(width: 0.0),
                  borderRadius: BorderRadius.circular(5.0)),
              child: customTextField("$detail")
            )
          ],
        ),
      ),
    ],
  );
}

Widget customInputSameHint(String title) {
  return customInputDetailHint(title, title);
}

Widget customInputPhoneNumber() {
  return Row(
    children: <Widget>[
      Expanded(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                fieldTitle("PHONE NUMBER"),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(width: 0.0),
                  borderRadius: BorderRadius.circular(5.0)),
              child: Row(
                children: <Widget>[
                  Expanded(child: Container(),),
                  Expanded(child: customTextField("(XXX) XXX XXXX")),
                ],
              )
            )
          ],
        ),
      ),
    ],
  );
}

TextField customTextField(String hint) {
  return TextField(
    decoration: InputDecoration(
        hintText: "$hint",
        hintStyle: customTextStyle(2.4, ColorUtils.hintText)),
  );
}
TextField dateTextField(String hint) {
  return TextField(
    decoration: InputDecoration(
        hintText: "$hint",
        hintStyle: customTextStyle(2.4, ColorUtils.hintText)),
  );
}