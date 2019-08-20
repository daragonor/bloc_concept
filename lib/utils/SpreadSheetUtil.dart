import 'package:flutter/material.dart';
import 'package:bloc_concept/data/models/Guest.dart';
import 'package:bloc_concept/utils/ColorUtils.dart';
import 'package:bloc_concept/utils/ScreenUtils.dart';
import 'package:bloc_concept/presentation/blocs/AddressBloc.dart';

class GuestsRow extends StatelessWidget {
  final idx;
  final selectedRow;
  final List<Guest> guests;
  final void Function() select;
  final void Function() edit;
  GuestsRow(this.guests, this.idx, this.selectedRow, this.select, this.edit);
  @override
  Widget build(BuildContext context) {
    bool selected = idx != selectedRow;
    var guest = guests[idx];
    addressBloc.getData();
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

            StreamBuilder(
              stream: addressBloc.stream,
              initialData: [Address()],
              builder: (context, snapshot){
                var address = snapshot.data[0];
                return guestCell(selected, "${address.address} ${address.addressLine2} ${address.city} ${address.state} ${address.postalCode}");
              },
            )
          ],
        ),
      ),
    );
  }
}

class GuestCell extends StatefulWidget {
  final col;
  final guest;
  final selected;
  GuestCell(this.col, this.guest, this.selected);
  @override
  _GuestCell createState() => _GuestCell(col, guest, selected);
}

guestCell(bool selected, String data) => Expanded(
      child: Container(
        height: hp(75.6 * 100 / 1080),
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Center(
            child: Text(
              '$data',
              style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: hp(15.12 * 100 / 1080),
                  color: selected ? ColorUtils.spreadsText : Colors.white,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );

class _GuestCell extends State<GuestCell> {
  final col;
  final guest;
  final selected;
  var _address = "";
  _GuestCell(this.col, this.guest, this.selected);
  @override
  Widget build(BuildContext context) {
    String data;
    switch (col) {
      case 0:
        data = "${guest.firstName} ${guest.lastName}";
        break;
      case 1:
        data = guest.phone;
        break;
      case 2:
        data = guest.email;
        break;
      case 3:
        int address = guest.addresses[0];
        getAddress(by: address).then((val) {
          setState(() {
            _address =
                "${val.address} ${val.addressLine2} ${val.city} ${val.state} ${val.postalCode}";
          });
        });
        data = _address;

        break;
      default:
    }
    return Expanded(
      child: Container(
        height: hp(75.6 * 100 / 1080),
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Center(
            child: Text(
              '$data',
              style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: hp(15.12 * 100 / 1080),
                  color: selected ? ColorUtils.spreadsText : Colors.white,
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
          style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: hp(30 * 100 / 1080),
              fontWeight: FontWeight.w600),
        ),
      ),
    ),
  );
}
