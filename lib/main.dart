import 'package:flutter/material.dart';
import 'package:mywallpaper/view/home.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'awesome wallpaper',
      home: Home(),
    );
  }
}


