import 'package:flutter/material.dart';
import 'package:bloc_concept/utils/ScreenUtils.dart';
import 'package:bloc_concept/utils/FontUtils.dart';
import 'package:bloc_concept/utils/ColorUtils.dart';
import 'package:bloc_concept/utils/FormUtils.dart';
import 'package:bloc_concept/utils/SpreadSheetUtil.dart';

class GuestBookAddEdit extends StatefulWidget {
  final bool isNew;
  GuestBookAddEdit(this.isNew, {Key key}) : super(key: key);

  _GuestBookAddEdit createState() => _GuestBookAddEdit(isNew);
}

class _GuestBookAddEdit extends State<GuestBookAddEdit> {
  bool isNew;
  String birth = "MM / DD / YY";
  String anniv = "MM / DD / YY";
  bool birthChanged = false;
  bool annivChanged = false;

  _GuestBookAddEdit(this.isNew);
  final border = 5.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white.withOpacity(0),
        body: Center(
          child: Container(
            height: hp(910 * 100 / 1080),
            width: wp(1100 * 100 / 1920),
            child: Column(
              children: <Widget>[
                Container(
                  height: hp(80 * 100 / 1080),
                  decoration: BoxDecoration(
                      color: ColorUtils.dialogHeader,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(border),
                          topRight: Radius.circular(border))),
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: wp(23.5 * 100 / 1920),
                        top: hp(10.5 * 100 / 1080),
                        bottom: hp(8.5 * 100 / 1080),
                        right: hp(20 * 100 / 1080)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          height: hp(61 * 100 / 1080),
                          width: wp(104 * 100 / 1920),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(hp(2 * 100 / 1080)),
                              border:
                                  Border.all(color: ColorUtils.cancelBorder)),
                          child: IconButton(
                            icon: Icon(
                              Icons.clear,
                              color: Colors.white,
                              size: hp(36 * 100 / 1080),
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                        Container(
                          height: hp(61 * 100 / 1080),
                          width: wp(164 * 100 / 1920),
                          decoration: BoxDecoration(
                              color: ColorUtils.doneButton,
                              borderRadius:
                                  BorderRadius.circular(hp(8 * 100 / 1080))),
                          child: Center(child: doneButton()),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(border),
                            bottomRight: Radius.circular(border))),
                    child: ScrollConfiguration(
                      behavior: NoGlowingBehavior(),
                      child: SingleChildScrollView(
                        child: Container(
                          padding: EdgeInsets.only(
                              right: wp(90 * 100 / 1920),
                              left: wp(90 * 100 / 1920),
                              top: hp(47 * 100 / 1080)),
                          child: Column(
                            children: <Widget>[
                              Container(
                                child: Row(
                                  children: <Widget>[
                                    customTitle("ADD A GUEST", 50)
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: hp(24 * 100 / 1080),
                              ),
                              Container(
                                child: Column(
                                  children: <Widget>[
                                    Row(children: <Widget>[
                                      areaTitle(
                                          "Guest Information".toUpperCase())
                                    ]),
                                    SizedBox(
                                      height: hp(7.22 * 100 / 1080),
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Expanded(
                                          child: Column(
                                            children: <Widget>[
                                              customInputSameHint("FirstName"),
                                              SizedBox(
                                                height: hp(16.5 * 100 / 1080),
                                              ),
                                              customInputSameHint(
                                                  "Email Address")
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: wp(47 * 100 / 1920),
                                        ),
                                        Expanded(
                                          child: Column(
                                            children: <Widget>[
                                              customInputSameHint("Last Name"),
                                              SizedBox(
                                                height: hp(16.5 * 100 / 1080),
                                              ),
                                              customInputPhoneNumber(),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: hp(11.5 * 100 / 1080),
                              ),
                              Container(
                                child: Column(
                                  children: <Widget>[
                                    Row(children: <Widget>[
                                      areaTitle("Address".toUpperCase())
                                    ]),
                                    SizedBox(
                                      height: hp(7.22 * 100 / 1080),
                                    ),
                                    isNew
                                        ? Column(
                                            children: <Widget>[
                                              Row(
                                                children: <Widget>[
                                                  Expanded(
                                                      child:
                                                          customInputSameHint(
                                                              "Address")),
                                                  SizedBox(
                                                    width: wp(47 * 100 / 1920),
                                                  ),
                                                  Expanded(
                                                      child: customInputDetailHint(
                                                          "Address Line 2",
                                                          "Apt, Suite, Building, Floor, Company etc.")),
                                                ],
                                              ),
                                              SizedBox(
                                                height: hp(16.5 * 100 / 1080),
                                              ),
                                              Row(
                                                children: <Widget>[
                                                  Expanded(
                                                      child:
                                                          customInputSameHint(
                                                              "City")),
                                                  SizedBox(
                                                    width: wp(23 * 100 / 1920),
                                                  ),
                                                  Expanded(
                                                      child:
                                                          customInputSameHint(
                                                              "State")),
                                                  SizedBox(
                                                    width: wp(23 * 100 / 1920),
                                                  ),
                                                  Expanded(
                                                      child:
                                                          customInputDetailHint(
                                                              "Postal Code",
                                                              "XXXXX"))
                                                ],
                                              ),
                                            ],
                                          )
                                        : Container(
                                            height: hp(190 * 100 / 1080),
                                            padding: EdgeInsets.only(
                                                bottom: hp(32 * 100 / 1080),
                                                right: 2.0),
                                            child: Row(
                                              children: <Widget>[
                                                Expanded(
                                                  child: ListView.builder(
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    padding: EdgeInsets.zero,
                                                    itemCount: 10,
                                                    itemBuilder:
                                                        (BuildContext context,
                                                            int index) {
                                                      return index == 0
                                                          ? addressButton()
                                                          : addressInfo();
                                                    },
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: hp(11.5 * 100 / 1080),
                              ),
                              Container(
                                child: Column(
                                  children: <Widget>[
                                    Row(children: <Widget>[
                                      areaTitle(
                                          "Other Information".toUpperCase())
                                    ]),
                                    SizedBox(
                                      height: hp(7.22 * 100 / 1080),
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Expanded(
                                          child: customInputDatePicker(
                                              "Date of Birth",
                                              birth,
                                              birthChanged,
                                              context, (date) {
                                            setState(() {
                                              birthChanged = true;
                                              birth =
                                                  "${date.day} / ${date.month} / ${date.year}";
                                            });
                                          }),
                                        ),
                                        SizedBox(
                                          width: wp(47 * 100 / 1920),
                                        ),
                                        Expanded(
                                          child: customInputDatePicker(
                                              "Anniversary",
                                              anniv,
                                              annivChanged,
                                              context, (date) {
                                            setState(() {
                                              annivChanged = true;
                                              anniv =
                                                  "${date.day} / ${date.month} / ${date.year}";
                                            });
                                          }),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: hp(16.5 * 100 / 1080),
                                    ),
                                    Container(
                                      child: Row(
                                        children: <Widget>[
                                          Expanded(
                                            child: customInputDetailHint(
                                                "Customer Notes",
                                                "Add a customer note...",
                                                112),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: hp(47 * 100 / 1080),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

Widget buildAddress(bool adding) {
  if (adding) {
    return Container();
  }
  return Container();
}
