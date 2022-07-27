import 'package:bottom_bar/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sikcal/data/providers.dart';

import '../../components/RoundedText.dart';
import '../../components/mypage_calender.dart';
import '../../data/constants.dart';

import 'package:http/http.dart' as http;

import '../../screens/feed/feed_view.dart';
import '../../screens/home/home_view.dart';
import '../mydiet/mydiet_main_view.dart';
import 'mypage_main_view.dart';

class MyPageCalView extends ConsumerStatefulWidget {
  const MyPageCalView({Key? key}) : super(key: key);

  @override
  ConsumerState<MyPageCalView> createState() => _MyPageCalView();
}

class _MyPageCalView extends ConsumerState<MyPageCalView> {

  List<Widget> pages = [
    FeedView(),
    Container(),
    const HomeView(),
    const MyDietMainView(),
    const MyPageMainView(),
  ];

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(userProvider);
    String username = user?.name ?? "사용자";
    int _currentPage = 5;
    String userimg = "images/profile.jpg";


    List current = getCurrentdate();

    return Scaffold(
      body:Center(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 150.0),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50.0),
                    child: Image.asset(
                      userimg,
                      fit: BoxFit.cover,
                      width: 100,
                      height: 100,
                    ),
                  ),
                  SizedBox(width: 100),
                  Text(username,
                    style: TextStyle(
                      color: Color(0xff8BC34A),
                      fontSize: 25.0,
                    ),
                  ),
                ],
              ),
              // SizedBox(height: 5.0),
              RoundedText(
                text: "YEAR     "+current[0].toString(),
                textStyle: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
              RoundedText(
                text: "MONTH    "+current[1].toString(),
                textStyle: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
              Expanded(
                child: Container(
                width: 300,
                height: 300,
                child: MyCalender(),
              )),
            ],
          ),
      ),
    );
  }
  List getCurrentdate () {
    DateTime current = DateTime.now();
    var currentYear = current.year;
    var currentMonth = current.month;

    return [currentYear, currentMonth];
  }
  void _callAPI() async {

    var uri = Uri(
        scheme: 'http',
        host: '43.200.102.54:8080',
        path: 'getPublic',
        queryParameters: {
          'date' : 'date',
        }
    );
    final response = await http.get(uri);
  }
}