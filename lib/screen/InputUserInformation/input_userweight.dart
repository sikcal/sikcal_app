import 'package:flutter/material.dart';
import 'package:sikcal/screen/InputUserInformation/input_useractivity.dart';

import '../../components/textfield.dart';
import '../../components/button_green.dart';

import 'package:sikcal/screen/InputUserInformation/Input_username.dart';


class InputUserWeightScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
class Body extends StatelessWidget {

  final userweightcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Column(children: <Widget>[
        SizedBox(height: 200),
        Container(
          child: Text('현재 체중은 얼마인가요?'),
        ),
        SizedBox(height: 50),
        PlainTextField(
            controller: userweightcontroller,
            text: '현재 체중을 입력해주세요.'
        ),
        SizedBox(height: 25),
        Button_Green(
            text: '다음',
            press: () {
              print(userweightcontroller.text);
              user.userweight = userweightcontroller.text;
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return InputUserActivityScreen();
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