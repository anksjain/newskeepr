import 'package:flutter/material.dart';
import 'package:newsproject/screens/home_screen.dart';
import 'package:newsproject/screens/temp.dart';
import 'package:newsproject/screens/pageview.dart';
void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
        brightness: Brightness.dark
      ),
      home: HomeScreen(),
    );
  }
}
