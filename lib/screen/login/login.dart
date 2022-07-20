import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sikcal/data/constants.dart';
import 'package:sikcal/data/providers.dart';
import 'package:sikcal/screen/InputUserInformation/input_start.dart';
import '../../components/RoundedButton.dart';
import '../../components/mytextformfield.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends ConsumerState<LoginScreen> {
  final useridcontroller = TextEditingController();
  final userpwcontroller = TextEditingController();

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
                  Text('아이디와 비밀번호를 입력해주세요.', style: kLargeTextStyle),
                  const SizedBox(height: 50),
                  Form(
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
                        }
                      },
                    ),
                  ),
                  const SizedBox(height: 25),
                  Form(
                    child: MyTextFormField(
                      obscureText: true,
                      controller: userpwcontroller,
                      label: '비밀번호를 입력해주세요',
                      onSaved: (value) {
                        setState(() {});
                      },
                      validator: (value) {
                        // TODO 서버 거랑 좀 다름..
                        // String pattern = r"^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d\w\W]{8,15}$";
                        // RegExp regExp = RegExp(pattern);
                        // if (!regExp.hasMatch(value)) {
                        //   return '문자와 숫자를 포함해 최소 8자에서 15자의 \n비밀번호를 입력해주세요.';
                        // }
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
                    press: () async {
                      // TODO validate
                      await ref.read(authRepoProvider).signIn(useridcontroller.text, userpwcontroller.text);
                      final user = ref.read(userProvider);
                      if (user == null) {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('아이디, 비밀번호를 확인해주세요')));
                        return;
                      } else {
                        Navigator.popUntil(context, (route) => route.isFirst);
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
}
