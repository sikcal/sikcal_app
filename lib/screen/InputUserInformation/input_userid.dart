import 'package:flutter/material.dart';
import '../../components/RoundedButton.dart';
import '../../components/mytextformfield.dart';

import 'package:sikcal/screen/InputUserInformation/input_userbirth.dart';

import 'Input_username.dart';


class InputUserIdScreen extends StatefulWidget {
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<InputUserIdScreen> {

  final useridcontroller = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  String userid = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Column(children: <Widget>[
        SizedBox(height: 200),
        Container(
          child: Text('사용할 아이디를 입력해주세요.'),
        ),
        SizedBox(height: 50),
        Form(
          key: _formkey,
          child: MyTextFormField(
            controller: useridcontroller,
            label: '아이디를 입력해주세요',
            onSaved: (value) {
              setState(() {});
            },
            validator: (value) {
              if(value.length < 1) {
                return 'id는 필수사항입니다.';
              }else if (!isIdValid(value)) {
                return "중복된 id입니다.";
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
                print(useridcontroller.text);
                userid = useridcontroller.text;

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return InputUserNameScreen();
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

  bool isIdValid(value) {
    //id 중복 확인
    //중복일 경우 false return
    return true;
  }
}