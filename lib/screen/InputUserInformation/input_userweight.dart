import 'package:flutter/material.dart';
import '../../components/RoundedButton.dart';
import '../../components/mytextformfield.dart';

import 'package:sikcal/screen/InputUserInformation/Input_username.dart';
import 'package:sikcal/screen/InputUserInformation/input_useractivity.dart';

class InputUserWeightScreen extends StatefulWidget {
  _FormScreenStateWeight createState() => _FormScreenStateWeight();
}
class _FormScreenStateWeight extends State<InputUserWeightScreen> {

  final userweightcontroller = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Column(children: <Widget>[
        SizedBox(height: 200),
        Container(
          child: Text('현재 체중은 얼마인가요?'),
        ),
        SizedBox(height: 50),
        Form(
          key: _formkey,
          child: MyTextFormField(
            controller: userweightcontroller,
            label: '현재 체중을 입력해주세요',
            onSaved: (value) {
              setState(() {});
            },
            validator: (value) {
              if(value.length < 1) {
                return '현재 체중은 필수사항입니다.';
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