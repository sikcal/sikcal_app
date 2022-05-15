import 'package:flutter/material.dart';

import '../../components/button_green.dart';
import '../../components/button_grey.dart';

import 'package:sikcal/screen/InputUserInformation/Input_username.dart';
import 'package:sikcal/screen/InputUserInformation/input_usergender.dart';


class InputUserGoalScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
class Body extends StatelessWidget {

  String? usergoal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Column(children: <Widget>[
        SizedBox(height: 200),
        Container(
          child: Text('식단을 관리하는 목표는 무엇인가요?'),
        ),
        SizedBox(height: 50),
        Button_Grey(
            text: '현재 체중 유지하기',
            press: () {
              usergoal = '현재 체중 유지하기';
            }
        ),
        SizedBox(height: 25),
        Button_Grey(
            text: '체중 감량하기',
            press: () {
              usergoal = '체중 감량하기';
            }
        ),
        SizedBox(height: 25),
        Button_Grey(
            text: '체중 상관없이 식단 관리하기',
            press: () {
              usergoal = '체중 상관없이 식단 관리하기';
            }
        ),
        SizedBox(height: 25),
        Button_Green(
            text: '다음',
            press: () {
              print(usergoal);
              user.usergoal = usergoal;
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return InputUserGenderScreen();
                  },
                ),
              );
            }
        ),
      ]
      ),
      ),
    );
  }
}