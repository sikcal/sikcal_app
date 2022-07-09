import 'package:flutter/material.dart';
import '../../components/RoundedButton.dart';

import 'package:sikcal/screen/InputUserInformation/Input_username.dart';
import 'package:sikcal/screen/InputUserInformation/input_usergender.dart';

class InputUserGoalScreen extends StatefulWidget {
  const InputUserGoalScreen({Key? key}) : super(key: key);

  @override
  _InputUserGoalScreen createState() => _InputUserGoalScreen();
}

class _InputUserGoalScreen extends State<InputUserGoalScreen> {

  String? usergoal;
  List<Color> SelectedList =  [Colors.grey, Colors.grey, Colors.grey];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Column(children: <Widget>[
        const SizedBox(height: 200),
        const Text('식단을 관리하는 목표는 무엇인가요?'),
        const SizedBox(height: 50),
        RoundedButton(
            text: '현재 체중 유지하기',
            color: SelectedList[0],
            press: () {
              usergoal = '현재 체중 유지하기';
              changeButtonColor(0);
            },
        ),
        const SizedBox(height: 25),
        RoundedButton(
            text: '체중 감량하기',
            color: SelectedList[1],
            press: () {
              usergoal = '체중 감량하기';
              changeButtonColor(1);
            },
        ),
        const SizedBox(height: 25),
        RoundedButton(
            text: '체중 상관없이 식단 관리하기',
            color: SelectedList[2],
            press: () {
              usergoal = '체중 상관없이 식단 관리하기';
              changeButtonColor(2);
            },
        ),
        const SizedBox(height: 25),
        RoundedButton(
            text: '다음',
            color: const Color(0xff8BC34A),
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
          SelectedList[i] = const Color(0xffff9800);
        }else {
          SelectedList[i] = Colors.grey;
        }
      }
    });
  }
}
