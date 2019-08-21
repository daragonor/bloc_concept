import 'package:bloc_concept/presentation/blocs/GuestBloc.dart';
import 'package:flutter/material.dart';
import 'package:bloc_concept/utils/ScreenUtils.dart';
import 'package:bloc_concept/utils/FontUtils.dart';
import 'package:bloc_concept/utils/ColorUtils.dart';
import 'package:bloc_concept/utils/FormUtils.dart';
import 'package:bloc_concept/utils/SpreadSheetUtil.dart';
import 'package:bloc_concept/data/models/Guest.dart';
import 'package:bloc_concept/data/repository/GuestRepository.dart';
import 'dart:convert';

class GuestBookAddEdit extends StatefulWidget {
  final guest;
  GuestBookAddEdit([this.guest, Key key]) : super(key: key);

  _GuestBookAddEdit createState() => _GuestBookAddEdit(guest);
}

class _GuestBookAddEdit extends State<GuestBookAddEdit> {
  String birth = "MM / DD / YY";
  String anniv = "MM / DD / YY";
  bool birthChanged = false;
  bool annivChanged = false;
  Guest guest;
  List<Address> addresses;
  bool isNew;
  _GuestBookAddEdit(this.guest);
  final border = 5.0;
  @override
  void initState() {
    super.initState();
    isNew = guest?.id != null ? false : true;
    guest = guest ?? Guest();
    addresses = !isNew
        ? Address.fromJsonList(jsonDecode(guest.addresses))
        : [Address()];
    if (!isNew) {
      if (guest.birthDate != "") {
        var date = DateTime.parse(guest.birthDate);
        birth = "${date.day} / ${date.month} / ${date.year}";
        birthChanged = true;
      }
      if (guest.anniversary != "") {
        var date = DateTime.parse(guest.anniversary);
        anniv = "${date.day} / ${date.month} / ${date.year}";
        annivChanged = true;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0),
      body: Center(
        child: Container(
          height: hp(910),
          width: wp(1100),
          child: Column(
            children: <Widget>[
              Container(
                height: hp(80),
                decoration: BoxDecoration(
                    color: ColorUtils.dialogHeader,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(border),
                        topRight: Radius.circular(border))),
                child: Padding(
                  padding: EdgeInsets.only(
                      left: wp(23.5),
                      top: hp(10.5),
                      bottom: hp(8.5),
                      right: hp(20)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        height: hp(61),
                        width: wp(104),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(hp(2)),
                            border: Border.all(color: ColorUtils.cancelBorder)),
                        child: IconButton(
                          icon: Icon(Icons.clear,
                              color: Colors.white, size: hp(36)),
                          onPressed: () {
                            guestBloc.getData();
                            Navigator.pop(context);
                          },
                        ),
                      ),
                      Container(
                        height: hp(61),
                        width: wp(164),
                        decoration: BoxDecoration(
                            color: ColorUtils.doneButton,
                            borderRadius: BorderRadius.circular(hp(8))),
                        child: Center(
                          child: InkWell(
                            onTap: () {
                              if (isNew) {
                                insertGuest(guest, addresses).then((_) {
                                  guestBloc.getData();
                                  Navigator.pop(context);
                                });
                              } else {
                                guest.addresses = json.encode(addresses);
                                updateGuest(guest).then((_) {
                                  guestBloc.getData();
                                  Navigator.pop(context);
                                });
                              }
                            },
                            child: doneButton(),
                          ),
                        ),
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
                            right: wp(90), left: wp(90), top: hp(47)),
                        child: Column(
                          children: <Widget>[
                            Container(
                              child: Row(
                                children: <Widget>[
                                  customTitle("ADD A GUEST", 50)
                                ],
                              ),
                            ),
                            SizedBox(height: hp(24)),
                            Container(
                              child: Column(
                                children: <Widget>[
                                  Row(children: <Widget>[
                                    areaTitle("Guest Information".toUpperCase())
                                  ]),
                                  SizedBox(height: hp(7.22)),
                                  Row(
                                    children: <Widget>[
                                      Expanded(
                                        child: Column(
                                          children: <Widget>[
                                            customInputSameHint(
                                                onTap: (firstName) {
                                                  guest.firstName = firstName;
                                                },
                                                title: "FirstName",
                                                guestInfo: guest.firstName),
                                            SizedBox(height: hp(16.5)),
                                            customInputSameHint(
                                                onTap: (email) {
                                                  guest.email = email;
                                                },
                                                title: "Email Address",
                                                guestInfo: guest.email)
                                          ],
                                        ),
                                      ),
                                      SizedBox(width: wp(47)),
                                      Expanded(
                                        child: Column(
                                          children: <Widget>[
                                            customInputSameHint(
                                                onTap: (lastName) {
                                                  guest.lastName = lastName;
                                                },
                                                title: "Last Name",
                                                guestInfo: guest.lastName),
                                            SizedBox(height: hp(16.5)),
                                            customInputPhoneNumber(
                                                onTap: (phone) {
                                                  guest.phone = phone;
                                                },
                                                guestInfo: guest.phone),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: hp(11.5)),
                            Container(
                              child: Column(
                                children: <Widget>[
                                  Row(children: <Widget>[
                                    areaTitle("Address".toUpperCase())
                                  ]),
                                  SizedBox(height: hp(7.22)),
                                  isNew
                                      ? newGuestAddress(addresses[0])
                                      : listGuestAddresses()
                                ],
                              ),
                            ),
                            SizedBox(height: hp(11.5)),
                            Container(
                              child: Column(
                                children: <Widget>[
                                  Row(children: <Widget>[
                                    areaTitle("Other Information".toUpperCase())
                                  ]),
                                  SizedBox(height: hp(7.22)),
                                  Row(
                                    children: <Widget>[
                                      Expanded(
                                        child: customInputDatePicker(
                                            title: "Date of Birth",
                                            defaultDate: birth,
                                            changed: birthChanged,
                                            context: context,
                                            dateCallBack: (date) {
                                              guest.birthDate = date.toString();
                                              setState(() {
                                                birthChanged = true;
                                                birth =
                                                    "${date.day} / ${date.month} / ${date.year}";
                                              });
                                            }),
                                      ),
                                      SizedBox(width: wp(47)),
                                      Expanded(
                                        child: customInputDatePicker(
                                            title: "Anniversary",
                                            defaultDate: anniv,
                                            changed: annivChanged,
                                            context: context,
                                            dateCallBack: (date) {
                                              guest.anniversary =
                                                  date.toString();
                                              setState(() {
                                                annivChanged = true;
                                                anniv =
                                                    "${date.day} / ${date.month} / ${date.year}";
                                              });
                                            }),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: hp(16.5)),
                                  Container(
                                    child: Row(
                                      children: <Widget>[
                                        Expanded(
                                          child: customInputDetailHint(
                                              onTap: (notes) {
                                                guest.customerNotes = notes;
                                              },
                                              title: "Customer Notes",
                                              detail: "Add a customer note...",
                                              guestInfo: guest.customerNotes,
                                              height: 112),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(height: hp(47))
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
      ),
    );
  }

  newGuestAddress(address) => Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                  child: customInputSameHint(
                      onTap: (_address) {
                        address.address = _address;
                      },
                      title: "Address",
                      guestInfo: address.address)),
              SizedBox(width: wp(47)),
              Expanded(
                  child: customInputDetailHint(
                      onTap: (_address) {
                        address.addressLine2 = _address;
                      },
                      title: "Address Line 2",
                      detail: "Apt, Suite, Building, Floor, Company etc.",
                      guestInfo: address.addressLine2)),
            ],
          ),
          SizedBox(height: hp(16.5)),
          Row(
            children: <Widget>[
              Expanded(
                  child: customInputSameHint(
                      onTap: (_address) {
                        address.city = _address;
                      },
                      title: "City",
                      guestInfo: address.city)),
              SizedBox(width: wp(23)),
              Expanded(
                  child: customInputSameHint(
                      onTap: (_address) {
                        address.state = _address;
                      },
                      title: "State",
                      guestInfo: address.state)),
              SizedBox(width: wp(23)),
              Expanded(
                  child: customInputDetailHint(
                      onTap: (_address) {
                        address.postalCode = _address;
                      },
                      title: "Postal Code",
                      detail: "XXXXX",
                      guestInfo: address.postalCode))
            ],
          ),
        ],
      );
  listGuestAddresses() => Container(
        height: hp(190),
        padding: EdgeInsets.only(bottom: hp(32), right: 2.0),
        child: Row(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.zero,
                itemCount: addresses.length + 1,
                itemBuilder: (BuildContext context, int index) {
                  return index == 0
                      ? addressButton()
                      : addressInfo(addresses[index - 1]);
                },
              ),
            ),
          ],
        ),
      );
}
