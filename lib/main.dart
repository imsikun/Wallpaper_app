import 'package:Wallpaper_app/constraints.dart';
import 'package:Wallpaper_app/views/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wallpaper Heaven',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: mPrimaryBackgroundColor,
      ),
      home: Home(),
    );
  }
}
