import 'package:bottom_bar/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sikcal/data/providers.dart';

import '../../components/RoundedText.dart';
import '../../components/mypage_calender.dart';
import '../../data/constants.dart';

import 'package:http/http.dart' as http;

class MyPageCalView extends ConsumerStatefulWidget {
  const MyPageCalView({Key? key}) : super(key: key);

  @override
  ConsumerState<MyPageCalView> createState() => _MyPageCalView();
}

class _MyPageCalView extends ConsumerState<MyPageCalView> {

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(userProvider);
    String username = user?.name ?? "사용자";
    int _currentPage = 5;
    String userimg = "images/profile.jpg";

    List current = getCurrentdate();

    //api 요청보내서 한달 치 true/false 리스트 만들고 calender 위젯에 parameter로 넣음
    List _issuccess = [true, false, true];

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: const [
            Image(
              image: AssetImage('images/fork.png'),
              height: 25.0,
            ),
            SizedBox(
              width: 10.0,
            ),
            Text(
              "식칼", // FIXME 화면 별로 title 변경
              style: TextStyle(
                fontSize: 25.0,
                color: Colors.white,
                decoration: TextDecoration.none,
                fontWeight: FontWeight.normal,
              ),
            ),
            SizedBox(
              width: 10.0,
            ),
            Image(
              image: AssetImage('images/knife.png'),
              height: 25.0,
            ),
          ],
          mainAxisSize: MainAxisSize.min,
        ),
        backgroundColor: primaryColor,
      ),
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
                child: MyCalender(
                  issuccess : _issuccess
                ),
              )),
            ],
          ),
      ),
      bottomNavigationBar: BottomBar(
        itemPadding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 20.0),
        backgroundColor: primaryColor,
        items: [
          BottomBarItem(
              icon: const Icon(
                Icons.feed,
                color: Colors.white,
              ),
              title: const Text("피드"),
              activeColor: Colors.white),
          BottomBarItem(
              icon: const Icon(
                Icons.chat_bubble_outline,
                color: Colors.white,
              ),
              title: const Text("그룹 채팅"),
              activeColor: Colors.white),
          BottomBarItem(
              icon: const Icon(
                Icons.home_outlined,
                size: 30.0,
                color: Colors.white,
              ),
              title: const Text("홈 화면"),
              activeColor: Colors.white),
          BottomBarItem(
              icon: const Icon(
                Icons.star_outline,
                size: 30.0,
                color: Colors.white,
              ),
              title: const Text("나의 식단"),
              activeColor: Colors.white),
          BottomBarItem(
              icon: const Icon(
                Icons.person,
                color: Colors.white,
              ),
              title: const Text("마이페이지"),
              activeColor: Colors.white),
        ],
        onTap: (int value) {
          setState(() {
            _currentPage = value;
          });
        },
        selectedIndex: _currentPage,
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