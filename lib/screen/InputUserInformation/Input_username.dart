import 'package:flutter/material.dart';

import '../../model/User.dart';
import '../../components/textfield.dart';
import '../../components/button_green.dart';

import 'package:sikcal/screen/InputUserInformation/input_userbirth.dart';


User user = User();

class InputUserNameScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
class Body extends StatelessWidget {

  final usernamecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Column(children: <Widget>[
        SizedBox(height: 200),
        Container(
          child: Text('이름이 무엇인가요?'),
        ),
        SizedBox(height: 50),
        PlainTextField(
          controller: usernamecontroller,
          text: '이름을 입력해주세요'
        ),
        SizedBox(height: 25),
        Button_Green(
            text: '다음',
            press: () {
              print(usernamecontroller.text);
              user.username = usernamecontroller.text;
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return InputUserBirthScreen();
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