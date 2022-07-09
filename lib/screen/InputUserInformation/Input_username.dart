import 'package:flutter/material.dart';
import '../../components/RoundedButton.dart';
import '../../components/mytextformfield.dart';

import 'package:sikcal/screen/InputUserInformation/input_userbirth.dart';

import '../../model/user_basic.dart';

User user = User();

class InputUserNameScreen extends StatefulWidget {
  const InputUserNameScreen({Key? key}) : super(key: key);

  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<InputUserNameScreen> {

  final usernamecontroller = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Column(children: <Widget>[
        const SizedBox(height: 200),
        const Text('이름이 무엇인가요?'),
        const SizedBox(height: 50),
        Form(
          key: _formkey,
          child: MyTextFormField(
            obscureText: false,
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
        const SizedBox(height: 25),
        RoundedButton(
            text: '다음',
            color: const Color(0xff8BC34A),
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