import 'package:flutter/material.dart';
import 'package:bloc_concept/utils/ColorUtils.dart';
import 'package:bloc_concept/utils/ScreenUtils.dart';

class CustomSearchBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(7.0),
          boxShadow: [
            BoxShadow(
                color: ColorUtils.shadow,
                blurRadius: 0.5,
                spreadRadius: 0.8,
                offset: Offset(0.5, 1.0))
          ]),
      child: Container(
        child: Row(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              child: Icon(
                Icons.search,
                color: Color(0xFF47525D),
                size: hp(4),
              ),
            ),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Search...",
                  hintStyle: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: hp(2.4)
                  )
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
