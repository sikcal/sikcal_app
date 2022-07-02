import 'package:flutter/material.dart';
import '../../components/RoundedButton.dart';
import '../../components/mytextformfield.dart';

import '../../model/user_basic.dart';

import 'package:sikcal/screen/InputUserInformation/input_userbirth.dart';


User user = User();

class InputUserNameScreen extends StatefulWidget {
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<InputUserNameScreen> {

  final usernamecontroller = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Column(children: <Widget>[
        SizedBox(height: 200),
        Container(
          child: Text('이름이 무엇인가요?'),
        ),
        SizedBox(height: 50),
        Form(
          key: _formkey,
          child: MyTextFormField(
            controller: usernamecontroller,
            label: '이름을 입력해주세요',
            onSaved: (value) {
              setState(() {});
            },
            validator: (value) {
              if(value.length < 1) {
                return '이름은 필수사항입니다.';
              }
            },
          ),
        ),
        SizedBox(height: 25),
        RoundedButton(
            text: '다음',
            color: Color(0xff8BC34A),
            press: () {
              final form = _formkey.currentState;
              if (form != null && !form.validate()) {
              }
              else {
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
                return;
              }
            }
        ),
      ]
      ),
      ),
    );
  }
}