import 'package:shared_preferences/shared_preferences.dart';

late final SharedPreferences prefs;

String? accessToken;
String? refreshToken;

late List<String> records;
late List<String> recordDates;