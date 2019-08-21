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
    Function(String) onTap, String title, String detail,
    {String defaultText, double height = 61}) {
  final field = defaultText != ""
      ? customTextField(onTap, "$detail", defaultText)
      : customTextField(onTap, "$detail");

  return customInput(title: title, input: field, height: height);
}

Widget customInputSameHint(Function(dynamic) onTap, String title,
    {String defaultText}) {
  return customInputDetailHint(onTap, title, title, defaultText: defaultText);
}

Widget customInputPhoneNumber(
  Function(dynamic) onTap,
) {
  return customInput(title: "PHONE NUMBER", input: phoneTextField(onTap));
}

Widget customInputDatePicker(String title, String defaultDate, bool changed,
    BuildContext context, Function(DateTime) dateCallBack) {
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
                            firstDate: DateTime(2018),
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

Widget addressInfo() => Padding(
      padding: EdgeInsets.only(left: wp(15.7)),
      child: addressCell(
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 24.51, vertical: 21.25),
              child: customText(
                  "4360 Sunset Blvd Los Angeles, CA 90029", Colors.black, 17),
            ),
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: wp(14.66), vertical: hp(16)),
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
