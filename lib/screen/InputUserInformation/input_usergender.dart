import 'package:flutter/material.dart';

import '../../components/button_green.dart';
import '../../components/button_grey.dart';

import 'package:sikcal/screen/InputUserInformation/Input_username.dart';
import 'package:sikcal/screen/InputUserInformation/input_userheight.dart';


class InputUserGenderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
class Body extends StatelessWidget {

  String? usergender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Column(children: <Widget>[
        SizedBox(height: 200),
        Container(
          child: Text('성별을 선택해 주세요.'),
        ),
        SizedBox(height: 50),
        Button_Grey(
            text: '여자',
            press: () {
              usergender = '여자';
            }
        ),
        SizedBox(height: 25),
        Button_Grey(
            text: '남자',
            press: () {
              usergender = '남자';
            }
        ),
        SizedBox(height: 25),
        Button_Green(
            text: '다음',
            press: () {
              print(usergender);
              user.usergender = usergender;
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return InputUserHeightScreen();
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