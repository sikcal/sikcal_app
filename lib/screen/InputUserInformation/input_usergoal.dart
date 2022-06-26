import 'package:flutter/material.dart';

import '../../components/button_green.dart';
import '../../components/button_grey.dart';

import 'package:sikcal/screen/InputUserInformation/Input_username.dart';
import 'package:sikcal/screen/InputUserInformation/input_usergender.dart';


class InputUserGoalScreen extends StatefulWidget {
  _InputUserGoalScreen createState() => _InputUserGoalScreen();
}

class _InputUserGoalScreen extends State<InputUserGoalScreen> {

  String? usergoal;
  List<Color> SelectedList =  [Colors.grey, Colors.grey, Colors.grey];

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
              changeButtonColor(0);
            },
            color: SelectedList[0]
        ),
        SizedBox(height: 25),
        Button_Grey(
            text: '체중 감량하기',
            press: () {
              usergoal = '체중 감량하기';
              changeButtonColor(1);
            },
            color: SelectedList[1]
        ),
        SizedBox(height: 25),
        Button_Grey(
            text: '체중 상관없이 식단 관리하기',
            press: () {
              usergoal = '체중 상관없이 식단 관리하기';
              changeButtonColor(2);
            },
            color: SelectedList[2]
        ),
        SizedBox(height: 25),
        Button_Green(
            text: '다음',
            press: () {
              if (usergoal == null) {

              }
              else {
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
            }
        ),
      ]
      ),
      ),
    );
  }
  void changeButtonColor(value){
    setState(() {
      for(int i = 0; i < SelectedList.length; i++) {
        if(i == value) {
          SelectedList[i] = Color(0xffff9800);
        }else {
          SelectedList[i] = Colors.grey;
        }
      }
    });
  }
}
