import 'package:flutter/material.dart';
import 'screens.dart/home.dart';
import 'screens.dart/utils.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Builder(builder: (context) {
        Utils.screenHeight = MediaQuery.of(context).size.height -
            AppBar().preferredSize.height -
            MediaQuery.of(context).padding.top;
        return Home();
      }),
    );
  }
}
