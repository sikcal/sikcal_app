import 'package:flutter/material.dart';
import 'package:sikcal/components/RoundedButton.dart';
import '../../components/mytextformfield.dart';

import 'package:sikcal/screen/InputUserInformation/Input_username.dart';
import 'package:sikcal/screen/InputUserInformation/input_userweight.dart';

class InputUserHeightScreen extends StatefulWidget {
  const InputUserHeightScreen({Key? key}) : super(key: key);

  @override
  _FormScreenStateHeight createState() => _FormScreenStateHeight();
}
class _FormScreenStateHeight extends State<InputUserHeightScreen> {

  final userheightcontroller = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Column(children: <Widget>[
        const SizedBox(height: 200),
        const Text('키가 얼마인가요?'),
        const SizedBox(height: 50),
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
        const SizedBox(height: 25),
        RoundedButton(
            text: '다음',
            color: const Color(0xff8BC34A),
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