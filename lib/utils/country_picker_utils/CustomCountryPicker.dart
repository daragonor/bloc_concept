import 'package:bloc_concept/utils/ScreenUtils.dart';
import 'package:country_pickers/country.dart';
import 'package:country_pickers/countries.dart';
import 'package:country_pickers/utils/typedefs.dart';
import 'package:flutter/material.dart';

export 'package:country_pickers/utils/utils.dart';
export 'package:country_pickers/country.dart';

///Provides a customizable [DropdownButton] for all countries
class CustomCountryPickerDropdown extends StatefulWidget {
  CustomCountryPickerDropdown({
    this.itemFilter,
    this.itemBuilder,
    this.initialValue,
    this.onValuePicked,
  });

  /// Filters the available country list
  final ItemFilter itemFilter;

  ///This function will be called to build the child of DropdownMenuItem
  ///If it is not provided, default one will be used which displays
  ///flag image, isoCode and phoneCode in a row.
  ///Check _buildDefaultMenuItem method for details.
  final ItemBuilder itemBuilder;

  ///It should be one of the ISO ALPHA-2 Code that is provided
  ///in countryList map of countries.dart file.
  final String initialValue;

  ///This function will be called whenever a Country item is selected.
  final ValueChanged<Country> onValuePicked;

  @override
  _CustomCountryPickerDropdownState createState() =>
      _CustomCountryPickerDropdownState();
}

class _CustomCountryPickerDropdownState
    extends State<CustomCountryPickerDropdown> {
  List<Country> _countries;
  Country _selectedCountry;

  @override
  void initState() {
    _countries =
        countryList.where(widget.itemFilter ?? acceptAllCountries).toList();

    if (widget.initialValue != null) {
      try {
        _selectedCountry = _countries.firstWhere(
          (country) => country.isoCode == widget.initialValue.toUpperCase(),
        );
      } catch (error) {
        throw Exception(
            "The initialValue provided is not a supported iso code!");
      }
    } else {
      _selectedCountry = _countries[0];
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<DropdownMenuItem<Country>> items = _countries
        .map((country) => DropdownMenuItem<Country>(
            value: country, child: widget.itemBuilder(country)))
        .toList();

    return Container(
      width: 100,
      child: DropdownButtonHideUnderline(
        child: DropdownButton<Country>(
          isExpanded: true,
          iconSize: hp(15*100/1080),
          onChanged: (value) {
            setState(() {
              _selectedCountry = value;
              widget.onValuePicked(value);
            });
          },
          items: items,
          value: _selectedCountry,
        ),
      ),
    );
  }
}
