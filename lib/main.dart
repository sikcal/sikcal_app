import 'package:flutter/material.dart';
import 'package:sikcal/screen/welcome/welcome_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'sikcal-app',
      theme: ThemeData(),
      home: WelcomeScreen(),
    );
  }
}