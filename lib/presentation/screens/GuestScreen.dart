import 'package:bloc_concept/presentation/blocs/GuestBloc.dart';
import 'package:flutter/material.dart';
import 'package:bloc_concept/utils/SpreadSheetUtil.dart';
import '../../utils/SearchBox.dart';
import 'package:bloc_concept/utils/ColorUtils.dart';
import 'package:bloc_concept/utils/FontUtils.dart';
import 'GuestBookAddEdit.dart';
import 'package:bloc_concept/utils/ScreenUtils.dart';

class GuestScreen extends StatefulWidget {
  _GuestScreenState createState() => _GuestScreenState();
}

class _GuestScreenState extends State<GuestScreen> {
  var selectedRow = -1;
  @override
  void initState() {
    super.initState();
    //getData();
    guestBloc.getData();
  }

  /*  getData() async {
    var tempguests = await queryGuests();
    setState(() {
      guests = tempguests;
    });
  } */

  @override
  Widget build(BuildContext context) {
    hp = ScreenUtils(MediaQuery.of(context).size).hp;
    wp = ScreenUtils(MediaQuery.of(context).size).wp;
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.white,
      body: GestureDetector(
        onTapDown: (TapDownDetails details) {
          setState(() {
            selectedRow = -1;
          });
        },
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: hp(134.4), vertical: wp(76.8)),
          child: Column(
            children: <Widget>[
              Container(
                  child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      children: <Widget>[
                        customTitle("GUESTBOOK", 58, spacing: true),
                      ],
                    ),
                  ),
                  Container(
                    height: hp(60),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Flexible(flex: 6, child: CustomSearchBox()),
                        Spacer(
                          flex: 4,
                        ),
                        Expanded(
                          flex: 3,
                          child: RaisedButton(
                            color: ColorUtils.accent,
                            //color: Colors.whte,
                            shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(7.0)),
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return GuestBookAddEdit();
                                  });
                            },
                            child: Text(
                              "+ ADD NEW GUEST",
                              style: TextStyle(
                                  fontSize: hp(23.76),
                                  color: Colors.white,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )),
              SizedBox(
                height: hp(32.4),
              ),
              Container(
                height: hp(70.2),
                child: Row(
                  children: <Widget>[
                    customHeader("NAME"),
                    customHeader("PHONE NUMBER"),
                    customHeader("EMAIL"),
                    customHeader("ADDRESS")
                  ],
                ),
              ),
              Expanded(
                child: StreamBuilder(
                  stream: guestBloc.stream,
                  initialData: [],
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    return ScrollConfiguration(
                      behavior: NoGlowingBehavior(),
                      child: ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        itemCount: snapshot.hasData ? snapshot.data.length : 0,
                        itemBuilder: (BuildContext context, int index) {
                          return GuestsRow(
                              snapshot.data[index], index, selectedRow, () {
                            setState(() {
                              selectedRow = index;
                            });
                          }, () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return GuestBookAddEdit(snapshot.data[index]);
                                });
                          });
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
