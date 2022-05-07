import 'package:flutter/material.dart';
import 'package:sikcal/screen/welcome/welcome_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
<<<<<<< HEAD
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
=======

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("식칼"),
        ),
      ),
    );
  }
}
>>>>>>> 57480088bad54e0a7a910d669fce02fe8b183c1d
