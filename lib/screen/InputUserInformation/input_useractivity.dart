import 'package:flutter/material.dart';

import '../../components/button_green.dart';
import '../../components/button_grey.dart';

import 'package:sikcal/screen/InputUserInformation/Input_username.dart';


class InputUserActivityScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
class Body extends StatelessWidget {

  String? useractivity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Column(children: <Widget>[
        SizedBox(height: 200),
        Container(
          child: Text('활동량이 어떻게 되나요?'),
        ),
        SizedBox(height: 50),
        Button_Grey(
            text: '가벼운 활동',
            press: () {
              useractivity = '가벼운 활동';
            }
        ),
        SizedBox(height: 25),
        Button_Grey(
            text: '중증도 활동',
            press: () {
              useractivity = '중증도 활동';
            }
        ),
        SizedBox(height: 25),
        Button_Grey(
            text: '강한 활동',
            press: () {
              useractivity = '강한 활동';
            }
        ),
        SizedBox(height: 25),
        Button_Grey(
            text: '아주 강한 활동',
            press: () {
              useractivity = '아주 강한 활동';
            }
        ),
        SizedBox(height: 25),
        Button_Green(
            text: '다음',
            press: () {
              print(useractivity);
              user.useractivity = useractivity;
              print('username : ${user.username}, userbirth : ${user.userbirth}, usergoal :${user.usergoal}, '
                  'usergender : ${user.usergender}, userheight: ${user.userheight}, userweight : ${user.userweight}, '
                  'usertargetweight: ${user.usertargetweight}, useractivity: ${user.useractivity}');
              null; //메인페이지로 이동
            }
        )
      ]
      ),
      ),
    );
  }
}