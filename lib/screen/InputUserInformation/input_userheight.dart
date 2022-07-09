import 'package:flutter/material.dart';
import 'package:sikcal/components/RoundedButton.dart';
import '../../components/mytextformfield.dart';

import 'package:sikcal/screen/InputUserInformation/Input_username.dart';
import 'package:sikcal/screen/InputUserInformation/input_userweight.dart';

class InputUserHeightScreen extends StatefulWidget {
  _FormScreenStateHeight createState() => _FormScreenStateHeight();
}
class _FormScreenStateHeight extends State<InputUserHeightScreen> {

  final userheightcontroller = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Column(children: <Widget>[
        SizedBox(height: 200),
        Container(
          child: Text('키가 얼마인가요?'),
        ),
        SizedBox(height: 50),
        Form(
          key: _formkey,
          child: MyTextFormField(
            obscureText: false,
            controller: userheightcontroller,
            label: '키를 입력해주세요',
            onSaved: (value) {
              setState(() {});
            },
            validator: (value) {
              if(value.length < 1) {
                return '키는 필수사항입니다.';
              }
              if (!RegExp('[0-9]').hasMatch(value)) {
                return '숫자를 입력해주세요';
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
                print(userheightcontroller.text);
                user.userheight = userheightcontroller.text;
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return InputUserWeightScreen();
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