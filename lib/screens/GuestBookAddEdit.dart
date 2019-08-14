import 'package:flutter/material.dart';
import 'package:bloc_concept/utils/ScreenUtils.dart';
import 'package:bloc_concept/utils/FontUtils.dart';
import 'package:bloc_concept/utils/ColorUtils.dart';
import 'package:bloc_concept/utils/FormUtils.dart';

class GuestBookAddEdit extends StatefulWidget {
  GuestBookAddEdit({Key key}) : super(key: key);

  _GuestBookAddEdit createState() => _GuestBookAddEdit();
}

class _GuestBookAddEdit extends State<GuestBookAddEdit> {
  final border = 5.0;
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        dialogBackgroundColor: Colors.transparent,
      ),
      child: Dialog(
        child: Container(
          height: hp(910*100/1080),
          width: wp(1100*100/1920),
          child: Column(
            children: <Widget>[
              Container(
                height: hp(7.407),
                decoration: BoxDecoration(
                    color: ColorUtils.dialogheader,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(border),
                        topRight: Radius.circular(border))),
                child: Row(),
              ),
              SingleChildScrollView(
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(border),
                          bottomRight: Radius.circular(border))),
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: Row(
                          children: <Widget>[customTitle("ADD A GUEST", 4.4)],
                        ),
                      ),
                      Container(
                        child: Column(
                          children: <Widget>[
                            Row(children: <Widget>[
                              areaTitle("Guest Information".toUpperCase())
                            ]),
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child: Column(
                                    children: <Widget>[
                                      customInputSameHint("FirstName"),
                                      customInputSameHint("Email Address")
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    children: <Widget>[
                                      customInputSameHint("Last Name"),
                                      customInputPhoneNumber(),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                     Container(
                        child: Column(
                          children: <Widget>[
                            Row(children: <Widget>[
                              areaTitle("Address".toUpperCase())
                            ]),
                            Row(
                              children: <Widget>[
                                Expanded(
                                    child: customInputSameHint("Address")),
                                Expanded(
                                    child: customInputDetailHint(
                                        "Address Line 2",
                                        "Apt, Suite, Building, Floor, Company etc."))
                              ],
                            ),
                            //TODO - if si es edit o add (Carrusel)
                            Container(
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                      child: customInputSameHint("City")),
                                  Expanded(
                                      child: customInputSameHint("State")),
                                  Expanded(
                                      child: customInputDetailHint(
                                          "Postal Code", "XXXXX"))
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        child: Column(
                          children: <Widget>[
                            Row(children: <Widget>[
                              areaTitle("Other Information".toUpperCase())
                            ]),
                            Row(
                              children: <Widget>[
                                Expanded(
                                    child: customInputSameHint("Date of Birth")),
                                Expanded(
                                    child: customInputSameHint("Date of Birth"))
                              ],
                            ),
                            //TODO - if si es edit o add (Carrusel)
                            Container(
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                      child: customInputDetailHint("Customer Notes", "Add a customer note..."))
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
