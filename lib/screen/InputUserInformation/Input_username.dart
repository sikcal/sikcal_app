import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sikcal/components/RoundedButton.dart';
import 'package:sikcal/components/mytextformfield.dart';
import 'package:sikcal/data/constants.dart';
import 'package:sikcal/screen/InputUserInformation/input_start.dart';
import 'package:sikcal/screen/InputUserInformation/input_userbirth.dart';

class InputUserNameScreen extends ConsumerStatefulWidget {
  const InputUserNameScreen({Key? key}) : super(key: key);

  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends ConsumerState<InputUserNameScreen> {
  final usernamecontroller = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    usernamecontroller.text = ref.read(registerInfoUserProvider).name ?? "";
  }

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
                  Text('이름이 무엇인가요?', style: kLargeTextStyle),
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
                        if (value.length < 1) {
                          return '이름은 필수사항입니다.';
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
                        final form = _formkey.currentState;
                        if (form != null && !form.validate()) {
                        } else {
                          print(usernamecontroller.text);
                          ref.read(registerInfoUserProvider).name = usernamecontroller.text;
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
                      }),
                  const SizedBox(height: 30),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
