import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:sikcal/screen/welcome/welcome_screen.dart';
import 'package:sikcal/data/constants.dart';
import 'package:sikcal/screens/loading_screen.dart';
import 'package:sikcal/screens/main_view.dart';

//CHANGE
import 'package:sikcal/screen/mydiet/mydiet_main_view.dart';

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
              bodyText2: defaultTextStyle,
            )),
        home: Stack(
          children: [
            //CHANGE
            MyDietMainView(), // loading state provider의 값이 loading이면 모든 화면에서 로딩 창을 띄웁니다.
          ],
        ),
      ),
    );
  }
}
