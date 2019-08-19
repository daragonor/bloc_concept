import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
/* import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'dart:async';
import 'package:http/http.dart'as http; */
import 'screens/GuestScreen.dart';

/*  List<StaggeredTile> _staggeredTiles = const <StaggeredTile>[
  const StaggeredTile.count(1, 2),
  const StaggeredTile.count(5, 1),
  const StaggeredTile.count(5, 1),
  const StaggeredTile.count(1, 3),
  const StaggeredTile.count(5, 1),
  const StaggeredTile.count(5, 1),
  const StaggeredTile.count(5, 1),
];

List<Widget> _tiles = const <Widget>[
  const _Example01Tile(Colors.green, Icons.widgets),
  const _Example01Tile(Colors.lightBlue, Icons.wifi),
  const _Example01Tile(Colors.amber, Icons.panorama_wide_angle),
  const _Example01Tile(Colors.brown, Icons.map),
  const _Example01Tile(Colors.deepOrange, Icons.send),
  const _Example01Tile(Colors.indigo, Icons.airline_seat_flat),
  const _Example01Tile(Colors.red, Icons.bluetooth)
]; */

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: GuestScreen()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    return MaterialApp(debugShowCheckedModeBanner: false, home: GuestScreen());
  }
}
/*
class OrientationList extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => OrientationListState();
}

class OrientationListState extends State<OrientationList> {
  final url = "https://restcountries.eu/rest/v2/all";
  List countries;

  @override
  void initState() { 
    super.initState();
    this.getJsonData();
  }

  Future<String>  getJsonData() async{
    var response = await http.get(
      Uri.encodeFull(url),
    );

    setState(() {
     //var data = JSON.decode(response.body);

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("holas")),
      body: OrientationBuilder(
        builder: (context, orientation) {
          return  StaggeredGridView.count(
            crossAxisCount: 6,
            staggeredTiles: _staggeredTiles,
            children: _tiles,
            mainAxisSpacing: 4.0,
            crossAxisSpacing: 4.0,
            padding: const EdgeInsets.all(4.0),
          );
        },
      ),
    );
  }
}




class _Example01Tile extends StatelessWidget {
  const _Example01Tile(this.backgroundColor, this.iconData);

  final Color backgroundColor;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return new Card(
      color: backgroundColor,
      child: new InkWell(
        onTap: () {
           showDialog(
            context: context,
            builder: (BuildContext context) {
              // return object of type Dialog
              return simpleDialog;
            },
          );
        },
        child: new Center(
          child: new Padding(
            padding: const EdgeInsets.all(4.0),
            child: new Icon(
              iconData,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

SimpleDialog simpleDialog = SimpleDialog(
                children: <Widget>[
                  Row(children: <Widget>[
                    FlatButton(
                      child: Text("country"),
                      onPressed: () {},
                    ),
                    Expanded(child: Padding(
                      padding: const EdgeInsets.only(right: 16.0),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Number"
                        ),
                      ),
                    ),)
                  ],)
                ],
              ); */
