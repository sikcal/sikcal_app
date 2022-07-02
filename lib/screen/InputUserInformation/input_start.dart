import 'package:flutter/material.dart';
import 'package:sikcal/components/RoundedButton.dart';

import 'package:sikcal/screen/InputUserInformation/Input_username.dart';


class InputStartScreen extends StatelessWidget {
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
        Container(
          child: Text('반갑습니다! 앱의 사용에 앞서 필요한\n 개인정보와 권장섭취량 측정을 위한\n 정보를 수집합니다.'),
        ),
        SizedBox(height: 25),
        RoundedButton(
          text: '알겠습니다',
          color: Color(0xff8BC34A),
          press: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return InputUserNameScreen();
                },
              ),
            );
          }
        )
      ]
      ),
      ),
    );
  }
}