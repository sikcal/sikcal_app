import 'package:flutter/material.dart';
import '../../components/RoundedButton.dart';
import '../../components/mytextformfield.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<LoginScreen> {

  final useridcontroller = TextEditingController();
  final userpwcontroller = TextEditingController();
  String userid = "";
  String userpw = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Column(children: <Widget>[
        const SizedBox(height: 200),
        const Text('아이디와 비밀번호를 입력해주세요'),
        const SizedBox(height: 50),
        Form(
          child: MyTextFormField(
            obscureText: false,
            controller: useridcontroller,
            label: '아이디를 입력해주세요',
            onSaved: (value) {
              setState(() {});
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
          ),
        ),
        const SizedBox(height: 25),
        RoundedButton(
            text: '다음',
            color: const Color(0xff8BC34A),
            press: () {
            userid = useridcontroller.text;
            userpw = userpwcontroller.text;

            //id와 pw 검사후 맞으면 page 이동  틀리면 alert창

            }
        ),
      ]
      ),
      ),
    );
  }
}