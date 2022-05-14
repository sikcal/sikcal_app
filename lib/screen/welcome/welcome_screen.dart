import 'package:flutter/material.dart';

import '../../Component/button_green.dart';

import 'package:sikcal/screen/InputUserInformation/input_start.dart';


class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(child: Column(children: <Widget>[
          SizedBox(height: 100),
          Container(
            child: Icon(Icons.restaurant,
                        color: Colors.grey,
                        size: 200,)
          ),
          SizedBox(height: 50),
          Container(
            child: Text('건강하고 즐거운 식단관리'),
          ),
          SizedBox(height: 25),
          Container(
            child: Text('적절하고 건강한 양의 식단을 섭취하는데 도움을 드립니다.'),
          ),
          SizedBox(height: 50),
          Button_Green(
              text: '구글 계정으로 시작하기',
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return InputStartScreen();
                    },
                  ),
                );
              }
          ),
          Button_Green(
              text: '계정이 이미 있어요',
              press: () {
                //계정이 이미 있는 경우 로그인후 바로 홈페이지로 이동
              }
          ),
        ]
        ),
        ),
    );
  }
}
