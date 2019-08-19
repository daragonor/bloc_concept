import 'package:flutter/material.dart';
import 'package:bloc_concept/models/Guest.dart';
import 'package:bloc_concept/utils/ColorUtils.dart';
import 'package:bloc_concept/utils/ScreenUtils.dart';

final List<Guest> guests = [
  Guest("Allan Roekart", "(000) 000 - 0000", "allan@yahoo.com",
      "A23 Faifax Ave Los Angeles CA 9008"),
  Guest("Alex Gallard", "(000) 000 - 0000", "allan@yahoo.com",
      "A23 Faifax Ave Los Angeles CA 9008"),
  Guest("Becka Coombar", "(000) 000 - 0000", "allan@yahoo.com",
      "A23 Faifax Ave Los Angeles CA 9008"),
];

class GuestsRow extends StatelessWidget {
  final idx;
  final selectedRow;
  final void Function() select;
  final void Function() edit;

  GuestsRow(this.idx, this.selectedRow, this.select, this.edit);
  @override
  Widget build(BuildContext context) {
    bool selected = idx != selectedRow;
    return Container(
      decoration: BoxDecoration(
        color: selected ? Colors.white : ColorUtils.accent,
        border: Border.all(width: 0.0, color: ColorUtils.spreadsheet),
      ),
      child: InkWell(
        onTap: () {
          select();
        },
        onDoubleTap: (){
          edit();
        },
        child: Row(
          children: <Widget>[
            GuestCell(0, idx, selected),
            GuestCell(1, idx, selected),
            GuestCell(2, idx, selected),
            GuestCell(3, idx, selected),
          ],
        ),
      ),
    );
  }
}

class GuestCell extends StatelessWidget {
  final col;
  final row;
  final selected;
  GuestCell(this.col, this.row, this.selected);
  @override
  Widget build(BuildContext context) {
    String data;
    switch (col) {
      case 0:
        data = guests[row].name;
        break;
      case 1:
        data = guests[row].phone;
        break;
      case 2:
        data = guests[row].email;
        break;
      case 3:
        data = guests[row].address;
        break;
      default:
    }
    return Expanded(
      child: Container(
        height: hp(7),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Text(
              '$data',
              style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: hp(1.4),
                  color: selected ?  ColorUtils.spreadsText : Colors.white,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}

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
          style:
              TextStyle(
                fontFamily: 'Montserrat', 
                fontSize: hp(30*100/1080),
                fontWeight: FontWeight.w600),
        ),
      ),
    ),
  );
}
