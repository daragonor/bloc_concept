import 'package:flutter/material.dart';
import 'ColorUtils.dart';
import 'FontUtils.dart';
import 'ScreenUtils.dart';
import 'package:bloc_concept/utils/country_picker_utils/CustomCountryPicker.dart';

TextField customTextField(Function(String) onTap, String hint) {
  return TextField(
    onChanged: (text) {
      onTap(text);
    },
    style: customTextStyle(19, Colors.black, Weight.bold),
    textAlign: TextAlign.start,
    decoration: InputDecoration.collapsed(
        border: InputBorder.none,
        hintText: "$hint",
        hintStyle: customTextStyle(19, ColorUtils.hintText, Weight.normal)),
  );
}

Widget phoneTextField(Function(String) onTap) {
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
            child: customTextField(onTap, "(XXX) XXX XXXX"),
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
          Container(
              height: (hp(28 * 100 / 1080)),
              width: wp(50 * 100 / 1920),
              child: CountryPickerUtils.getDefaultFlagImage(country)),
          SizedBox(width: 8.0),
          Expanded(
            child: Center(
              child: customText(
                "+${country.phoneCode}",
                ColorUtils.spreadsText,
                19,
              ),
            ),
          ),
        ],
      ),
    );