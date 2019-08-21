import 'package:bloc_concept/data/models/Address.dart';
import 'package:flutter/material.dart';
import 'ColorUtils.dart';
import 'FontUtils.dart';
import 'ScreenUtils.dart';
import 'TextFieldUtils.dart';

Widget customInput({String title, Widget input, double height = 61.0}) {
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
            SizedBox(
              height: hp(3.5),
            ),
            Container(
                height: hp(height),
                decoration: BoxDecoration(
                    border: Border.all(
                      width: 0.0,
                      color: Color(0x8047525D),
                    ),
                    borderRadius: BorderRadius.circular(2.0)),
                child: Container(
                    padding: EdgeInsets.only(left: wp(20.5)),
                    alignment: Alignment.centerLeft,
                    child: input))
          ],
        ),
      ),
    ],
  );
}

Widget customInputDetailHint(
    {String title,
    String detail,
    Function(String) onTap,
    String guestInfo,
    double height = 61}) {
  final field = guestInfo != ""
      ? customTextField(onTap, "$detail", guestInfo: guestInfo)
      : customTextField(onTap, "$detail");

  return customInput(title: title, input: field, height: height);
}

Widget customInputSameHint(
    {String title, String guestInfo, Function(dynamic) onTap}) {
  return customInputDetailHint(
      title: title, detail: title, guestInfo: guestInfo, onTap: onTap);
}

Widget customInputPhoneNumber({Function(dynamic) onTap, String guestInfo}) {
  final field = guestInfo != ""
      ? phoneTextField(onTap: onTap, guestInfo: guestInfo)
      : phoneTextField(onTap: onTap);
  return customInput(title: "PHONE NUMBER", input: field);
}

Widget customInputDatePicker({String title, String defaultDate, bool changed,
    BuildContext context, Function(DateTime) dateCallBack}) {
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
            SizedBox(
              height: hp(3.5),
            ),
            Container(
              height: hp(42),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: hp(12)),
                      constraints: BoxConstraints.expand(),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                              width: 0.0, color: ColorUtils.inputBorder),
                        ),
                      ),
                      child: GestureDetector(
                        onTap: () async {
                          var picked = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1996),
                            lastDate: DateTime(2030),
                            builder: (BuildContext context, Widget child) {
                              return Theme(
                                data: ThemeData(),
                                child: child,
                              );
                            },
                          );
                          if (picked != null) {
                            dateCallBack(picked);
                          }
                        },
                        child: Row(
                          children: <Widget>[
                            Expanded(
                                child: customText(
                                    "$defaultDate",
                                    changed
                                        ? Colors.black
                                        : ColorUtils.hintText,
                                    19)),
                            Icon(
                              Icons.calendar_today,
                              color: ColorUtils.inputBorder,
                              size: hp(24),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ],
  );
}

Widget addressCell(Widget content) => AspectRatio(
      aspectRatio: 220 / 190,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            width: 0.0,
            color: Color(0x8047525D),
          ),
          borderRadius: BorderRadius.circular(2.0),
        ),
        child: Center(child: content),
      ),
    );

Widget addressButton() => addressCell(
      Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          GestureDetector(
            onTap: () {},
            child: Icon(
              Icons.add_circle,
              color: ColorUtils.addressGray,
              size: hp(81),
            ),
          ),
          SizedBox(
            height: hp(10),
          ),
          customText("Add Adress", ColorUtils.addressGray, 14),
        ],
      ),
    );

Widget addressInfo(Address address) => Padding(
      padding: EdgeInsets.only(left: wp(15.7)),
      child: addressCell(
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                  left: wp(24.51), right: wp(24.51), top: hp(21.25)),
              child: customText(address.tilePresentation(), Colors.black, 17),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: wp(14.66), right: wp(14.66), bottom: hp(16)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {},
                    child: customText(
                        "Delete".toUpperCase(), ColorUtils.accent2, 12),
                  ),
                  SizedBox(
                    width: wp(20),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child:
                        customText("Edit".toUpperCase(), ColorUtils.accent, 12),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
