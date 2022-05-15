import 'package:flutter/material.dart';

import 'package:sikcal/screen/welcome/welcome_screen.dart';
import 'package:sikcal/data/constants.dart';
import 'package:sikcal/screens/main_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(

          floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: primaryColor,
          ),
          textTheme: TextTheme(
            bodyText2: defaultTextStyle,
          )),
      home: MainView(),
    );
  }
}
