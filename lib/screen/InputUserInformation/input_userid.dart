import 'package:flutter/material.dart';
import '../../components/RoundedButton.dart';
import '../../components/mytextformfield.dart';

import 'Input_username.dart';


class InputUserIdScreen extends StatefulWidget {
  const InputUserIdScreen({Key? key}) : super(key: key);

  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<InputUserIdScreen> {

  final useridcontroller = TextEditingController();
  final userpwcontroller = TextEditingController();
  final _formkeyId = GlobalKey<FormState>();
  final _formkeyPw = GlobalKey<FormState>();
  String userid = "";
  String userpw = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Column(children: <Widget>[
        const SizedBox(height: 200),
        const Text('사용할 아이디와 비밀번호를 입력해주세요.'),
        const SizedBox(height: 50),
        Form(
          key: _formkeyId,
          child: MyTextFormField(
            obscureText: false,
            controller: useridcontroller,
            label: '아이디를 입력해주세요',
            onSaved: (value) {
              setState(() {});
            },
            validator: (value) {
              if(value.length < 1) {
                return '아이디는 필수사항입니다.';
              }else if (!isIdValid(value)) {
                return "중복된 아이디입니다.";
              }
            },
          ),
        ),
        const SizedBox(height: 25),
        Form(
          key: _formkeyPw,
          child: MyTextFormField(
            obscureText: true,
            controller: userpwcontroller,
            label: '비밀번호를 입력해주세요',
            onSaved: (value) {
              setState(() {});
            },
            validator: (value) {
              String pattern = r"^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d\w\W]{8,15}$";
              RegExp regExp = RegExp(pattern);
              if(!regExp.hasMatch(value)) {
                return '문자와 숫자를 포함해 최소 8자에서 15자의 \n비밀번호를 입력해주세요.';
              }
            },
          ),
        ),
        const SizedBox(height: 25),
        RoundedButton(
            text: '다음',
            color: const Color(0xff8BC34A),
            press: () {
              final formId = _formkeyId.currentState;
              final formPw = _formkeyPw.currentState;

              if (formId != null && !formId.validate()) {
              }else if (formPw != null && !formPw.validate()){

              }
              else {
                //user id와 user pw 저장
                userid = useridcontroller.text;
                userpw = userpwcontroller.text;

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