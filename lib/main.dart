import 'package:flutter/material.dart';
import 'presentation/screens/GuestScreen.dart';


void main() {
  /* SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeRight,
    DeviceOrientation.landscapeLeft,
  ]).then((_) {
    runApp(MyApp());
  }); */
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: GuestScreen());
  }
}