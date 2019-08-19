import 'package:flutter/material.dart';
import 'ColorUtils.dart';
import 'FontUtils.dart';
import 'ScreenUtils.dart';
import 'package:bloc_concept/utils/country_picker_utils/CustomCountryPicker.dart';
import 'package:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart';

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
              height: hp(3.5 * 100 / 1080),
            ),
            Container(
                height: hp(height * 100 / 1080),
                decoration: BoxDecoration(
                    border: Border.all(
                      width: 0.0,
                      color: Color(0x8047525D),
                    ),
                    borderRadius: BorderRadius.circular(2.0)),
                child: Container(
                    padding: EdgeInsets.only(left: wp(20.5 * 100 / 1920)),
                    alignment: Alignment.centerLeft,
                    child: input))
          ],
        ),
      ),
    ],
  );
}

TextField customTextField(String hint) {
  return TextField(
    textAlign: TextAlign.start,
    decoration: InputDecoration.collapsed(
        border: InputBorder.none,
        hintText: "$hint",
        hintStyle: customTextStyle(19, ColorUtils.hintText, Weight.normal)),
  );
}

Widget customInputDetailHint(String title, String detail,
    [double height = 61]) {
  return customInput(
      title: title, input: customTextField("$detail"), height: height);
}

Widget customInputSameHint(String title) {
  return customInputDetailHint(title, title);
}

Widget customInputPhoneNumber() {
  return customInput(title: "PHONE NUMBER", input: phoneTextField());
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
              height: hp(3.5 * 100 / 1080),
            ),
            Container(
              height: hp(42 * 100 / 1080),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: hp(12 * 100 / 1080)),
                      constraints: BoxConstraints.expand(),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                              width: 0.0, color: ColorUtils.inputBorder),
                        ),
                      ),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                              child: customText(
                                  "$defaultDate",
                                  changed ? Colors.black : ColorUtils.hintText,
                                  19)),
                          GestureDetector(
                            onTap: () {
                              DatePicker.showDatePicker(context, onConfirm:
                                  (DateTime dateTime, List<int> selectedIndex) {
                                dateCallBack(dateTime);
                              });
                            },
                            child: Icon(
                              Icons.calendar_today,
                              color: ColorUtils.inputBorder,
                              size: hp(24 * 100 / 1080),
                            ),
                          ),
                        ],
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

TextField dateTextField() {
  return TextField(
    decoration: InputDecoration(
        hintText: "MM / DD / YY",
        hintStyle: customTextStyle(19, ColorUtils.hintText)),
  );
}

Widget phoneTextField() {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: <Widget>[
      Container(
        decoration: BoxDecoration(
          border: Border(
            right: BorderSide(width: 0.0, color: ColorUtils.spreadsheet),
          ),
        ),
        width: wp(130 * 100 / 1920),
        child: CustomCountryPickerDropdown(
          initialValue: 'us',
          itemBuilder: _buildDropdownItem,
          onValuePicked: (Country country) {
            print("${country.name}");
          },
        ),
      ),
      Expanded(
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(left: wp(15.7 * 100 / 1920)),
            child: customTextField("(XXX) XXX XXXX"),
          ),
        ),
      ),
    ],
  );
}

Widget _buildDropdownItem(Country country) => Container(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(child: CountryPickerUtils.getDefaultFlagImage(country)),
          SizedBox(width: 8.0),
          Center(
            child: customText(
              "+${country.phoneCode}",
              ColorUtils.spreadsText,
              hp(12 * 100 / 1080),
            ),
          ),
        ],
      ),
    );

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
              size: hp(81 * 100 / 1080),
            ),
          ),
          SizedBox(
            height: hp(10 * 100 / 1080),
          ),
          customText("Add Adress", ColorUtils.addressGray, 14),
        ],
      ),
    );

Widget addressInfo() => Padding(
      padding: EdgeInsets.only(left: wp(15.7 * 100 / 1920)),
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
              padding: EdgeInsets.symmetric(
                  horizontal: wp(14.66 * 100 / 1080),
                  vertical: hp(16 * 100 / 1080)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {},
                    child: customText(
                        "Delete".toUpperCase(), ColorUtils.accent2, 12),
                  ),
                  SizedBox(
                    width: wp(20 * 100 / 1920),
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
