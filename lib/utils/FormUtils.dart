import 'package:flutter/material.dart';
import 'ColorUtils.dart';
import 'FontUtils.dart';
import 'ScreenUtils.dart';
import 'package:country_pickers/country_picker_dropdown.dart';
import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_pickers.dart';
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

Widget customInputDatePicker(String title, BuildContext context) {
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
              child: Container(
                alignment: Alignment.centerLeft,
                child: TextField(
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: Icon(
                          Icons.calendar_today,
                          color: ColorUtils.inputBorder,
                          size: hp(24 * 100 / 1080),
                        ),
                        onPressed: () {
                          DatePicker.showDatePicker(
                            context,
                          );
                        },
                      ),
                      hintText: "MM / DD / YY",
                      hintStyle: customTextStyle(19, ColorUtils.hintText)),
                ),
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
    children: <Widget>[
      Expanded(
        //TODO - Country picker
        child: Container(
          constraints: BoxConstraints.expand(),
          child: CountryPickerDropdown(
            initialValue: 'tr',
            itemBuilder: _buildDropdownItem,
            onValuePicked: (Country country) {
              print("${country.name}");
            },
          ),
        ),
      ),
      Expanded(child: customTextField("(XXX) XXX XXXX")),
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

Widget _buildDropdownItem(Country country) => Container(
      child: Row(
        children: <Widget>[
          CountryPickerUtils.getDefaultFlagImage(country),
          SizedBox(
            width: 8.0,
          ),
          Text("+${country.phoneCode}(${country.isoCode})"),
        ],
      ),
    );
Widget addressButton() => Container(
    decoration: BoxDecoration(
        border: Border.all(
          width: 0.0,
          color: Color(0x8047525D),
        ),
        borderRadius: BorderRadius.circular(2.0)),
    child: Center(
      child: IconButton(
        icon: Icon(
          Icons.add_circle,
          size: hp(81*100/1080),
        ),
        onPressed: () {},
      ),
    ));
Widget addressCell() => Container(
      decoration: BoxDecoration(
          border: Border.all(
            width: 0.0,
            color: Color(0x8047525D),
          ),
          borderRadius: BorderRadius.circular(2.0)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text("datita"),
          Row(
            children: <Widget>[
              FlatButton(
                onPressed: () {},
                child: Text("daton"),
              ),
              FlatButton(
                onPressed: () {},
                child: Text("datazo"),
              )
            ],
          )
        ],
      ),
    );
