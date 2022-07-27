import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sikcal/data/shared_preferences.dart';
import 'package:sikcal/data/constants.dart';
import 'package:sikcal/screens/auth/auth_gate.dart';
import 'package:sikcal/screens/main_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  prefs = await SharedPreferences.getInstance();
  // prefs.clear();
  if (prefs.containsKey('token')) {
    accessToken = prefs.getStringList('token')![0];
    refreshToken = prefs.getStringList('token')![1];
  }
  if (prefs.containsKey('records')) {
    records = prefs.getStringList('records') ?? [];
    recordDates = prefs.getStringList('recordDates') ?? [];
  }

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
        home: Main(),
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
