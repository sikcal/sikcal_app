import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sikcal/screen/mydiet/mydiet_main_view.dart';
import 'package:sikcal/screen/welcome/welcome_screen.dart'; //이 부분 지우기
import 'package:sikcal/data/constants.dart';
import 'package:sikcal/screens/auth/auth_gate.dart';
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
        home: MyDietMainView(), //이부분 바꾸기 : Main()
      ),
    );
  }
}

class Main extends StatelessWidget {
  const Main({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AuthGate(child: MainView());
  }
}
