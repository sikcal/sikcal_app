import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sikcal/components/RoundedButton.dart';
import 'package:sikcal/components/mytextformfield.dart';
import 'package:sikcal/data/constants.dart';
import 'package:sikcal/screen/InputUserInformation/input_start.dart';

class InputUserIdScreen extends ConsumerStatefulWidget {
  const InputUserIdScreen({Key? key}) : super(key: key);

  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends ConsumerState<InputUserIdScreen> {
  final useridcontroller = TextEditingController();
  final userpwcontroller = TextEditingController();
  final _formkeyId = GlobalKey<FormState>();
  final _formkeyPw = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: const [
            Image(
              image: AssetImage('images/fork.png'),
              height: 25.0,
            ),
            SizedBox(
              width: 10.0,
            ),
            Text(
              '식칼',
              style: TextStyle(
                fontSize: 25.0,
                color: Colors.white,
                decoration: TextDecoration.none,
                fontWeight: FontWeight.normal,
              ),
            ),
            SizedBox(
              width: 10.0,
            ),
            Image(
              image: AssetImage('images/knife.png'),
              height: 25.0,
            ),
          ],
          mainAxisSize: MainAxisSize.min,
        ),
        backgroundColor: primaryColor,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                children: [
                  const SizedBox(height: 100),
                  Text('사용할 아이디와 비밀번호를 입력해주세요.', style: kLargeTextStyle),
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
                        if (value.length < 1) {
                          return '아이디는 필수사항입니다.';
                        } else if (!isIdValid(value)) {
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
                        if (!regExp.hasMatch(value)) {
                          return '문자와 숫자를 포함해 최소 8자에서 15자의 \n비밀번호를 입력해주세요.';
                        }
                      },
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  RoundedButton(
                    text: '다음',
                    color: const Color(0xff8BC34A),
                    press: () {
                      final formId = _formkeyId.currentState;
                      final formPw = _formkeyPw.currentState;

                      if (formId != null && !formId.validate()) {
                      } else if (formPw != null && !formPw.validate()) {
                      } else {
                        final registerInfoUser = ref.read(registerInfoUserProvider);
                        registerInfoUser.id = useridcontroller.text;
                        registerInfoUser.pw = userpwcontroller.text;

                        print(registerInfoUser.toJson());

                        return; // TODO server
                      }
                    },
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ],
          ),
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
