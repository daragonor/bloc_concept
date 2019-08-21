import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:bloc_concept/data/models/Guest.dart';
import 'package:bloc_concept/utils/ColorUtils.dart';
import 'package:bloc_concept/utils/ScreenUtils.dart';

class GuestsRow extends StatelessWidget {
  final idx;
  final selectedRow;
  final Guest guest;
  final void Function() select;
  final void Function() edit;
  GuestsRow(this.guest, this.idx, this.selectedRow, this.select, this.edit);
  @override
  Widget build(BuildContext context) {
    bool selected = idx != selectedRow;
    var address = Address.fromJson(jsonDecode(guest.addresses)[0]);
    //TODO
    //var address = jsonDecode(guest.addresses)[0]??Address()
    return Container(
      decoration: BoxDecoration(
        color: selected ? Colors.white : ColorUtils.accent,
        border: Border.all(width: 0.0, color: ColorUtils.spreadsheet),
      ),
      child: InkWell(
        onTap: () {
          select();
        },
        onDoubleTap: () {
          edit();
        },
        child: Row(
          children: <Widget>[
            //GuestCell(0, guests[idx], selected),
            guestCell(selected, "${guest.firstName} ${guest.lastName}"),
            guestCell(selected, "${guest.phone}"),
            guestCell(selected, "${guest.email}"),
            guestCell(selected, "${address.rowPresentation()}")
          ],
        ),
      ),
    );
  }
}

guestCell(bool selected, String data) => Expanded(
      child: Container(
        height: hp(75.6),
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Center(
            child: Text(
              '$data',
              style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: hp(15.12),
                  color: selected ? ColorUtils.spreadsText : Colors.white,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );

class NoGlowingBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}

Expanded customHeader(String text) {
  return Expanded(
    child: Container(
      color: Color(0xFFE0E0E0),
      child: Center(
        child: Text(
          '$text',
          style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: hp(30),
              fontWeight: FontWeight.w600),
        ),
      ),
    ),
  );
}
