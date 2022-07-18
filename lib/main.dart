import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sikcal/screen/mypage/mypage_main_view.dart';
import 'package:sikcal/screen/welcome/welcome_screen.dart';
import 'package:sikcal/data/constants.dart';

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
    return ProviderScope(
      child: MaterialApp(
        theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            floatingActionButtonTheme: FloatingActionButtonThemeData(
              backgroundColor: primaryColor,
            ),
            textTheme: TextTheme(
              bodyText2: kDefaultTextStyle,
            )),
        home: Stack(
          children: [
            MyPageMainView(), // TODO auth gate
          ],
        ),
      ),
    );
  }
}