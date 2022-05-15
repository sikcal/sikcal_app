import 'package:flutter/material.dart';

import '../../components/textfield.dart';
import '../../components/button_green.dart';

import 'package:sikcal/screen/InputUserInformation/Input_username.dart';
import 'package:sikcal/screen/InputUserInformation/input_useractivity.dart';


class InputUserTargetWeightScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
class Body extends StatelessWidget {

  final usertargetweightcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Column(children: <Widget>[
        SizedBox(height: 200),
        Container(
          child: Text('목표 체중은 얼마인가요?'),
        ),
        SizedBox(height: 50),
        PlainTextField(
            controller: usertargetweightcontroller,
            text: '목표 체중을 입력해주세요.'
        ),
        SizedBox(height: 25),
        Button_Green(
            text: '다음',
            press: () {
              print(usertargetweightcontroller.text);
              user.usertargetweight = usertargetweightcontroller.text;
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return InputUserActivityScreen();
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