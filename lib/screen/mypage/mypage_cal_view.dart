import 'dart:convert';
import 'dart:io';

import 'package:bottom_bar/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:sikcal/data/providers.dart';

import '../../components/RoundedText.dart';
import '../../components/mypage_calender.dart';
import '../../data/constants.dart';

import 'package:http/http.dart' as http;

import '../../data/shared_preferences.dart';
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

  List getCurrentdate () {
    DateTime current = DateTime.now();
    // DateFormat dateFormat = DateFormat("yy");
    var currentYear = DateFormat('yyyy').format(current);
    var currentMonth = DateFormat('MM').format(current);
    var currentDay = DateFormat('dd').format(current);

    return [currentYear, currentMonth, currentDay];
  }

  getData() async {
    // var current = getCurrentdate();
    // var yearMonth = "${current[0]}-${current[1]}-${current[2]}";

    //가져올 월별 success status 리스트 세팅
    int result_numer = 3;
    var list_yearMonth = [];
    var total = [];
    //현재 날짜
    DateTime now = DateTime.now();
    var current_ym = DateFormat('yyyy-MM-dd').format(now);
    list_yearMonth.add(current_ym);
    //한달전(한달전의 마지막 day)
    var beforeDate = new DateTime(now.year, now.month, 0);
    var before_ym = DateFormat('yyyy-MM-dd').format(beforeDate);
    list_yearMonth.add(before_ym);
    //두달전(두달전의 마지막 day)
    var bbeforeDate = new DateTime(now.year, now.month - 1, 0);
    var bbefore_ym = DateFormat('yyyy-MM-dd').format(bbeforeDate);
    list_yearMonth.add(bbefore_ym);

    print(list_yearMonth);

    for (int i=0; i<result_numer; i++){
      final url = Uri.http("43.200.102.54:8080","/api/user/calendar", {"yearMonth": list_yearMonth[i]});
      final req = http.Request("GET", url);
      req.headers[HttpHeaders.authorizationHeader] = 'Bearer $accessToken';

      final streamedResponse = await req.send();

      final ress = await http.Response.fromStream(streamedResponse);
      final result = jsonDecode(ress.body) as List<dynamic>;
      print(ress.statusCode);

      var suc = [];
      for (int i=0; i< result.length; i++) {
        suc.add(result[i]['status']);
      }
      total.add(suc);
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(userProvider);
    String username = user?.name ?? "사용자";
    String userimg = "images/profile.jpg";


    List current = getCurrentdate();

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
              // SizedBox(height: 5.0)
              FutureBuilder(
                  future:getData(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData == false) {
                      return CircularProgressIndicator();
                    }
                    //error가 발생하게 될 경우 반환하게 되는 부분
                    else if (snapshot.hasError) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Error: ${snapshot.error}',
                          style: TextStyle(fontSize: 15),
                        ),
                      );
                    }
                    else {
                      return Expanded(
                          child: Container(
                            width: 300,
                            height: 300,
                            child: MyCalender(
                              issuccess: snapshot.data,
                            ),
                          )
                      );
                    }
                  })
            ],
          ),
      ),
    );
  }
}